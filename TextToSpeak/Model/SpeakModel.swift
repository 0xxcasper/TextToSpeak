//
//  SpeakModel.swift
//  TextToSpeak
//
//  Created by SangNX on 1/1/20.
//  Copyright © 2020 SangNX. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class SpeakModel: Object {
    enum Property: String {
        case id, text, hasStar
    }
    
    dynamic var id = UUID().uuidString
    dynamic var text = ""
    dynamic var hasStar = false
    
    override static func primaryKey() -> String? {
        return SpeakModel.Property.id.rawValue
    }
    
    convenience init(_ name: String, hasStar: Bool = false) {
        self.init()
        self.text = text
        self.hasStar = hasStar
    }
}
