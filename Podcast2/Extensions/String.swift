//
//  String.swift
//  Podcast2
//
//  Created by takahitoyoneda on 2018/08/06.
//  Copyright © 2018 takahitoyoneda. All rights reserved.
//

import Foundation

extension String{
    func toSecureHTTPS() -> String{
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
