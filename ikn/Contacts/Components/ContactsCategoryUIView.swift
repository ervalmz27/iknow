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
    init(viewModel: ContactsViewModel, categories: [ContactCategory]) {
        self.viewModel = viewModel
        self.categories = categories
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
                            .foregroundColor(selectedOrder == item.order ? .yellow : .white)
                            .background(selectedOrder == item.order ? Color.white : Color.clear)
                            .cornerRadius(100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(selectedOrder == item.order ? Color.white : .yellow, lineWidth: selectedOrder == item.order ? 0 : 1)
                            )
                    }
                }
            }
            .padding()
        }
        
    }
}

