//
//  EpisodeCell.swift
//  Podcast2
//
//  Created by takahitoyoneda on 2018/08/06.
//  Copyright © 2018 takahitoyoneda. All rights reserved.
//

import UIKit
import SDWebImage

class EpisodeCell: UITableViewCell {

    var episode: Episode!{
        didSet{
            titleLabel.text = episode.title
            descriptionLabel.text = episode.description
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            pubDateLabel.text =  dateFormatter.string(from: episode.pubDate)
            
            let url = URL(string: episode.imageUrl?.toSecureHTTPS() ?? "")
            episodeImageView.sd_setImage(with: url, completed: nil)

        }
    }
   
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    
    
    
}
