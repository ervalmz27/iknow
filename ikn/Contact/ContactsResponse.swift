//
//  ContactsResponse.swift
//  ikn
//
//  Created by Cong Fandi on 12/12/23.
//

import Foundation

//struct ContactsResponse : Codable{
//    let message:String?
//    let list_contact:[Contact]?
//}

struct ContactsResponse: Codable {
    let message: String
    let listContact: [Contact]
    
    enum CodingKeys: String, CodingKey {
        case message
        case listContact = "list_contact"
    }
}
