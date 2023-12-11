//
//  TncModel.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import Foundation
// MARK: - TNCModel
struct TNCModel: Codable {
    let id: Int
    let titleID, titleEn, contentID, contentEn: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case titleID = "title_id"
        case titleEn = "title_en"
        case contentID = "content_id"
        case contentEn = "content_en"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
