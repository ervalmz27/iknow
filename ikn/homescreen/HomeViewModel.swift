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
    @Published var menuHome: [HomeMenu]? = nil
    @Published var weather: WeatherModel? = nil
    
    private var cancellables: Set<AnyCancellable> = []
    private let networkingManager = NetworkingManager()
    func fetchData() {
        networkingManager.fetchData(path: "/api/pages/home", method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(HomeResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.homeData = decodedData
                        self.getHomeMenuFromHomeData()
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
    
    
    func fetchWeather(){
        networkingManager.fetchData(path: "/api/pages/current-weather", method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
                    DispatchQueue.main.async {
                        self.weather = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func getHomeMenuFromHomeData(){
        guard let menus = homeData?.menus else {
                print("Home data or menus are nil.")
                return
            }
            // Filter menus based on the is_show_dashboard property
            menuHome = menus.filter { $0.displayOnHome==true }
        
        print("jumlah data adalah \(menus.count)")

    }
}
