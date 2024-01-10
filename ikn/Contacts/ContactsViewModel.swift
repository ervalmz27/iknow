//
//  ContactsViewModel.swift
//  ikn
//
//  Created by Cong Fandi on 12/12/23.
//

import Foundation

class ContactsViewModel: ObservableObject{
    @Published var shortContacts : [Contact] = []
    @Published var contactResponse : ContactsResponse? = nil
    @Published var categories : [ContactCategory] = []
    @Published var selectedCategory:ContactCategory? = nil
    @Published var number: Int = 0
    private let network = NetworkingManager()
    
    func fetchShortContacts(){
        network.fetchData(path: "/api/pages/short-contacts", method: .get){
            result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([Contact].self, from: data)
                    DispatchQueue.main.async {
                        self.shortContacts = decodedData
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
        network.fetchData(path: "/api/pages/contact-categories", method: .get){
            result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([ContactCategory].self, from: data)
                    DispatchQueue.main.async {
                        self.categories = decodedData
                        self.selectCategory(category: self.categories.first!)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func selectCategory(category : ContactCategory){
        self.selectedCategory = category;
        self.number = category.order ?? 0
        fetchContacts()
    }
    
    func fetchContacts() {
         
          var urlComponents = URLComponents(string: "https://smartcityapp.ikn.go.id/api/pages/contacts")!

      
          urlComponents.queryItems = [
              URLQueryItem(name: "category", value:self.selectedCategory?.title_id ?? "" )
          ]

          guard let url = urlComponents.url else {
              print("Invalid URL")
              return
          }

          URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
        
                  do {
                      let decoder = JSONDecoder()
                      let decodedData = try decoder.decode(ContactsResponse.self, from: data)

                      DispatchQueue.main.async {
                          self.contactResponse = decodedData
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
