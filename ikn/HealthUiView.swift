//
//  HealthUiView.swift
//  ikn
//
//  Created by Naufal on 13/12/23.
//

import SwiftUI

struct HealtUIView: View {
    @ObservedObject var viewModel = HealthViewModel()
    var body: some View {
        ZStack{
            Color("IKN App Brown").ignoresSafeArea()
            VStack{
                HealthHeaderUIView().padding(.bottom,16)
                HealthCategoryUIView(viewModel: viewModel,categories: viewModel.categories)
                HealthListUIView(healths: viewModel.healthResponse)
            }.padding(16)
        }.onAppear{
            viewModel.fetchShortHealth()
            viewModel.fetchCategory()
        }
    }
}

#Preview {
    HealtUIView()
}

