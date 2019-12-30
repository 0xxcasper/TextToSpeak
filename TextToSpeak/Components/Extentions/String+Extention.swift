//
//  String+Extention.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import Foundation
import AVFoundation

extension String
{
    func configAVSpeechUtterance() -> AVSpeechUtterance {
        let utterance = AVSpeechUtterance(string: self)
        if let languageCode = UserDefaultHelper.shared.languageCode {
            utterance.voice = AVSpeechSynthesisVoice(language: languageCode)
        } else {
            utterance.voice = AVSpeechSynthesisVoice(language: AVSpeechSynthesisVoice.currentLanguageCode())
        }
        if let rate = UserDefaultHelper.shared.rate {
            utterance.rate = rate
        }
        if let pitch = UserDefaultHelper.shared.pitch {
            utterance.pitchMultiplier = pitch
        }
        return utterance
    }
}
