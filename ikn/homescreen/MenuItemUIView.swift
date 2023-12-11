//
//  MenuItemUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct MenuItemUIView: View {
    let menu : HomeMenu
    init(menu: HomeMenu) {
        self.menu = menu
    }
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: menu.icon ?? "")) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                            case .empty:
                                ProgressView()
                            @unknown default:
                                EmptyView()
                            }
            }.frame(
                width: 48,
                height: 48
            )
            Text(menu.titleID ?? "")
                .font(.system(size: 11, weight: .regular)).multilineTextAlignment(.center)
        }
    }
}
