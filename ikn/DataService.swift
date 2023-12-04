//
//  DataService.swift
//  ikn
//
//  Created by Naufal on 22/11/23.
//
import Foundation

class DataService {
    static func load<T: Codable>(_ filename: String, as type: T.Type = T.self) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
            else {
                fatalError("Tidak dapat menemukan \(filename) di bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Tidak dapat membaca file \(filename): \(error.localizedDescription)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Tidak dapat mendekode file \(filename): \(error.localizedDescription)")
        }
    }
}

