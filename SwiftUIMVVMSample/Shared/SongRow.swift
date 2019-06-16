//
//  SongRow.swift
//  SwiftUIMusicPlayer
//
//  Created by Nishith on 16/06/2019.
//  Copyright © 2019 Nishith. All rights reserved.
//

import SwiftUI

struct SongRow: View {
    var song: Song
    var beginDownloading: (Song) -> Void
    var stopDownloading: (Song) -> Void
    
    var body: some View {
        Button(action: { self.beginDownloading(self.song) }) {
            HStack {
                Image("defaultmp3icon")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                Text(verbatim: song.title)
                if song.isDownloading && song.downloadProgress < 1 {
                    Spacer()
                    SwiftUIDownloadView(progress: song.downloadProgress, action: { self.stopDownloading(self.song) })
                }
            }
        }
    }
}

