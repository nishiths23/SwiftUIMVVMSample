//
//  NoInternetView.swift
//  SwiftUIMusicPlayer
//
//  Created by Nishith on 15/06/2019.
//  Copyright © 2019 Nishith. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    @State var message: ErrorMessage 
    
    enum ErrorMessage {
        case noInternet, unknown, empty
    }
    
    var body: some View {
        VStack {
            if message != .empty{
                Image(systemName:"Stop")
            }
            Text(message == .unknown ? "An error occurred" : (message == .empty ? "No songs in library. Try downloading a few songs from the server." : "No internet connection"))
                .padding()
                .lineLimit(3)
        }
    }
}
