//
//  TourismUIView.swift
//  ikn
//
//  Created by Naufal on 11/01/24.
//

import SwiftUI

struct TourismUIView: View {
    @ObservedObject var viewModel = TourismViewModel()
    var body: some View {
        BaseUIView(content:LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing:8) {
            ForEach(viewModel.listTourism ?? [], id: \.id) { item in
                TourismDetailItemView(sectionData: item)
           }
       }, title: "Rekreasi dan Wisata Sekitar", isClose: true).onAppear{
           viewModel.getArticles()
       }
    }
}




#Preview {
    TourismUIView()
}
