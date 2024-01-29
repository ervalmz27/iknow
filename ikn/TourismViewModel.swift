//
//  TourismViewModel.swift
//  ikn
//
//  Created by Naufal on 11/01/24.
//

import Foundation

class TourismViewModel : ObservableObject{
    @Published var listTourism : [Section1_Content]?
    private let networking = NetworkingManager()
    func getArticles(){
        networking.fetchData(path: "/api/pages/tourism", method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([Section1_Content].self, from: data)
                    DispatchQueue.main.async {
                        self.listTourism = decodedData
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
}
