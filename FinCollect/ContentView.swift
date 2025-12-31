//
//  ContentView.swift
//  FinCollect
//
//  Created by BizMagnets on 30/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    var body: some View {
        ZStack{
            if isActive {
                Text("Hello, World!")
            } else {
                SplashScreen()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                isActive = true
            })
        }
    }
}

#Preview {
    ContentView()
}
