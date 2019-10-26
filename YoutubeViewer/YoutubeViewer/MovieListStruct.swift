//
//  MovieListStruct.swift
//  YoutubeViewer
//
//  Created by STV-M025 on 2019/10/26.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

struct MovieList {
    let user: user
    let videos: videos
}

struct user: Codable {
    let id: Int
    let username: String
}

struct videos: Codable {
    let id: String
    let name: String
    let link: String
    let imageUrl: String
    let numberOfViews: Int
    let channel: Channel
}

struct Channel: Codable {
    let name: String
    let profileImageUrl: String
}
