//
//  HomeSocialMediaUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct HomeSocialMediaUIView: View {
    let socialMedia: [SocialMedia]?
    var body: some View {
        VStack{
            Text("Nusantara di media sosial").font(Font.custom("Inter", size: 18)).bold().foregroundStyle(Color("Dark 2"),Color("Dark2")).padding(.bottom,20)
            HStack(alignment: .center){
                ForEach(socialMedia ?? [],id: \.id){item in
                    Link(destination: URL(string: item.permalink ?? "")!, label: {
                        AppImageUIView(url: item.icon ?? "").frame(width: 48, height: 48).padding(.horizontal,16)
                    })
                }
            }
        }
    }
}
