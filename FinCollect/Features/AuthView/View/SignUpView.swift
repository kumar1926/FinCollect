//
//  SignUpView.swift
//  FinCollect
//
//  Created by BizMagnets on 05/01/26.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isShowPassword: Bool = false
    @State private var isShowConfirmPassword: Bool = false
    var signInAction: () -> Void = {}
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                VStack{
                    Image("Logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(100)
                    Text("Create Account")
                        .font(.system(size: 30, weight: .bold, design: .monospaced))
                        
                        .padding(10)
                    Text("Start tracking your lending today")
                        .font(Font.system(size: 16, weight: .regular, design: .monospaced))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(UIColor.lightGray))
                }
                .padding(.horizontal,20)
                .padding(.bottom,10)
                VStack(spacing:15){
                    VStack(alignment: .leading, spacing: 6){
                        
                            Text("Full Name")
                                .font(Font.system(size: 16, weight: .semibold, design: .monospaced))
                            
                        
                        HStack{
                            Image(systemName: "person.fill")
                                .foregroundStyle(Color(UIColor.lightGray))
                                .padding(.trailing, 8)
                            TextField("Enter your name", text: $name)
                                .foregroundColor(Color(UIColor.label))
                                
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 14)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                        
                    }
                    VStack(alignment: .leading, spacing: 6){
                        
                            Text("Email")
                                .font(Font.system(size: 16, weight: .semibold, design: .monospaced))
                            
                        
                        HStack{
                            Image(systemName: "envelope.fill")
                                .foregroundStyle(Color(UIColor.lightGray))
                                .padding(.trailing, 8)
                            TextField("Enter your email", text: $email)
                                .foregroundColor(Color(UIColor.label))
                                
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 14)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                        
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text("Password")
                            .font(.system(size: 16, weight: .semibold, design: .monospaced))
                        
                        HStack {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                            
                            if isShowPassword {
                                TextField("Enter password", text: $password)
                                    .foregroundColor(.primary)
                                
                            } else {
                                
                                SecureField("Enter password", text: $password)
                                    .foregroundColor(.primary)
                            }
                            
                            Button {
                                isShowPassword.toggle()
                            } label: {
                                Image(systemName: isShowPassword ?  "eye.fill" :"eye.slash.fill")
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
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text("Confirm Password")
                            .font(.system(size: 16, weight: .semibold, design: .monospaced))
                        
                        HStack {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                            
                            if isShowConfirmPassword {
                                TextField("Enter password", text: $confirmPassword)
                                    .foregroundColor(.primary)
                                
                            } else {
                                
                                SecureField("Enter password", text: $confirmPassword)
                                    .foregroundColor(.primary)
                            }
                            
                            Button {
                                isShowConfirmPassword.toggle()
                            } label: {
                                Image(systemName: isShowConfirmPassword ?  "eye.fill" :"eye.slash.fill")
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
                }
                .padding(.horizontal,20)
                .padding(.vertical,5)
                Spacer()
                VStack(spacing: 20){
                    Button{
                        
                    }label: {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .buttonSizing(.flexible)
                    HStack{
                        Text("Already have an account?")
                            .font(.system(size: 14,weight: .light,design: .monospaced))
                        Button{
                            signInAction()
                        }label: {
                            Text("Sign in")
                                .font(.system(size: 14,weight: .light,design: .monospaced))
                        }
                    }
                    
                }
                .padding(.horizontal,20)
                .padding(.vertical,5)
                Spacer()
            }
        }
    }
}

#Preview {
    SignUpView()
}
