//
//  Hospitals.swift
//  YAS Clinic
//
//  Created by MAC-1 on 30/03/2022.
//

import Foundation
struct Hospitals_Base : Codable {
    let data : [Data]?
    let meta : Meta?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case meta = "meta"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
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
        let hos_name : String?
        let hos_desc : String?
        let hos_address : String?
        let hos_lat_lon : String?
        let hos_phone : String?
        let hos_doctors : String?
        let hos_speciality : String?
        let createdAt : String?
        let updatedAt : String?
        let locale : String?
        let seo_title : String?
        let seo_desc : String?
        let seo_keywords : String?
        let link : String?
        let hos_img : Hos_img?
        let doctors : Doctors?
//        let banner : Banner?
        let insurance_partners : Insurance_partners?
        let localizations : Localizations?

        enum CodingKeys: String, CodingKey {

            case hos_name = "hos_name"
            case hos_desc = "hos_desc"
            case hos_address = "hos_address"
            case hos_lat_lon = "hos_lat_lon"
            case hos_phone = "hos_phone"
            case hos_doctors = "hos_doctors"
            case hos_speciality = "hos_speciality"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case locale = "locale"
            case seo_title = "seo_title"
            case seo_desc = "seo_desc"
            case seo_keywords = "seo_keywords"
            case link = "link"
            case hos_img = "hos_img"
            case doctors = "doctors"
//            case banner = "banner"
            case insurance_partners = "insurance_partners"
            case localizations = "localizations"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            hos_name = try values.decodeIfPresent(String.self, forKey: .hos_name)
            hos_desc = try values.decodeIfPresent(String.self, forKey: .hos_desc)
            hos_address = try values.decodeIfPresent(String.self, forKey: .hos_address)
            hos_lat_lon = try values.decodeIfPresent(String.self, forKey: .hos_lat_lon)
            hos_phone = try values.decodeIfPresent(String.self, forKey: .hos_phone)
            hos_doctors = try values.decodeIfPresent(String.self, forKey: .hos_doctors)
            hos_speciality = try values.decodeIfPresent(String.self, forKey: .hos_speciality)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
            locale = try values.decodeIfPresent(String.self, forKey: .locale)
            seo_title = try values.decodeIfPresent(String.self, forKey: .seo_title)
            seo_desc = try values.decodeIfPresent(String.self, forKey: .seo_desc)
            seo_keywords = try values.decodeIfPresent(String.self, forKey: .seo_keywords)
            link = try values.decodeIfPresent(String.self, forKey: .link)
            hos_img = try values.decodeIfPresent(Hos_img.self, forKey: .hos_img)
            doctors = try values.decodeIfPresent(Doctors.self, forKey: .doctors)
//            banner = try values.decodeIfPresent(Banner.self, forKey: .banner)
            insurance_partners = try values.decodeIfPresent(Insurance_partners.self, forKey: .insurance_partners)
            localizations = try values.decodeIfPresent(Localizations.self, forKey: .localizations)
        }

    }
    struct Hos_img : Codable {
        let data : hsData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(hsData.self, forKey: .data)
        }

    }
    //Hos_img data
    struct hsData : Codable {
        let id : Int?
        let attributes : hsAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(hsAttributes.self, forKey: .attributes)
        }

    }
    
    //Hos_img attributes
    struct hsAttributes : Codable {
        let name : String?
        let alternativeText : String?
        let caption : String?
        let width : Int?
        let height : Int?
        let formats : Formats?
        let hash : String?
        let ext : String?
        let mime : String?
        let size : Double?
        let url : String?
        let previewUrl : String?
        let provider : String?
        let provider_metadata : String?
        let createdAt : String?
        let updatedAt : String?

        enum CodingKeys: String, CodingKey {

            case name = "name"
            case alternativeText = "alternativeText"
            case caption = "caption"
            case width = "width"
            case height = "height"
            case formats = "formats"
            case hash = "hash"
            case ext = "ext"
            case mime = "mime"
            case size = "size"
            case url = "url"
            case previewUrl = "previewUrl"
            case provider = "provider"
            case provider_metadata = "provider_metadata"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            alternativeText = try values.decodeIfPresent(String.self, forKey: .alternativeText)
            caption = try values.decodeIfPresent(String.self, forKey: .caption)
            width = try values.decodeIfPresent(Int.self, forKey: .width)
            height = try values.decodeIfPresent(Int.self, forKey: .height)
            formats = try values.decodeIfPresent(Formats.self, forKey: .formats)
            hash = try values.decodeIfPresent(String.self, forKey: .hash)
            ext = try values.decodeIfPresent(String.self, forKey: .ext)
            mime = try values.decodeIfPresent(String.self, forKey: .mime)
            size = try values.decodeIfPresent(Double.self, forKey: .size)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
            provider = try values.decodeIfPresent(String.self, forKey: .provider)
            provider_metadata = try values.decodeIfPresent(String.self, forKey: .provider_metadata)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        }

    }

    

