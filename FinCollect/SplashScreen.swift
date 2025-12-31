//
//  SplashScreen.swift
//  FinCollect
//
//  Created by BizMagnets on 30/12/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var scale: CGFloat = 0.6
    @State private var opacity: Double = 0.0
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack(spacing:20){
                Image("Logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .scaleEffect(scale)
                    .opacity(opacity)
                Text("FinCollect")
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .foregroundColor(Color(UIColor(hex: "#1F5BEC")))

                Text("Lending made simple")
                    .font(.system(size: 15,weight: .regular, design: .monospaced))
                    .foregroundColor(Color(UIColor.lightGray))
            }
        }
        .onAppear(){
            withAnimation(.easeInOut(duration: 1.0)){
                scale = 1.0
                opacity = 1.0
            }
            
            
        }
    }
}

#Preview {
    SplashScreen()
}
