//
//  PodcastCell.swift
//  Podcast2
//
//  Created by takahitoyoneda on 2018/08/05.
//  Copyright © 2018 takahitoyoneda. All rights reserved.
//

import UIKit
import SDWebImage

class PodcastCell:UITableViewCell{
    
    @IBOutlet weak var pocastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    
    var podcast: Podcast!{
        didSet{
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            
            episodeCountLabel.text = "\(podcast.trackCount ?? 0) Episodes"
            
            guard let url = URL(string: podcast.artworkUrl100 ?? "") else {return}
            
//            URLSession.shared.dataTask(with: url) { (data1, _, _) in
//                print("finished downloading data", data1)
//                guard let data = data1 else {return}
//                DispatchQueue.main.async {
//                    self.pocastImageView.image = UIImage(data: data)
//                }
//
//            }.resume()
            
            pocastImageView.sd_setImage(with: url, completed: nil)

            
        }
    }
    
}