//    struct Banner : Codable {
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
    struct Insurance_partners : Codable {
        let data : [Data]?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent([Data].self, forKey: .data)
        }

    }
    struct Localizations : Codable {
        let data : [Data]?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent([Data].self, forKey: .data)
        }

    }
    
    struct Formats : Codable {
        let large : Large?
        let small : Small?
        let medium : Medium?
        let thumbnail : Thumbnail?

        enum CodingKeys: String, CodingKey {

            case large = "large"
            case small = "small"
            case medium = "medium"
            case thumbnail = "thumbnail"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            large = try values.decodeIfPresent(Large.self, forKey: .large)
            small = try values.decodeIfPresent(Small.self, forKey: .small)
            medium = try values.decodeIfPresent(Medium.self, forKey: .medium)
            thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
        }

    }
    struct Large : Codable {
        let ext : String?
        let url : String?
        let hash : String?
        let mime : String?
        let name : String?
        let path : String?
        let size : Double?
        let width : Int?
        let height : Int?

        enum CodingKeys: String, CodingKey {

            case ext = "ext"
            case url = "url"
            case hash = "hash"
            case mime = "mime"
            case name = "name"
            case path = "path"
            case size = "size"
            case width = "width"
            case height = "height"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            ext = try values.decodeIfPresent(String.self, forKey: .ext)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            hash = try values.decodeIfPresent(String.self, forKey: .hash)
            mime = try values.decodeIfPresent(String.self, forKey: .mime)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            path = try values.decodeIfPresent(String.self, forKey: .path)
            size = try values.decodeIfPresent(Double.self, forKey: .size)
            width = try values.decodeIfPresent(Int.self, forKey: .width)
            height = try values.decodeIfPresent(Int.self, forKey: .height)
        }

    }
    struct Medium : Codable {
        let ext : String?
        let url : String?
        let hash : String?
        let mime : String?
        let name : String?
        let path : String?
        let size : Double?
        let width : Int?
        let height : Int?

        enum CodingKeys: String, CodingKey {

            case ext = "ext"
            case url = "url"
            case hash = "hash"
            case mime = "mime"
            case name = "name"
            case path = "path"
            case size = "size"
            case width = "width"
            case height = "height"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            ext = try values.decodeIfPresent(String.self, forKey: .ext)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            hash = try values.decodeIfPresent(String.self, forKey: .hash)
            mime = try values.decodeIfPresent(String.self, forKey: .mime)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            path = try values.decodeIfPresent(String.self, forKey: .path)
            size = try values.decodeIfPresent(Double.self, forKey: .size)
            width = try values.decodeIfPresent(Int.self, forKey: .width)
            height = try values.decodeIfPresent(Int.self, forKey: .height)
        }

    }
    struct Small : Codable {
        let ext : String?
        let url : String?
        let hash : String?
        let mime : String?
        let name : String?
        let path : String?
        let size : Double?
        let width : Int?
        let height : Int?

        enum CodingKeys: String, CodingKey {

            case ext = "ext"
            case url = "url"
            case hash = "hash"
            case mime = "mime"
            case name = "name"
            case path = "path"
            case size = "size"
            case width = "width"
            case height = "height"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            ext = try values.decodeIfPresent(String.self, forKey: .ext)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            hash = try values.decodeIfPresent(String.self, forKey: .hash)
            mime = try values.decodeIfPresent(String.self, forKey: .mime)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            path = try values.decodeIfPresent(String.self, forKey: .path)
            size = try values.decodeIfPresent(Double.self, forKey: .size)
            width = try values.decodeIfPresent(Int.self, forKey: .width)
            height = try values.decodeIfPresent(Int.self, forKey: .height)
        }

    }
    struct Thumbnail : Codable {
        let ext : String?
        let url : String?
        let hash : String?
        let mime : String?
        let name : String?
        let path : String?
        let size : Double?
        let width : Int?
        let height : Int?

        enum CodingKeys: String, CodingKey {

            case ext = "ext"
            case url = "url"
            case hash = "hash"
            case mime = "mime"
            case name = "name"
            case path = "path"
            case size = "size"
            case width = "width"
            case height = "height"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            ext = try values.decodeIfPresent(String.self, forKey: .ext)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            hash = try values.decodeIfPresent(String.self, forKey: .hash)
            mime = try values.decodeIfPresent(String.self, forKey: .mime)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            path = try values.decodeIfPresent(String.self, forKey: .path)
            size = try values.decodeIfPresent(Double.self, forKey: .size)
            width = try values.decodeIfPresent(Int.self, forKey: .width)
            height = try values.decodeIfPresent(Int.self, forKey: .height)
        }

    }
    struct Meta : Codable {
        let pagination : Pagination?

        enum CodingKeys: String, CodingKey {

            case pagination = "pagination"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
        }

    }
    struct Pagination : Codable {
        let page : Int?
        let pageSize : Int?
        let pageCount : Int?
        let total : Int?

        enum CodingKeys: String, CodingKey {

            case page = "page"
            case pageSize = "pageSize"
            case pageCount = "pageCount"
            case total = "total"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            page = try values.decodeIfPresent(Int.self, forKey: .page)
            pageSize = try values.decodeIfPresent(Int.self, forKey: .pageSize)
            pageCount = try values.decodeIfPresent(Int.self, forKey: .pageCount)
            total = try values.decodeIfPresent(Int.self, forKey: .total)
        }

    }

}
struct Doctors : Codable {
    let data : [dData]?

