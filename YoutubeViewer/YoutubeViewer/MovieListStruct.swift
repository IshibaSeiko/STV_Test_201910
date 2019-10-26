//
//  MovieListStruct.swift
//  YoutubeViewer
//
//  Created by STV-M025 on 2019/10/26.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

struct MovieList: Codable {
    let user: user
    let videos: [video]
}

struct user: Codable {
    let id: Int
    let name: String
    let username: String
}

struct video: Codable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let numberOfViews: Int
    let channel: Channel
}

struct Channel: Codable {
    let name: String
    let profileImageUrl: String
    let numberOfSubscribers: Int
}

class MovieListData: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var link: String = ""
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var numberOfViews: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

func setMovieListDataFromAPI(data: MovieList) -> [MovieListData] {
    var setData: [MovieListData] = []
    
    for video in data.videos {
        let videoData = MovieListData()
        videoData.id = video.id
        videoData.name = video.name
        videoData.link = video.link
        videoData.imageUrl = video.imageUrl
        videoData.numberOfViews = video.numberOfViews
        setData.append(videoData)
    }
    return setData
}
