//
//  HistoryModel.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import Foundation

class HistoryModel {
    var text: String! = ""
    var isStar: Bool! = false
    
    init(text: String, isStar: Bool) {
        self.text = text
        self.isStar = isStar
    }
}
