//
//  User.swift
//
//  Copyright © 2017 Skyderby. All rights reserved.

import Foundation

struct Photo: Codable {
    let original: URL
    let medium: URL
    let thumb: URL

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let original = try container.decode(String.self, forKey: .original)
        let medium = try container.decode(String.self, forKey: .medium)
        let thumb = try container.decode(String.self, forKey: .thumb)

        self.original = URL(string: "https://skyderby.ru" + original)!
        self.medium = URL(string: "https://skyderby.ru" + medium)!
        self.thumb = URL(string: "https://skyderby.ru" + thumb)!
    }
}

struct User: Codable {
    let id: Int
    let name: String
    let photo: Photo

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo
//        case personalScores = "personal_scores"
    }
}
