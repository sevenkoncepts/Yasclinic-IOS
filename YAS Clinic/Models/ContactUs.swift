//
//  ContactUs.swift
//  YAS Clinic
//
//  Created by MAC-1 on 30/03/2022.
//

import Foundation

struct ContactUs_Base : Codable {
    let data : Data?
    let meta : Meta?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case meta = "meta"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
    }
    struct Data : Codable {
        let id : Int?
        let attributes : Attributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(Attributes.self, forKey: .attributes)
        }

    }
    struct Attributes : Codable {
        let name : String?
        let email : String?
        let phone_number : String?
        let message : String?
        let createdAt : String?
        let updatedAt : String?
        let type : String?

        enum CodingKeys: String, CodingKey {

            case name = "name"
            case email = "email"
            case phone_number = "phone_number"
            case message = "message"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case type = "type"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            phone_number = try values.decodeIfPresent(String.self, forKey: .phone_number)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
            type = try values.decodeIfPresent(String.self, forKey: .type)
        }

    }
    struct Meta : Codable {

//        enum CodingKeys: String, CodingKey {
//
//        }
//
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//        }

    }

}
