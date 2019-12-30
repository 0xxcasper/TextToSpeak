//
//  SectionVoiceModel.swift
//  sanggggg
//
//  Created by Sang on 12/30/19.
//  Copyright © 2019 Carbro. All rights reserved.
//

import Foundation

struct SectionVoiceModel{

    var code : String!
    var listVoices : [VoiceModel]!
    var title : String!

    init(fromDictionary dictionary: [String:Any]) {
        code = dictionary["code"] as? String
        listVoices = [VoiceModel]()
        if let countryArray = dictionary["listVoices"] as? [[String:Any]]{
            for dic in countryArray{
                let value = VoiceModel(fromDictionary: dic)
                listVoices.append(value)
            }
        }
        title = dictionary["title"] as? String
    }

    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if code != nil{
            dictionary["code"] = code
        }
        if listVoices != nil{
            var dictionaryElements = [[String:Any]]()
            for countryElement in listVoices {
                dictionaryElements.append(countryElement.toDictionary())
            }
            dictionary["listVoices"] = dictionaryElements
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }

}
