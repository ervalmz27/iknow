//
//  ContactsUIView.swift
//  ikn
//
//  Created by Naufal on 12/12/23.
//

import SwiftUI
import UIKit
struct ContactsUIView: View {
    @ObservedObject var viewModel = ContactsViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("IKN App Brown").ignoresSafeArea()
                VStack{
                    ContactsHeaderUIView().padding(.bottom,16)
                    ContactShortcutUIView(contacts: viewModel.shortContacts).frame(height: 128)
                    ContactsCategoryUIView(viewModel: viewModel,categories: viewModel.categories,number: viewModel.number)
                    ContactsListUIView(contacts: viewModel.contactResponse)
                }.padding(16)
            }.onAppear{
                viewModel.fetchShortContacts()
                viewModel.fetchCategory()
            }
        }
    }
}

#Preview {
    ContactsUIView()
}
