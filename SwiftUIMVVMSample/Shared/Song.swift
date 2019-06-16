//
//  Song.swift
//  SwiftUIMusicPlayer
//
//  Created by Nishith on 14/06/2019.
//  Copyright © 2019 Nishith. All rights reserved.
//

import Foundation
import SwiftUI

struct Song: Codable, Hashable, Identifiable {
    var title: String
    var url: String
    var id: String
    var isDownloading = false
    var downloadProgress: Float = 0
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case url = "url"
        case id = "id"
    }
}
