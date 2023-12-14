import Foundation

// MARK: - HomeResponse
struct HomeResponse: Codable {
    let menus: [HomeMenu]?
    let mainLink: MainLink?
    let section1: Section1?
    let section2: Section2?
    let contact: Contact?
    let socialMedias: [SocialMedia]?

    enum CodingKeys: String, CodingKey {
        case menus
        case mainLink = "main_link"
        case section1 = "section_1"
        case section2 = "section_2"
        case contact
        case socialMedias = "social_medias"
    }
}

// MARK: - Contact
struct Contact: Codable {
    let id: Int?
    let thumbnail: String?
    let titleID, titleEn, subtitleID, subtitleEn: String?
    let subtitleID2, subtitleEn2, email, phone: String?
    let active: Bool?		

    enum CodingKeys: String, CodingKey {
        case id, thumbnail
        case titleID = "title_id"
        case titleEn = "title_en"
        case subtitleID = "subtitle_id"
        case subtitleEn = "subtitle_en"
        case subtitleID2 = "subtitle_id_2"
        case subtitleEn2 = "subtitle_en_2"
        case email, phone, active
    }
}



// MARK: - MainLink
struct MainLink: Codable {
    let id: Int?
    let active: Bool?
    let thumbnail: String?
    let titleID, titleEn, subtitleID, subtitleEn: String?
    let link: String?	

    enum CodingKeys: String, CodingKey {
        case id, active, thumbnail
        case titleID = "title_id"
        case titleEn = "title_en"
        case subtitleID = "subtitle_id"
        case subtitleEn = "subtitle_en"
        case link = "link"
    }
}

// MARK: - Menu
struct HomeMenu: Codable {
    let id: Int?
    let icon: String?
    let order: Int?
    let displayOnHome: Bool?
    let titleID, titleEn: String?
    let url: String? = nil
    let path: String? = nil
    let isUnderDevelopment: Bool?

    enum CodingKeys: String, CodingKey {
        case id, icon, order
        case displayOnHome = "display_on_home"
        case titleID = "title_id"
        case titleEn = "title_en"
        case url = "url"
        case path = "path"
        case isUnderDevelopment = "is_under_development"
    }
}

// MARK: - Section1
struct Section1: Codable {
    let titleID, titleEn: String?
    let contents: [Section1_Content]?

    enum CodingKeys: String, CodingKey {
        case titleID = "title_id"
        case titleEn = "title_en"
        case contents
    }
}

// MARK: - Section1_Content
struct Section1_Content: Codable, Identifiable {
    let id: Int?
    let thumbnail: String?
    let titleID, titleEnd, tourismCategoryTitleID, tourismCategoryTitleEn: String?
    let location, mapLink: String?
    let showAtDashboard: Bool?
    let priorityOrder: Int?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, thumbnail
        case titleID = "title_id"
        case titleEnd = "title_end"
        case tourismCategoryTitleID = "tourism_category_title_id"
        case tourismCategoryTitleEn = "tourism_category_title_en"
        case location
        case mapLink = "map_link"
        case showAtDashboard = "show_at_dashboard"
        case priorityOrder = "priority_order"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Section2
struct Section2: Codable {
    let titleID, titleEn: String?
    let contents: [Section2_Content]?

    enum CodingKeys: String, CodingKey {
        case titleID = "title_id"
        case titleEn = "title_en"
        case contents
    }
}

// MARK: - Section2_Content
struct Section2_Content: Codable,Identifiable {
    let id: Int?
    let thumbnail: String?
    let link: String?
    let showAtDashboard: Bool?
    let titleID, titleEn, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, thumbnail, link
        case showAtDashboard = "show_at_dashboard"
        case titleID = "title_id"
        case titleEn = "title_en"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    var formattedCreatedAt: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        
        if let createdAt = createdAt, let date = dateFormatter.date(from: createdAt) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "dd MMMM yyyy"
            return outputDateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
}

// MARK: - SocialMedia
struct SocialMedia: Codable {
    let id: Int?
    let icon: String?
    let title: String?
    let active: Bool?
    let permalink: String?
}
