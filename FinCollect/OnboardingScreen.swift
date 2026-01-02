//
//  OnboardingScreen.swift
//  FinCollect
//
//  Created by BizMagnets on 02/01/26.
//

import SwiftUI

struct OnboardingScreen: View {
    @State private var currentPage = 0
    var skipAction: () -> Void = { }
    var finishAction: () -> Void = { }
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Skip") {
                    skipAction()
                }
                .buttonStyle(.bordered)
                .controlSize(.small)
                .tint(.gray)
            }
            .padding()
            TabView(selection: $currentPage) {
                OnboardingView(imageName: "preview1", heading: "Never Forget a Loan", paragraph: "Easily record who owes you money and when it's due. Financial clarity starts here.")
                    .tag(0)
                OnboardingView(imageName: "preview2", heading: "Collect Interest on Your Terms", paragraph: "Set custom schedules to collect interest weekly or monthly. We handle the calculations so you don't have to.")
                    .tag(1)
                OnboardingView(imageName: "preview3", heading: "Ready to Collect?", paragraph: "Join thousands of lenders who track loans, automate reminders, and secure their interest with finCollect.")
                    .tag(2)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(maxHeight: .infinity)
            Button {
               
                if currentPage < 2 {
                    withAnimation {
                        currentPage += 1
                    }
                }else{
                    finishAction()
                }
            } label: {
                HStack{
                    Text(currentPage == 2 ? "Get Started" : "Next")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                    Image(systemName: "arrow.right")
                        
                }
                
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding()
            .buttonSizing(.flexible)
        }
    }
}

#Preview {
    OnboardingScreen()
}

struct OnboardingView:View {
    var imageName:String
    var heading:String
    var paragraph:String
    
    var body: some View {
        VStack(spacing: 0){
            Image(imageName)
                .resizable()
                .frame(width: 300,height: 300)
                .cornerRadius(40)
            Text(heading)
                .font(.system(size: 27, weight: .bold, design: .monospaced))
                .multilineTextAlignment(.center)
                .bold()
                .padding(20)
            Text(paragraph)
                .font(.system(size: 15, weight: .regular, design: .monospaced))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(UIColor.lightGray))
                .padding()
        }
    }
}

