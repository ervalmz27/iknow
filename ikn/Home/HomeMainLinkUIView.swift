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
        NavigationLink{
            AppWebView(urlString: mainLink?.link ?? "", title: mainLink?.titleID ?? "").navigationBarHidden(true)
        }label: {
            VStack(alignment: .leading){
                Text(mainLink?.titleID ?? "").foregroundStyle(Color("Dark 1")).font(Font.custom("Inter", size: 18)).bold()

                ImageView(urlString: mainLink?.thumbnail ?? "").cornerRadius(5)
                                                            .scaledToFit()
                Text(mainLink?.subtitleID ?? "")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color("Dark 1"))
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .truncationMode(.tail)
                }
        }
    }
}

