//
//  ConfirmBooking.swift
//  YAS Clinic
//
//  Created by MAC-1 on 19/04/2022.
//

import Foundation

struct ConfirmBooking_Base : Codable {
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
        let full_name : String?
        let email : String?
        let createdAt : String?
        let updatedAt : String?
        let phone_number : String?

        enum CodingKeys: String, CodingKey {

            case full_name = "full_name"
            case email = "email"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case phone_number = "phone_number"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
            phone_number = try values.decodeIfPresent(String.self, forKey: .phone_number)
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
