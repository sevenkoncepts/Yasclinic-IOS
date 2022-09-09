//
//  LoginModel.swift
//  YAS Clinic
//
//  Created by MAC-1 on 29/03/2022.
//

import Foundation

struct Login_Base : Codable {
    let jwt : String?
    let user : User?
    
    let data : String?
    let error : Error?

    enum CodingKeys: String, CodingKey {

        case jwt = "jwt"
        case user = "user"
        
        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        jwt = try values.decodeIfPresent(String.self, forKey: .jwt)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        data = try values.decodeIfPresent(String.self, forKey: .data)
        error = try values.decodeIfPresent(Error.self, forKey: .error)
    }

    struct User : Codable {
        let id : Int?
        let username : String?
        let email : String?
        let provider : String?
        let confirmed : Bool?
        let blocked : Bool?
        let createdAt : String?
        let updatedAt : String?
        let phone_number : String?
        let firebase_token : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case username = "username"
            case email = "email"
            case provider = "provider"
            case confirmed = "confirmed"
            case blocked = "blocked"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case phone_number = "Phone_number"
            case firebase_token = "Firebase_token"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            username = try values.decodeIfPresent(String.self, forKey: .username)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            provider = try values.decodeIfPresent(String.self, forKey: .provider)
            confirmed = try values.decodeIfPresent(Bool.self, forKey: .confirmed)
            blocked = try values.decodeIfPresent(Bool.self, forKey: .blocked)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
            phone_number = try values.decodeIfPresent(String.self, forKey: .phone_number)
            firebase_token = try values.decodeIfPresent(String.self, forKey: .firebase_token)
        }

    }
    
    struct Error : Codable {
        let status : Int?
        let name : String?
        let message : String?
//        let details : Details?

        enum CodingKeys: String, CodingKey {

            case status = "status"
            case name = "name"
            case message = "message"
//            case details = "details"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            message = try values.decodeIfPresent(String.self, forKey: .message)
//            details = try values.decodeIfPresent(Details.self, forKey: .details)
        }

    }
    
//    struct Details : Codable {
//
//        enum CodingKeys: String, CodingKey {
//
//        }
//
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//        }
//
//    }
}
