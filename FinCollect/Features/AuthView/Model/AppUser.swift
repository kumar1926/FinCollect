//
//  AppUser.swift
//  FinCollect
//
//  Created by BizMagnets on 07/01/26.
//

import Foundation

struct AppUser: Codable,Identifiable{
    var id: UUID = UUID()
    var name: String
    var email: String
    var joinedDate: Date
}
