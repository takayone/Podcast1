//
//  APIService.swift
//  Podcast2
//
//  Created by takahitoyoneda on 2018/08/05.
//  Copyright © 2018 takahitoyoneda. All rights reserved.
//

import Foundation
import Alamofire
import FeedKit

class APIService{
    
    static let shared = APIService()
    
    func fetchEpisodes(feedUrl: String, completionHandler: @escaping ([Episode]) -> ()){
        
        //http -> https
        let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        
        guard let url = URL(string: secureFeedUrl) else {return}
        
        
        DispatchQueue.global(qos: .background).async {
            let parser = FeedParser(URL: url)
            parser?.parseAsync(result: { (result) in
                print("successfully parse feed:", result.isSuccess)
                
                if let err = result.error{
                    print("failed to parse XML feed", err)
                    return
                }
                
                guard let feed = result.rssFeed else {return}
                
                let episodes = feed.toEpisodes()
                completionHandler(episodes)
            })
        }
        

        
    }
    
    let baseiTunesSearchUrl = "https://itunes.apple.com/search"
    
    func fetchPodcasts(searchText: String, completionHandler:@escaping ([Podcast]) -> ()){
        
       
        let parameters = ["term": searchText, "media": "podcast"]
        
    
        Alamofire.request(baseiTunesSearchUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            if let err = dataResponse.error{
                print("failed to contact yahoo", err)
                return
            }
            
            guard let data = dataResponse.data else {return}
            
            do{
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                completionHandler(searchResult.results)
            
            }catch let decodeErr{
                print("failed to decode:",decodeErr)
            }
            
        }
        
        
    }
    
    struct SearchResults: Decodable{
        let resultCount: Int
        let results: [Podcast]
    }
    
    
}
