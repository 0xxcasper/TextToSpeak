//
//  UserDefaultHelper.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import Foundation


private enum UserDefaultHelperKey: String {
    case languageCode = "Code"
    case rate = "Rate"
    case pitch = "Pitch"
    case voiceCode = "voiceCode"
    case nameVoice = "nameVoice"
}

class UserDefaultHelper {
    
    static let shared = UserDefaultHelper()
    private let userDefaultManager = UserDefaults.standard

    var languageCode: String? {
        get {
            let value = get(key: .languageCode) as? String
            return value
        }
        set(languageCode) {
            save(value: languageCode, key: .languageCode)
        }
    }
    
    var rate: Float? {
        get {
            let value = get(key: .rate) as? Float
            return value
        }
        set(rate) {
            save(value: rate, key: .rate)
        }
    }
    
    var pitch: Float? {
        get {
            let value = get(key: .pitch) as? Float
            return value
        }
        set(pitch) {
            save(value: pitch, key: .pitch)
        }
    }
    
    var voiceCode: String? {
        get {
            let value = get(key: .voiceCode) as? String ?? Arthur_Bundle
            return value
        }
        set(rate) {
            save(value: rate, key: .voiceCode)
        }
    }
    
    var nameVoice: String? {
        get {
            let value = get(key: .nameVoice) as? String ?? Arthur + " - " + STR_UNITED_KINGDOM
            return value
        }
        set(rate) {
            save(value: rate, key: .nameVoice)
        }
    }
}
   
extension UserDefaultHelper {
    
    private func save(value: Any?, key: UserDefaultHelperKey) {
        userDefaultManager.set(value, forKey: key.rawValue)
        userDefaultManager.synchronize()
    }
    
    private func get(key: UserDefaultHelperKey) -> Any? {
        return userDefaultManager.object(forKey: key.rawValue)
    }
}
