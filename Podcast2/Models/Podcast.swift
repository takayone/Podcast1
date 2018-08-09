//
//  Podcast.swift
//  Podcast2
//
//  Created by takahitoyoneda on 2018/08/04.
//  Copyright © 2018 takahitoyoneda. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl100: String?
    var trackCount: Int?
    var feedUrl: String?
}

