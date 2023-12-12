//
//  WeatherModel.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let status: Bool?
    let message: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let temperature, weather: String?
    let icon: String?
}
