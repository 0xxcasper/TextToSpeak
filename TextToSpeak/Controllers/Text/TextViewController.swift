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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        txf.delegate = self
        controlBar.delegate = self
    }
    
    // MARK: - Handle Keyboard

    override func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            bottomAnchorControllBar.constant = keyboardHeight - Constant.STATUS_BAR_BOTTOM - Constant.TAB_BAR_HEIGHT
            tbView.isHidden = true
            view.layoutIfNeeded()
        }
    }
    
    override func keyboardWillHide(_ notification: NSNotification) {
        bottomAnchorControllBar.constant = 0
        tbView.isHidden = false
        view.layoutIfNeeded()
    }
}

// MARK: - UITextFieldDelegate's Method

extension TextViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyBoard()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

// MARK: - ControlBarDelegate's Method

extension TextViewController: ControlBarDelegate
{
    func didTapPlayControlBar() {
        if let text = self.txf.text {
            let utterance = text.configAVSpeechUtterance()
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        }
    }
    
    func didTapClearControlBar() {
        
    }
    
    func didTapMoreControlBar() {
        
    }
}
