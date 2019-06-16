//
//  SongsListViewModel.swift
//  SwiftUIMusicPlayer
//
//  Created by Nishith on 15/06/2019.
//  Copyright © 2019 Nishith. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class SongsListViewModel:BindableObject {
    var didChange = PassthroughSubject<SongsListViewModel, Never>()
    
    private(set) var songs: [Song] = [Song]() {
        didSet{
            if songs.isEmpty{
                sceneState = .empty
            }else{
                sceneState = .default
            }
        }
    }
    
    private(set) var sceneState : SceneState = .default{
        didSet{
            didChange.send(self)
        }
    }
        
    init() {
        self.sceneState = .loading
    }
    
    func sceneAppeared() {
        URLSession.shared.send(request: URLRequest(url: URL(string: "https://us-central1-musicprovider-f87bf.cloudfunctions.net/songs")!))
            .mapError {[weak self] (error:RequestError) -> Error in
                switch error{
                case .noInternetConnection: self?.sceneState = .noInternetError
                default:self?.sceneState = .unknownError
                }
                return error
            }
            .map { $0.data }
            .decode(type: [Song].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(subscriber: Subscribers.Assign(object: self, keyPath: \.songs))
    }
    
    func stopDownloading(_ song:Song) {
        
    }
    
    func startDownloading(_ song:Song) {
        
    }
}
    

