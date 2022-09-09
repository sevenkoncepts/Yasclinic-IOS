//
//  RecentBookings.swift
//  YAS Clinic
//
//  Created by MAC-1 on 20/04/2022.
//

import Foundation
struct RecentBookings_Base : Codable {
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
        let full_name : String?
        let email : String?
        let createdAt : String?
        let updatedAt : String?
        let phone_number : String?
        let date_id : Date_id?
        let month_id : Month_id?
        let year_id : Year_id?
        let timing_id_from : Timing_id_from?
        let timing_id_to : Timing_id_to?
        let doctor_id : Doctor_id?
        let specialty_id : Specialty_id?
        let hospital_id : Hospital_id?
        let users_id : Users_id?

        enum CodingKeys: String, CodingKey {

            case full_name = "full_name"
            case email = "email"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case phone_number = "phone_number"
            case date_id = "date_id"
            case month_id = "month_id"
            case year_id = "year_id"
            case timing_id_from = "timing_id_from"
            case timing_id_to = "timing_id_to"
            case doctor_id = "doctor_id"
            case specialty_id = "specialty_id"
            case hospital_id = "hospital_id"
            case users_id = "users_id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
            phone_number = try values.decodeIfPresent(String.self, forKey: .phone_number)
            date_id = try values.decodeIfPresent(Date_id.self, forKey: .date_id)
            month_id = try values.decodeIfPresent(Month_id.self, forKey: .month_id)
            year_id = try values.decodeIfPresent(Year_id.self, forKey: .year_id)
            timing_id_from = try values.decodeIfPresent(Timing_id_from.self, forKey: .timing_id_from)
            timing_id_to = try values.decodeIfPresent(Timing_id_to.self, forKey: .timing_id_to)
            doctor_id = try values.decodeIfPresent(Doctor_id.self, forKey: .doctor_id)
            specialty_id = try values.decodeIfPresent(Specialty_id.self, forKey: .specialty_id)
            hospital_id = try values.decodeIfPresent(Hospital_id.self, forKey: .hospital_id)
            users_id = try values.decodeIfPresent(Users_id.self, forKey: .users_id)
        }

    }
    struct Date_id : Codable {
        let data : dateiData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(dateiData.self, forKey: .data)
        }

    }
    struct dateiData : Codable {
        let id : Int?
        let attributes : dateiAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(dateiAttributes.self, forKey: .attributes)
        }

    }
    struct dateiAttributes : Codable {
        let date_name : String?
        let createdAt : String?
        let updatedAt : String?

        enum CodingKeys: String, CodingKey {

            case date_name = "date_name"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            date_name = try values.decodeIfPresent(String.self, forKey: .date_name)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        }

    }
    struct Month_id : Codable {
        let data : miData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(miData.self, forKey: .data)
        }

    }
    struct miData : Codable {
        let id : Int?
        let attributes : miAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(miAttributes.self, forKey: .attributes)
        }

    }
    struct miAttributes : Codable {
        let month_name : String?
        let createdAt : String?
        let updatedAt : String?

        enum CodingKeys: String, CodingKey {

            case month_name = "month_name"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            month_name = try values.decodeIfPresent(String.self, forKey: .month_name)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        }

    }
    struct Year_id : Codable {
        let data : yiData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(yiData.self, forKey: .data)
        }

    }
    struct yiData : Codable {
        let id : Int?
        let attributes : yiAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(yiAttributes.self, forKey: .attributes)
        }

    }
    struct yiAttributes : Codable {
        let year_name : String?
        let createdAt : String?
        let updatedAt : String?

        enum CodingKeys: String, CodingKey {

            case year_name = "year_name"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            year_name = try values.decodeIfPresent(String.self, forKey: .year_name)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        }

    }
    struct Timing_id_from : Codable {
        let data : ftData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(ftData.self, forKey: .data)
        }

    }
    struct ftData : Codable {
        let id : Int?
        let attributes : ftAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(ftAttributes.self, forKey: .attributes)
        }

    }
    struct ftAttributes : Codable {
        let name : String?
        let createdAt : String?
        let updatedAt : String?

        enum CodingKeys: String, CodingKey {

            case name = "name"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        }

    }
    
    struct Timing_id_to : Codable {
        let data : ttData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(ttData.self, forKey: .data)
        }

    }
    struct ttData : Codable {
        let id : Int?
        let attributes : ttAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(ttAttributes.self, forKey: .attributes)
        }

    }
    struct ttAttributes : Codable {
        let name : String?
        let createdAt : String?
        let updatedAt : String?

        enum CodingKeys: String, CodingKey {

            case name = "name"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        }

    }
    struct Doctor_id : Codable {
        let data : diData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(diData.self, forKey: .data)
        }

    }
    struct diData : Codable {
        let id : Int?
        let attributes : diAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(diAttributes.self, forKey: .attributes)
        }

    }
    struct diAttributes : Codable {
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
        let doc_p_id : String?
        let appointment_availability : String?
        let doc_img : Doc_img?

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
            case doc_img = "doc_img"
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
            doc_p_id = try values.decodeIfPresent(String.self, forKey: .doc_p_id)
            appointment_availability = try values.decodeIfPresent(String.self, forKey: .appointment_availability)
            doc_img = try values.decodeIfPresent(Doc_img.self, forKey: .doc_img)
        }

    }
    struct Doc_img : Codable {
        let data : Doc_imgData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(Doc_imgData.self, forKey: .data)
        }

    }
    struct Doc_imgData : Codable {
        let id : Int?
        let attributes : Doc_imgAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(Doc_imgAttributes.self, forKey: .attributes)
        }

    }
    struct Doc_imgAttributes : Codable {
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
    struct Formats : Codable {
        let small : Small?
        let medium : Medium?
        let thumbnail : Thumbnail?

        enum CodingKeys: String, CodingKey {

            case small = "small"
            case medium = "medium"
            case thumbnail = "thumbnail"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            small = try values.decodeIfPresent(Small.self, forKey: .small)
            medium = try values.decodeIfPresent(Medium.self, forKey: .medium)
            thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
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

    
    struct Specialty_id : Codable {
        let data : sData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(sData.self, forKey: .data)
        }

    }
    struct sData : Codable {
        let id : Int?
        let attributes : sAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(sAttributes.self, forKey: .attributes)
        }

    }
    struct sAttributes : Codable {
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
    struct Hospital_id : Codable {
        let data : hiData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(hiData.self, forKey: .data)
        }

    }
    struct hiData : Codable {
        let id : Int?
        let attributes : hiAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(hiAttributes.self, forKey: .attributes)
        }

    }
    struct hiAttributes : Codable {
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
        }

    }
    struct Users_id : Codable {
        let data : Users_idData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(Users_idData.self, forKey: .data)
        }

    }
    struct Users_idData : Codable {
        let id : Int?
        let attributes : Users_idAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(Users_idAttributes.self, forKey: .attributes)
        }

    }
    struct Users_idAttributes : Codable {
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
