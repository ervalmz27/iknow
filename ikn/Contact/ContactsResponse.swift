//
//  ContactsResponse.swift
//  ikn
//
//  Created by Cong Fandi on 12/12/23.
//

import Foundation

struct ContactsResponse : Codable{
    let message:String?
    let list_contact:[Contact]?
}
