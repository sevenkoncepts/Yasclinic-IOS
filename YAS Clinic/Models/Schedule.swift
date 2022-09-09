//
//  Schedule.swift
//  YAS Clinic
//
//  Created by MAC-1 on 14/04/2022.
//

import Foundation

struct Schedule_Base : Codable {
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
        let createdAt : String?
        let updatedAt : String?
        let doctor_id : Doctor_id?
        let schedule : [Schedule]?

        enum CodingKeys: String, CodingKey {

            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case doctor_id = "doctor_id"
            case schedule = "schedule"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
            doctor_id = try values.decodeIfPresent(Doctor_id.self, forKey: .doctor_id)
            schedule = try values.decodeIfPresent([Schedule].self, forKey: .schedule)
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
            doc_p_id = try values.decodeIfPresent(String.self, forKey: .doc_p_id)
            appointment_availability = try values.decodeIfPresent(String.self, forKey: .appointment_availability)
        }

    }
    struct Schedule : Codable {
        let id : Int?
        let hospital_id : Hospital_id?
        let year_id : Year_id?
        let month_id : Month_id?
        let date_id : Date_id?
        var availability : [Availability]?
        

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case hospital_id = "hospital_id"
            case year_id = "year_id"
            case month_id = "month_id"
            case date_id = "date_id"
            case availability = "availability"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            hospital_id = try values.decodeIfPresent(Hospital_id.self, forKey: .hospital_id)
            year_id = try values.decodeIfPresent(Year_id.self, forKey: .year_id)
            month_id = try values.decodeIfPresent(Month_id.self, forKey: .month_id)
            date_id = try values.decodeIfPresent(Date_id.self, forKey: .date_id)
            availability = try values.decodeIfPresent([Availability].self, forKey: .availability)
            
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

    struct Availability : Codable {
        let id : Int?
        let other_status : String?
        let from_time : From_time?
        let to_time : To_time?
        var isAvaliable : Bool?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case other_status = "other_status"
            case from_time = "from_time"
            case to_time = "to_time"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            other_status = try values.decodeIfPresent(String.self, forKey: .other_status)
            from_time = try values.decodeIfPresent(From_time.self, forKey: .from_time)
            to_time = try values.decodeIfPresent(To_time.self, forKey: .to_time)
            isAvaliable = true
        }

    }
    struct From_time : Codable {
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
    struct To_time : Codable {
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
