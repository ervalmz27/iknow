//
//  ContactsCategoryUIView.swift
//  ikn
//
//  Created by Cong Fandi on 12/12/23.
//

import SwiftUI

struct ContactsCategoryUIView: View {
    let viewModel: ContactsViewModel
    let categories : [ContactCategory]?
    let number :Int
    init(viewModel: ContactsViewModel, categories: [ContactCategory],number:Int) {
        self.viewModel = viewModel
        self.categories = categories
        self.number = number
    }

    var body: some View {
        let selectedOrder = viewModel.selectedCategory?.order
        ScrollView(.horizontal){
            HStack(spacing: 16) {
                ForEach(categories ?? [] , id: \.order) { item in
                    Button(action: {
                        viewModel.selectCategory(category: item)
                    }) {
                        Text("\(item.title_id ?? "")")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding(.horizontal,10)
                            .padding(.vertical,10)
                            .foregroundColor(viewModel.number == item.order ? Color("IKN App Brown") : .white)
                            .background(viewModel.number == item.order ? Color.white : Color.clear)
                            .cornerRadius(100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(viewModel.number == item.order ? Color.white : Color.white , lineWidth: selectedOrder == item.order ? 0 : 1)
                            )
                    }
                }
            }
            .padding()
        }
        
    }
}

