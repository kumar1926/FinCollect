//
//  LoginView.swift
//  FinCollect
//
//  Created by BizMagnets on 02/01/26.
//

import SwiftUI

struct LoginView: View {
    @State private var showPassword: Bool = false
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack{
            VStack{
                VStack(spacing: 0){
                    Image("Logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(100)
                    
                    Text("FinCollect")
                        .font(.system(size: 30, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(UIColor(hex: "#1F5BEC")))
                        .padding(10)
                    Text("Manage your loans and collect interest efficiently.")
                        .font(Font.system(size: 16, weight: .regular, design: .monospaced))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(UIColor.lightGray))
                }
                .padding(.horizontal,15)
                .padding(.bottom,10)
                VStack{
                    HStack{
                        Text("Email")
                            .font(Font.system(size: 16, weight: .semibold, design: .monospaced))
                        Spacer()
                    }
                    HStack{
                        Image(systemName: "envelope.fill")
                            .foregroundStyle(Color(UIColor.lightGray))
                            .padding(.leading, 8)
                        TextField("Enter your email", text: $email)
                            .foregroundColor(Color(UIColor.label))
                            .padding(15)
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                    
                }
                .padding(.horizontal,20)
                .padding(.vertical,5)
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text("Password")
                        .font(.system(size: 16, weight: .semibold, design: .monospaced))
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.gray)
                        
                        if showPassword {
                            TextField("Enter password", text: $password)
                                .foregroundColor(.primary)
                        } else {
                            
                            SecureField("Enter password", text: $password)
                                .foregroundColor(.primary)
                        }
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ?  "eye.fill" :"eye.slash.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                HStack{
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Forgot Password?")
                            .font(.system(size: 16,weight: .bold, design: .monospaced))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                Spacer()
            }
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.automatic)
        }
       
    }
}

#Preview {
    LoginView()
}
