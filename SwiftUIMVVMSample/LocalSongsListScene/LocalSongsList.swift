//
//  LocalSongsList.swift
//  SwiftUIMusicPlayer
//
//  Created by Nishith on 15/06/2019.
//  Copyright © 2019 Nishith. All rights reserved.
//

import SwiftUI

struct LocalSongsList: View {
    @ObjectBinding var viewModel: LocalSongsStore = LocalSongsStore.shared
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationButton(destination: SongsListView(viewModel: SongsListViewModel())) {
                    HStack {
                        Spacer()
                        Text("Download songs from server")
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                }
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                if self.viewModel.sceneState == .default {
                    List(viewModel.songs) { song in
                        SongRow(song: song,beginDownloading: { _ in },stopDownloading: { _ in })
                    }
                    .navigationBarTitle(Text("Songs on device"))
                } else if self.viewModel.sceneState == .empty{
                    Spacer()
                    ErrorView(message: .empty)
                        .navigationBarTitle(Text("Songs on device"))
                    Spacer()
                }
            }
        }
    }
}

#if DEBUG
struct LocalSongsList_Previews : PreviewProvider {
    var songs: [Song] = [Song(title: "New song", url: "", id: "")]
    static var previews: some View {
        LocalSongsList()
    }
}
#endif
