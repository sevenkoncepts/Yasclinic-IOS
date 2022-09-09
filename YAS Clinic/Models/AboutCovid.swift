//
//  AboutCovid.swift
//  YAS Clinic
//
//  Created by MAC-1 on 30/03/2022.
//

import Foundation
struct AboutCovid_Base : Codable {
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
        let locale : String?
        let title : String?
        let description : String?
        let short_text : String?
        let seo_title : String?
        let seo_desc : String?
        let seo_keywords : String?
        let banner : Banner?
        let localizations : Localizations?

        enum CodingKeys: String, CodingKey {

            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case locale = "locale"
            case title = "title"
            case description = "description"
            case short_text = "short_text"
            case seo_title = "seo_title"
            case seo_desc = "seo_desc"
            case seo_keywords = "seo_keywords"
            case banner = "banner"
            case localizations = "localizations"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
            locale = try values.decodeIfPresent(String.self, forKey: .locale)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            short_text = try values.decodeIfPresent(String.self, forKey: .short_text)
            seo_title = try values.decodeIfPresent(String.self, forKey: .seo_title)
            seo_desc = try values.decodeIfPresent(String.self, forKey: .seo_desc)
            seo_keywords = try values.decodeIfPresent(String.self, forKey: .seo_keywords)
            banner = try values.decodeIfPresent(Banner.self, forKey: .banner)
            localizations = try values.decodeIfPresent(Localizations.self, forKey: .localizations)
        }

    }
    struct Banner : Codable {
        let data : bData?

        enum CodingKeys: String, CodingKey {

            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try values.decodeIfPresent(bData.self, forKey: .data)
        }

    }
    //banner data
    struct bData : Codable {
        let id : Int?
        let attributes : bAttributes?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case attributes = "attributes"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            attributes = try values.decodeIfPresent(bAttributes.self, forKey: .attributes)
        }

    }
    //banner attributes
    struct bAttributes : Codable {
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
