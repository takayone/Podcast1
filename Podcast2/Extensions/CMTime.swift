//
//  CMTime.swift
//  Podcast2
//
//  Created by takahitoyoneda on 2018/08/07.
//  Copyright © 2018 takahitoyoneda. All rights reserved.
//

import AVKit

extension CMTime{
    
    func toDisplayString() -> String{
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minutes = totalSeconds % (60 * 60) / 60
        let hours = totalSeconds / 60 / 60
        let timeFormatString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        return timeFormatString
    }
}
