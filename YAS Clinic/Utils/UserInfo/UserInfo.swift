//
//  UserInfo.swift
//  YAS Clinic
//
//  Created by MAC-1 on 29/03/2022.
//

import Foundation

struct UserInfo{
    var token = ""
    var id = 0
    var username = "Guest"
    var email = "Guest User"
    var provider = ""
    var confirmed = false
    var blocked = false
    var createdAt = ""
    var updatedAt = ""
    var Phone_number = ""
    var Firebase_token = ""
}
var user = UserInfo()
var UserData = [UserInfo]()
