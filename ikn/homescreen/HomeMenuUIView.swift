//
//  HomeMenuUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct HomeMenuUIView: View {
    let homeViewModel: HomeViewModel

    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }

    var body: some View {
        let homeData = homeViewModel.menuHome
        LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 8) {
            ForEach(homeData ?? [], id: \.order) { item in
                MenuItemUIView(menu: item)
                    .padding(.bottom, 24) // Add spacing between lines
            }
        }
        .padding(.horizontal, 8) // Add spacing between rows
    }
}
