//
//  TextViewController.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import UIKit
import AVFoundation

class TextViewController: BaseViewController {
    // MARK: - View Elements
    @IBOutlet weak var txView: UITextView!
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var controlBar: ControlBar!
    @IBOutlet weak var bottomAnchorControllBar: NSLayoutConstraint!
    @IBOutlet weak var heightAnchorTxView: NSLayoutConstraint!
    
    // MARK: - Properties
    private var synthesizer = AVSpeechSynthesizer()
    private var data = [HistoryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpTableView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        txView.addShadow()
    }
    
    // MARK: - Handle Keyboard

    override func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            bottomAnchorControllBar.constant = keyboardHeight - Constant.STATUS_BAR_BOTTOM - Constant.TAB_BAR_HEIGHT
            view.layoutIfNeeded()
        }
    }
    
    override func keyboardWillHide(_ notification: NSNotification) {
        bottomAnchorControllBar.constant = 0
        view.layoutIfNeeded()
        self.resetControlBar()
        self.resetTextView()
    }
}

// MARK: - Private 's Method

private extension TextViewController
{
    func setUpViews() {
        txView.textColor = .lightGray
        txView.text = "Tap here to type!"
        txView.delegate = self
        controlBar.delegate = self
        synthesizer.delegate = self
    }
    
    func setUpTableView() {
        tbView.registerXibFile(TextTableViewCell.self)
        tbView.rowHeight = 50
        tbView.separatorStyle = .none
        tbView.dataSource = self
        tbView.delegate = self
    }
    
    func textToSpeech(_ text: String) {
        let utterance = text.configAVSpeechUtterance()
        synthesizer.speak(utterance)
    }
    
    func updateLayoutTextView(_ text: String) {
        let font = UIFont.systemFont(ofSize: 15)
        let maxSize = CGSize(width: txView.bounds.width, height: CGFloat.greatestFiniteMagnitude)

        let size = (text as NSString).boundingRect(with: maxSize,
                options: [.usesLineFragmentOrigin, .usesFontLeading],
                attributes: [NSAttributedString.Key.font:font],
                context: nil).size
        if size.height < 200 && size.height > 33 {
            self.heightAnchorTxView.constant = size.height + 10
            self.view.layoutIfNeeded()
        }
    }
    
    func resetTextView() {
        self.txView.isEditable = true
        self.txView.text = ""
        self.textViewDidEndEditing(self.txView)
        self.heightAnchorTxView.constant = 33
        self.view.layoutIfNeeded()
    }
    
    func resetControlBar() {
        self.controlBar.isPlay = true
        self.controlBar.isEnable = false
        self.controlBar.isStop = false
        self.tbView.isHidden = false
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate 's Method

extension TextViewController: UITableViewDataSource, UITableViewDelegate, TextTableViewCellDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeue(TextTableViewCell.self, for: indexPath)
        cell.delegate = self
        cell.lblTitle.text = data[indexPath.row].text
        cell.isSelectedStar = data[indexPath.row].isStar
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        dismissKeyBoard()
    }
    
    func didTapCell(_ index: Int) {
        self.updateLayoutTextView(data[index].text)
        self.txView.text = data[index].text
        self.txView.textColor = .black
        self.tbView.isHidden = true
        self.controlBar.isPlay = true
        self.controlBar.isEnable = true
        self.controlBar.isStop = false
        //self.textToSpeech(data[index].text)
    }
    
    func didTapStarCell(_ index: Int) {
        self.data[index].isStar.toggle()
        self.tbView.reloadData()
    }
}

// MARK: - UITextFieldDelegate's Method

extension TextViewController: UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if txView.textColor == .lightGray && txView.isFirstResponder {
            txView.text = nil
            txView.textColor = .black
            tbView.isHidden = true
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if txView.text.isEmpty || txView.text == "" {
            tbView.isHidden = false
            txView.textColor = .lightGray
            txView.text = "Tap here to type!"
            txView.endEditing(true)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if let text = textView.text, !text.isEmpty {
            self.controlBar.isEnable = true
            self.updateLayoutTextView(text)
        } else {
            self.controlBar.isEnable = false
        }
    }
}

// MARK: - ControlBarDelegate's Method

extension TextViewController: ControlBarDelegate
{
    func didTapPlayControlBar() {
        guard let text = self.txView.text else { return }
        if !text.isEmpty && !synthesizer.isPaused {
            self.textToSpeech(text)
            if !data.contains(where: {$0.text == text}) {
                let hisModel = HistoryModel(text: text, isStar: false)
                self.data.append(hisModel)
                self.data = data.reversed()
                self.tbView.reloadData()
            }
        } else {
            synthesizer.continueSpeaking()
        }
    }
    
    func didTapPauseControlBar() {
        synthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    func didTapStopControlBar() {
        self.txView.text = ""
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    func didTapClearControlBar() {
        self.resetControlBar()
        self.resetTextView()
    }
    
    func didTapMoreControlBar() {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Export Audio", style: .default , handler:{ (UIAlertAction)in
            if #available(iOS 13.0, *) {
                if let text = self.txView.text {
                    self.synthesizer.write(text.configAVSpeechUtterance()) { (buffer) in
                        guard let pcmBuffer = buffer as? AVAudioPCMBuffer else {
                            fatalError("unknown buffer type: \(buffer)")
                        }
                        if pcmBuffer.frameLength == 0 {
                            // done
                        } else {
                            do {
                                let output = try AVAudioFile(forWriting: URL(fileURLWithPath: "test.wav"),settings: pcmBuffer.format.settings, commonFormat: .pcmFormatInt16, interleaved: false)
                                try output.write(from: pcmBuffer)
                            } catch {
                                
                            }
                            
                        }
                    }
                }
            }
        }))

        alert.addAction(UIAlertAction(title: "Add to Starred", style: .default , handler:{ (UIAlertAction)in
            
        }))
        
        alert.addAction(UIAlertAction(title: "Copy to Clipboard", style: .default , handler:{ (UIAlertAction)in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - AVSpeechSynthesizerDelegate's Method

extension TextViewController: AVSpeechSynthesizerDelegate
{
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        self.txView.isEditable = false
        self.tbView.isHidden = true
        self.controlBar.isPlay = false
        self.controlBar.isEnable = true
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.resetControlBar()
        self.resetTextView()
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        self.resetControlBar()
        self.resetTextView()
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        self.controlBar.isPlay = true
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        self.controlBar.isPlay = false
    }
}
