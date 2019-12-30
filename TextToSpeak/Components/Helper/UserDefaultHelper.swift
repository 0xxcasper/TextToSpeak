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
    case pitchMultiplier = "PitchMultiplier"
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
            save(value: rate, key: .languageCode)
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
    
    var pitchMultiplier: Float? {
        get {
            let value = get(key: .pitchMultiplier) as? Float
            return value
        }
        set(pitchMultiplier) {
            save(value: rate, key: .pitchMultiplier)
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
