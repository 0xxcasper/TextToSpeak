//
//  VoiceModel.swift
//  sanggggg
//
//  Created by Sang on 12/30/19.
//  Copyright © 2019 Carbro. All rights reserved.
//

import Foundation

struct VoiceModel {

    var name : String!
    var voice : String!
    var isPlaying : Bool = false

    init(fromDictionary dictionary: [String:Any]) {
        name = dictionary["name"] as? String
        voice = dictionary["voice"] as? String
    }

    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if name != nil{
            dictionary["name"] = name
        }
        if voice != nil{
            dictionary["voice"] = voice
        }
        return dictionary
    }
    
    mutating func setIsPlaying(_ isPlay: Bool) {
        isPlaying = isPlay
    }
}
