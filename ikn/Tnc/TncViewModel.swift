//
//  TncViewModel.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import Foundation

class TncViewModel : ObservableObject {
    private let networkManager = NetworkingManager()
    @Published var tnc:TNCModel? = nil
    
    func fetchTnc(){
        networkManager.fetchData(path: "/api/pages/tncs", method: .get){
            result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(TNCModel.self, from: data)
                    DispatchQueue.main.async {
                        self.tnc = decodedData
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
