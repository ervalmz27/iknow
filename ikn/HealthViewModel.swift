//
//  HealthViewModel.swift
//  ikn
//
//  Created by Naufal on 13/12/23.
//

import Foundation
class HealthViewModel: ObservableObject{
    @Published var shortHealth : [Health] = []
    @Published var healthResponse : HealthResponse? = nil
    @Published var categories : [HealthCategory] = []
    @Published var selectedHealth: HealthCategory? = nil
    private let network = NetworkingManager()
    @Published var number: Int = 0
    @Published var title: String = ""
    func fetchShortHealth(){
        network.fetchData(path: "/api/pages/healths", method: .get){
            result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([Health].self, from: data)
                    DispatchQueue.main.async {
                        self.shortHealth = decodedData                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func fetchCategory(){
        network.fetchData(path: "/api/pages/health-categories", method: .get){
            result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([HealthCategory].self, from: data)
                    DispatchQueue.main.async {
                        self.categories = decodedData
                        self.selectHealth(healths: self.categories.first!)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func selectHealth(healths : HealthCategory){
        self.selectedHealth = healths;
        self.number = healths.order ?? 0
        self.title = healths.title_id ?? ""
        fetchHealth()
    }
    
    private func fetchHealth(){
        print("category \(String(describing: self.selectedHealth?.title_id))")
        var urlComponents = URLComponents(string: "https://smartcityapp.ikn.go.id/api/pages/healths")!

        // Add query parameters
        urlComponents.queryItems = [
            URLQueryItem(name: "category", value:self.selectedHealth?.title_id ?? "" )
        ]

        guard let url = urlComponents.url else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
           
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode([Health].self, from: data)

                    DispatchQueue.main.async {
                        self.shortHealth = decodedData
                        print("HELOO BISSS \(decodedData)")
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
