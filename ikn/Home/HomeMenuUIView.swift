//
//  HomeMenuUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct HomeMenuUIView: View {
    let allMenu: [HomeMenu]?
    let filteredMenu : [HomeMenu]?
    init(allMenu: [HomeMenu]?, filteredMenu: [HomeMenu]?) {
        self.allMenu = allMenu
        self.filteredMenu = filteredMenu
    }
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 8) {
            ForEach(filteredMenu ?? [], id: \.order) { item in
                MenuItemUIView(menu: item,allMenu: allMenu)
                    .padding(.bottom, 24) // Add spacing between lines
            }
        }
        .padding(.horizontal, 8) // Add spacing between rows
    }
}
