//
//  HomeViewModel.swift
//  ikn
//
//  Created by Naufal on 29/11/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var homeData: HomeResponse? = nil
    private var cancellables: Set<AnyCancellable> = []

    func fetchData() {
        let networkingManager = NetworkingManager()

        networkingManager.fetchData(path: "home.json", method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(HomeResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.homeData = decodedData
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
