//
//  ChannelListStruct.swift
//  YoutubeViewer
//
//  Created by STV-M025 on 2019/10/26.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

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
