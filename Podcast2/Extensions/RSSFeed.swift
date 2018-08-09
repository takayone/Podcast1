//
//  RSSFeed.swift
//  Podcast2
//
//  Created by takahitoyoneda on 2018/08/06.
//  Copyright © 2018 takahitoyoneda. All rights reserved.
//

import FeedKit

extension RSSFeed{
    
    func toEpisodes() -> [Episode]{
        
        let imageUrl = iTunes?.iTunesImage?.attributes?.href
        
        var episodes = [Episode]()
        
        items?.forEach({ (feedItem) in
            var episode = Episode(feedItem: feedItem)
            
            if episode.imageUrl == nil{
                episode.imageUrl = imageUrl
            }
            episodes.append(episode)
        })
        
        return episodes
    }
}
