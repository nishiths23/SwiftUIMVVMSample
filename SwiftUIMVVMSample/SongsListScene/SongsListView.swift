//
//  ContentView.swift
//  SwiftUIMusicPlayer
//
//  Created by Nishith on 14/06/2019.
//  Copyright © 2019 Nishith. All rights reserved.
//

import SwiftUI
import Combine

struct SongsListView : View {
    @ObjectBinding var viewModel: SongsListViewModel

    var body: some View {
        VStack{
            if self.viewModel.sceneState == .default{
                List(viewModel.songs) { song in
                    Button(action: { self.viewModel.startDownloading(song) }) {
                        SongRow(song: song,beginDownloading: self.viewModel.startDownloading, stopDownloading: self.viewModel.stopDownloading )
                    }
                }
            } else if self.viewModel.sceneState == .loading {
                ActivityIndicator(style: .large)
            } else if self.viewModel.sceneState == .empty{
                ErrorView(message: .empty)
            } else if self.viewModel.sceneState == .noInternetError{
                ErrorView(message: .noInternet)
            } else if self.viewModel.sceneState == .unknownError{
                ErrorView(message: .unknown)
            }
        }
        .navigationBarTitle(Text("Songs on server"))
        .onAppear(perform: viewModel.sceneAppeared)
    }
}

#if DEBUG
struct SongsListView_Previews : PreviewProvider {
    var songs: [Song] = [Song(title: "New song", url: "", id: "")]
    static var previews: some View {
        SongsListView(viewModel: SongsListViewModel())
    }
}
#endif
