//
//  HeathCategoryUiView.swift
//  ikn
//
//  Created by Naufal on 13/12/23.
//

import SwiftUI

struct HealthCategoryUIView: View {
    let viewModel: HealthViewModel
    let categories : [HealthCategory]?
    let number :Int
    init(viewModel: HealthViewModel, categories: [HealthCategory],number:Int) {
        self.viewModel = viewModel
        self.categories = categories
        self.number = number
    }

    var body: some View {
        let selectedOrder = viewModel.selectedHealth?.order
        ScrollView(.horizontal){
            HStack(spacing: 16) {
                ForEach(categories ?? [] , id: \.order) { item in
                    Button(action: {
                        viewModel.selectHealth(healths: item)
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
