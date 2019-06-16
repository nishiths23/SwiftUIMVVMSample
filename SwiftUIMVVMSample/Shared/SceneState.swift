//
//  SceneState.swift
//  SwiftUIMusicPlayer
//
//  Created by Nishith on 15/06/2019.
//  Copyright © 2019 Nishith. All rights reserved.
//

import Foundation

enum SceneState {
    case loading, empty, `default`, noInternetError, unknownError
}

enum UIError: Error {
    case noInternet, unknown
}
