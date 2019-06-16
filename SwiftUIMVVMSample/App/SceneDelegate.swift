//
//  SceneDelegate.swift
//  SwiftUIMVVMSample
//
//  Created by Nishith on 16/06/2019.
//  Copyright © 2019 Nishith. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView:
            LocalSongsList()
        )
        self.window = window
        window.makeKeyAndVisible()
    }
}

