//
//  HealthsResponse.swift
//  ikn
//
//  Created by Naufal on 13/12/23.
//

import Foundation


struct HealthResponse : Codable{
    let message:String?
    let list_health:[Health]?
}
