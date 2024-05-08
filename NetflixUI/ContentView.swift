//
//  ContentView.swift
//  NetflixUI
//
//  Created by 川尻辰義 on 2024/04/14.
//

import SwiftUI

struct ContentView: View {
    var appData: AppData = .init()
    
    var body: some View {
        ZStack {
            if !appData.isSplashFinished {
                SplashScreen()
            }
        }
        .environment(appData)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
