//
//  SpecificInsurancePartner.swift
//  YAS Clinic
//
//  Created by MAC-1 on 17/05/2022.
//

import Foundation

struct SpecificInsurancePartner_Base : Codable {
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
        let createdAt : String?
        let updatedAt : String?
        let partner_name : String?
//        let logo : Logo?
        let hospitals : Hospitals?
        let networks : [Networks]?

        enum CodingKeys: String, CodingKey {

            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case partner_name = "partner_name"
//            case logo = "logo"
            case hospitals = "hospitals"
            case networks = "networks"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
            partner_name = try values.decodeIfPresent(String.self, forKey: .partner_name)
//            logo = try values.decodeIfPresent(Logo.self, forKey: .logo)
            hospitals = try values.decodeIfPresent(Hospitals.self, forKey: .hospitals)
            networks = try values.decodeIfPresent([Networks].self, forKey: .networks)
        }

    }
//    struct Logo : Codable {
//        let data : Data?
//
//        enum CodingKeys: String, CodingKey {
//
//            case data = "data"
//        }
//
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            data = try values.decodeIfPresent(Data.self, forKey: .data)
//        }
//
//    }
    struct Hospitals : Codable {
        let data : [Data]?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent([Data].self, forKey: .data)
        }

    }
    struct Networks : Codable {
        let id : Int?
        let network_name : String?
        let yckc : Bool?
        let ycods : Bool?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case network_name = "network_name"
            case yckc = "yckc"
            case ycods = "ycods"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            network_name = try values.decodeIfPresent(String.self, forKey: .network_name)
            yckc = try values.decodeIfPresent(Bool.self, forKey: .yckc)
            ycods = try values.decodeIfPresent(Bool.self, forKey: .ycods)
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