    enum CodingKeys: String, CodingKey {

        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([dData].self, forKey: .data)
    }

}
//doctors Data
struct dData : Codable {
    let id : Int?
    let attributes : dAttributes?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case attributes = "attributes"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        attributes = try values.decodeIfPresent(dAttributes.self, forKey: .attributes)
    }

}
//Doctors Data
struct dAttributes : Codable {
    let doc_name : String?
    let doc_designation : String?
    let doc_desc : String?
    let createdAt : String?
    let updatedAt : String?
    let locale : String?
    let seo_title : String?
    let seo_desc : String?
    let seo_keywords : String?
    let patient_population : String?
    let doc_p_id : Int?
    let appointment_availability : String?

    enum CodingKeys: String, CodingKey {

        case doc_name = "doc_name"
        case doc_designation = "doc_designation"
        case doc_desc = "doc_desc"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case locale = "locale"
        case seo_title = "seo_title"
        case seo_desc = "seo_desc"
        case seo_keywords = "seo_keywords"
        case patient_population = "patient_population"
        case doc_p_id = "doc_p_id"
        case appointment_availability = "appointment_availability"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        doc_name = try values.decodeIfPresent(String.self, forKey: .doc_name)
        doc_designation = try values.decodeIfPresent(String.self, forKey: .doc_designation)
        doc_desc = try values.decodeIfPresent(String.self, forKey: .doc_desc)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        locale = try values.decodeIfPresent(String.self, forKey: .locale)
        seo_title = try values.decodeIfPresent(String.self, forKey: .seo_title)
        seo_desc = try values.decodeIfPresent(String.self, forKey: .seo_desc)
        seo_keywords = try values.decodeIfPresent(String.self, forKey: .seo_keywords)
        patient_population = try values.decodeIfPresent(String.self, forKey: .patient_population)
        doc_p_id = try values.decodeIfPresent(Int.self, forKey: .doc_p_id)
        appointment_availability = try values.decodeIfPresent(String.self, forKey: .appointment_availability)
    }

}
