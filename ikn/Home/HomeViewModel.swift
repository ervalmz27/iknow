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
    @Published var menuHome: [HomeMenu]? = []
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
        self.menuHome?.removeAll()
        self.homeData?.menus?.forEach { item in
            if(item.displayOnHome==true){
                self.menuHome?.append(item)
            }
        }
    }
}
