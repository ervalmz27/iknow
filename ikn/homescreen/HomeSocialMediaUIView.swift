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
            Text("Nusantara di media sosial").font(.system(size: 14)).foregroundStyle(Color("Dark 2"),Color("Dark2")).padding(.bottom,20)
            HStack(alignment: .center){
                ForEach(socialMedia ?? [],id: \.id){item in
                    AppImageUIView(url: item.icon ?? "").frame(width: 48, height: 48)
                }
            }
        }
    }
}
