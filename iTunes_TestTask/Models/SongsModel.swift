//
//  SongsModel.swift
//  iTunes_TestTask
//
//  Created by Zenya Kirilov on 17.10.22.
//

import Foundation

struct SongsModel: Decodable {
    let results: [Song]
}

struct Song: Decodable {
    let trackName: String?
}
