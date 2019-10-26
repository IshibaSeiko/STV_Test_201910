//
//  ChannelListStruct.swift
//  YoutubeViewer
//
//  Created by STV-M025 on 2019/10/26.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

struct ChannelList: Codable {
    let id: id
    let chencels: chencels
}

struct id: Codable {
    let id: Int
}

struct chencels: Codable {
    let name: String
    let duration: String
    let number: Int
    let imageUrl: String
    let link: String
}

class ChannelListData: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var duration: String = ""
    @objc dynamic var number: Int = 0
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var link: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
