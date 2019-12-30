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
