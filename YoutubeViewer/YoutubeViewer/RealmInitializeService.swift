//
//  RealmInitializeService.swift
//  YoutubeViewer
//
//  Created by STV-M025 on 2019/10/26.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import RealmSwift

protocol RealmInitializeService {
    var configuration: Realm.Configuration? { get }
    func initializeRealm() -> Realm
}
