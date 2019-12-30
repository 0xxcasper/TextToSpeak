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
    @IBOutlet weak var txf: UITextField!
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var controlBar: ControlBar!
    @IBOutlet weak var bottomAnchorControllBar: NSLayoutConstraint!
        
    // MARK: - Properties
    private var synthesizer = AVSpeechSynthesizer()
    private var data = [HistoryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpTableView()
    }
    
    private func setUpViews() {
        txf.addTarget(self, action: #selector(TextViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        txf.delegate = self
        controlBar.delegate = self
        synthesizer.delegate = self
    }
    
    private func setUpTableView() {
        tbView.registerXibFile(TextTableViewCell.self)
        tbView.rowHeight = 50
        tbView.dataSource = self
        tbView.delegate = self
    }
    
    private func textToSpeech(_ text: String) {
        let utterance = text.configAVSpeechUtterance()
        synthesizer.speak(utterance)
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
        self.txf.text = data[index].text
        self.textToSpeech(data[index].text)
    }
    
    func didTapStarCell(_ index: Int) {
        data[index].isStar.toggle()
        tbView.reloadData()
    }
}

// MARK: - UITextFieldDelegate's Method

extension TextViewController: UITextFieldDelegate
{
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            self.controlBar.isEnable = true
        } else {
            self.controlBar.isEnable = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyBoard()
        return true
    }
}

// MARK: - ControlBarDelegate's Method

extension TextViewController: ControlBarDelegate
{
    func didTapPlayControlBar() {
        guard let text = self.txf.text else { return }
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
        self.txf.text = ""
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    func didTapClearControlBar() {
        self.txf.text = ""
    }
    
    func didTapMoreControlBar() {
        
    }
}

// MARK: - AVSpeechSynthesizerDelegate's Method

extension TextViewController: AVSpeechSynthesizerDelegate
{
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        self.tbView.isHidden = true
        self.controlBar.isPlay = false
        self.controlBar.isEnable = true
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.controlBar.isPlay = true
        self.controlBar.isEnable = false
        self.controlBar.isStop = false
        self.tbView.isHidden = false
        self.txf.text = ""
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        self.controlBar.isPlay = true
        self.controlBar.isEnable = false
        self.tbView.isHidden = false
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        self.controlBar.isPlay = true
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        self.controlBar.isPlay = false
    }
}
