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
    
    func fetchShortHealth(){
        network.fetchData(path: "/api/pages/healths", method: .get){
            result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([Health].self, from: data)
                    DispatchQueue.main.async {
                        self.shortHealth = decodedData
                        
                       print(decodedData)
                    }
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
//        fetchContacts()
    }
    
    private func fetchHealth(){
        network.fetchData(path: "/api/pages/healths?category=\(String(describing: self.selectedHealth?.title_id))", method: .get){
            result in
            print("DATAKU \(result)")
            switch result {
            case .success(let data):
                print("DATAKU \(data)")
                do {
                    let decodedData = try JSONDecoder().decode(HealthResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.healthResponse = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
