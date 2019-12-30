//
//  SelectVoiceViewController.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import UIKit
import AVFoundation

class SelectVoiceViewController: UIViewController {
    
    @IBOutlet weak var tbView: UITableView!
    
    var data = [String: [AVSpeechSynthesisVoice]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AVSpeechSynthesisVoice.speechVoices().forEach { (voice) in
            if Array(self.data.keys).contains(String(voice.language.prefix(2))) {
                self.data[String(voice.language.prefix(2))]?.append(voice)
            } else {
                self.data[String(voice.language.prefix(2))] = [voice]
            }
        }
        
        print(data)
    }

}
