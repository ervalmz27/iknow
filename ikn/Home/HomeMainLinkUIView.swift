//
//  HomeMainLinkUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct HomeMainLinkUIView: View {
    let mainLink:MainLink?
    init(mainLink: MainLink?) {
        self.mainLink = mainLink
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(mainLink?.titleID ?? "").bold().font(.system(size: 18))
                AsyncImage(url: URL(string: mainLink?.thumbnail ?? "")) { phase in
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
                }
            Text(mainLink?.subtitleID ?? "")
                .font(.system(size: 14, weight: .regular))
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .truncationMode(.tail)
            }
    }
}

