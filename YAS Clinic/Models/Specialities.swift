//
//  Specialities.swift
//  YAS Clinic
//
//  Created by MAC-1 on 29/03/2022.
//

import Foundation

struct Specialities_Base : Codable {
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
//    //doctors Data
//    struct dData : Codable {
//        let id : Int?
//        let attributes : dAttributes?
//
//        enum CodingKeys: String, CodingKey {
//
//            case id = "id"
//            case attributes = "attributes"
//        }
//
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            id = try values.decodeIfPresent(Int.self, forKey: .id)
//            attributes = try values.decodeIfPresent(dAttributes.self, forKey: .attributes)
//        }
//
//    }
//    //doctor attributes
//    struct dAttributes : Codable {
//        let doc_name : String?
//        let doc_designation : String?
//        let doc_desc : String?
//        let createdAt : String?
//        let updatedAt : String?
//        let locale : String?
//        let seo_title : String?
//        let seo_desc : String?
//        let seo_keywords : String?
//        let patient_population : String?
//        let doc_p_id : Int?
//        let appointment_availability : String?
//
//        enum CodingKeys: String, CodingKey {
//
//            case doc_name = "doc_name"
//            case doc_designation = "doc_designation"
//            case doc_desc = "doc_desc"
//            case createdAt = "createdAt"
//            case updatedAt = "updatedAt"
//            case locale = "locale"
//            case seo_title = "seo_title"
//            case seo_desc = "seo_desc"
//            case seo_keywords = "seo_keywords"
//            case patient_population = "patient_population"
//            case doc_p_id = "doc_p_id"
//            case appointment_availability = "appointment_availability"
//        }
//
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            doc_name = try values.decodeIfPresent(String.self, forKey: .doc_name)
//            doc_designation = try values.decodeIfPresent(String.self, forKey: .doc_designation)
//            doc_desc = try values.decodeIfPresent(String.self, forKey: .doc_desc)
//            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
//            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
//            locale = try values.decodeIfPresent(String.self, forKey: .locale)
//            seo_title = try values.decodeIfPresent(String.self, forKey: .seo_title)
//            seo_desc = try values.decodeIfPresent(String.self, forKey: .seo_desc)
//            seo_keywords = try values.decodeIfPresent(String.self, forKey: .seo_keywords)
//            patient_population = try values.decodeIfPresent(String.self, forKey: .patient_population)
//            doc_p_id = try values.decodeIfPresent(Int.self, forKey: .doc_p_id)
//            appointment_availability = try values.decodeIfPresent(String.self, forKey: .appointment_availability)
//        }
//
//    }

    
    //icon data
    struct iData : Codable {
        let id : Int?
        let attributes : iAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(iAttributes.self, forKey: .attributes)
        }

    }
    
    //icon attributes
    struct iAttributes : Codable {
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
    
    
    struct Attributes : Codable {
        let title : String?
        let description : String?
        let createdAt : String?
        let updatedAt : String?
        let locale : String?
        let seo_title : String?
        let seo_desc : String?
        let seo_keywords : String?
        let appointment_availability : Bool?
        let icon : Icon?
//        let banner : Banner?
        let doctors : Doctors?
//        let main_icon : Main_icon?
        let scope_list : [Scope_list]?
        let localizations : Localizations?
        

        enum CodingKeys: String, CodingKey {

            case title = "title"
            case description = "description"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case locale = "locale"
            case seo_title = "seo_title"
            case seo_desc = "seo_desc"
            case seo_keywords = "seo_keywords"
            case appointment_availability = "appointment_availability"
            case icon = "icon"
//            case banner = "banner"
            case doctors = "doctors"
//            case main_icon = "main_icon"
            case scope_list = "Scope_list"
            case localizations = "localizations"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
            locale = try values.decodeIfPresent(String.self, forKey: .locale)
            seo_title = try values.decodeIfPresent(String.self, forKey: .seo_title)
            seo_desc = try values.decodeIfPresent(String.self, forKey: .seo_desc)
            seo_keywords = try values.decodeIfPresent(String.self, forKey: .seo_keywords)
            appointment_availability = try values.decodeIfPresent(Bool.self, forKey: .appointment_availability)
            icon = try values.decodeIfPresent(Icon.self, forKey: .icon)
//            banner = try values.decodeIfPresent(Banner.self, forKey: .banner)
            doctors = try values.decodeIfPresent(Doctors.self, forKey: .doctors)
//            main_icon = try values.decodeIfPresent(Main_icon.self, forKey: .main_icon)
            scope_list = try values.decodeIfPresent([Scope_list].self, forKey: .scope_list)
            localizations = try values.decodeIfPresent(Localizations.self, forKey: .localizations)
        }

    }

    struct Scope_list : Codable {
        let id : Int?
        let scope_points : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case scope_points = "Scope_points"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            scope_points = try values.decodeIfPresent(String.self, forKey: .scope_points)
        }

    }
    
    struct Icon : Codable {
        let Icon_data : iData?

        enum CodingKeys: String, CodingKey {

            case Icon_data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            Icon_data = try values.decodeIfPresent(iData.self, forKey: .Icon_data)
        }

    }
    
    
    
    struct Formats : Codable {
        let small : Small?
        let thumbnail : Thumbnail?

        enum CodingKeys: String, CodingKey {

            case small = "small"
            case thumbnail = "thumbnail"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            small = try values.decodeIfPresent(Small.self, forKey: .small)
            thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
        }

    }
    
    struct Main_icon : Codable {
        let data : Data?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(Data.self, forKey: .data)
        }

    }
    
    struct Banner : Codable {
        let data : Data?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(Data.self, forKey: .data)
        }

    }
    
//    struct Doctors : Codable {
//        let data : [dData]?
//
//        enum CodingKeys: String, CodingKey {
//
//            case data = "data"
//        }
//
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            data = try values.decodeIfPresent([dData].self, forKey: .data)
//        }
//
//    }

    

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

    struct Localizations : Codable {
        let data : [LData]?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent([LData].self, forKey: .data)
        }

    }
    
    struct LData : Codable{
        let id : Int?
        let attributes : LAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(LAttributes.self, forKey: .attributes)
        }
    }
    
    struct LAttributes : Codable {
        let title : String?
        let description : String?
        let createdAt : String?
        let updatedAt : String?
        let locale : String?
        let seo_title : String?
        let seo_desc : String?
        let seo_keywords : String?
        let appointment_availability : Bool?

        enum CodingKeys: String, CodingKey {

            case title = "title"
            case description = "description"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case locale = "locale"
            case seo_title = "seo_title"
            case seo_desc = "seo_desc"
            case seo_keywords = "seo_keywords"
            case appointment_availability = "appointment_availability"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
            locale = try values.decodeIfPresent(String.self, forKey: .locale)
            seo_title = try values.decodeIfPresent(String.self, forKey: .seo_title)
            seo_desc = try values.decodeIfPresent(String.self, forKey: .seo_desc)
            seo_keywords = try values.decodeIfPresent(String.self, forKey: .seo_keywords)
            appointment_availability = try values.decodeIfPresent(Bool.self, forKey: .appointment_availability)
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



}
