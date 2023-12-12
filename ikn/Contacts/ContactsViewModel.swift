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
//        fetchContacts()
    }
    
    private func fetchContacts(){
        network.fetchData(path: "/api/pages/contacts?category=\(String(describing: self.selectedCategory?.title_en))", method: .get){
            result in
            print("DATAKU \(result)")
            switch result {
            case .success(let data):
                print("DATAKU \(data)")
                do {
                    let decodedData = try JSONDecoder().decode(ContactsResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.contactResponse = decodedData
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
