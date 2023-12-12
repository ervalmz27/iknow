//
//  ContactsUIView.swift
//  ikn
//
//  Created by Cong Fandi on 12/12/23.
//

import SwiftUI

struct ContactsUIView: View {
    @ObservedObject var viewModel = ContactsViewModel()
    var body: some View {
        ZStack{
            Color("IKN App Brown").ignoresSafeArea()
            VStack{
                ContactsHeaderUIView().padding(.bottom,16)
                ContactShortcutUIView(contacts: viewModel.shortContacts).frame(height: 128)
                ContactsCategoryUIView(viewModel: viewModel,categories: viewModel.categories)
                ContactsListUIView(contacts: viewModel.contactResponse)
            }.padding(16)
        }.onAppear{
            viewModel.fetchShortContacts()
            viewModel.fetchCategory()
        }
    }
}

#Preview {
    ContactsUIView()
}
