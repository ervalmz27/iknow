//
//  HealthCategory.swift
//  ikn
//
//  Created by Naufal on 13/12/23.
//

import Foundation

struct HealthCategory: Codable{
    let order:Int?
    let title_id:String?
    let title_en:String?
}

// MARK: - Health
struct Health: Codable {
    let id: Int?
    let titleID, titleEn: String?
    let latitude: Double?
    let longitude : Double?
    let address : String
    let openTime,rsType : String?
    let phone:String?
    let healthCategoryId : Int?
    enum CodingKeys: String, CodingKey {
        case id
        case titleID = "title_id"
        case titleEn = "title_en"
        case openTime = "open_time"
        case rsType = "rs_type"
        case healthCategoryId = "health_category_id"
        case latitude, longitude ,address,phone
    }
}
