//
//  HistoryModel.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class HistoryModel: Object {
    enum Property: String {
        case id, text, hasStar
    }
    
    dynamic var id = UUID().uuidString
    dynamic var text = ""
    dynamic var isStar = false
    
    override static func primaryKey() -> String? {
        return HistoryModel.Property.id.rawValue
    }
    
    convenience init(_ text: String, with isStar: Bool = false) {
        self.init()
        self.text = text
        self.isStar = isStar
    }
}

extension HistoryModel {
    
    static func add(text: String, isStar: Bool = false, in realm: Realm = try! Realm()) -> HistoryModel {
        let historyModel = HistoryModel(text, with: isStar)
        try! realm.write {
            realm.add(historyModel)
        }
        return historyModel
    }
    
    static func getAll(in realm: Realm = try! Realm()) -> Results<HistoryModel> {
        return realm.objects(HistoryModel.self)
    }
    
    static func getAllHaveStar(in realm: Realm = try! Realm()) -> Results<HistoryModel> {
        return realm.objects(HistoryModel.self).filter("ANY item.isStar == true")
    }
    
    func edit() {
        guard let realm = realm else { return }
        try! realm.write {
            isStar = !isStar
        }
    }
    
    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}
