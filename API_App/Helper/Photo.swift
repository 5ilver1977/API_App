//
//  Photo.swift
//  API_App
//
//  Created by usuario on 16/8/22.
//

import Foundation

struct Photo: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String

    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }

    func getUrl() -> URL? {
        return URL(string: self.url)
    }

    func getThumbnailUrl() -> URL? {
        return URL(string: self.thumbnailUrl)
    }

}
