//
//  ArticlesViewModel.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import Foundation

class ArticlesViewModel : ObservableObject{
    @Published var listArticles : [Section2_Content]?
    private let networking = NetworkingManager()
    func getArticles(){
        networking.fetchData(path: "/api/pages/articles", method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([Section2_Content].self, from: data)
                    DispatchQueue.main.async {
                        self.listArticles = decodedData
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
