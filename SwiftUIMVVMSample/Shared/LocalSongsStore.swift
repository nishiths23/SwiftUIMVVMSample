//
//  LocalSongsStore.swift
//  SwiftUIMusicPlayer
//
//  Created by Nishith on 15/06/2019.
//  Copyright © 2019 Nishith. All rights reserved.
//

import Combine
import SwiftUI

class LocalSongsStore: BindableObject {
    
    static let shared = LocalSongsStore()
    
    private init(){}
    
    var didChange = PassthroughSubject<[Song], Never>()
    
    var songs: [Song] = [] {
        didSet{
            if songs.isEmpty{
                sceneState = .empty
            }else{
                sceneState = .default
            }
        }
    }
    
    private(set) var sceneState : SceneState = .empty{
        didSet{
            didChange.send(songs)
        }
    }
    
}
