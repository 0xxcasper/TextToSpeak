//
//  BaseViewController.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import Foundation
import UIKit


class BaseViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        addKeyboardNotification()
    }
    
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func dismissKeyBoard() {
        self.view.endEditing(true)
    }
    
    @objc func dismissKeyboard() {
        dismissKeyBoard()
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        
    }
}
