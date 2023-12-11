//
//  BaseUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct BaseUIView<Content: View>: View {
    let content: Content
    let title: String
    let isClose:Bool
    init(content:Content, title: String, isClose: Bool) {
        self.content = content
        self.title = title
        self.isClose = isClose
    }
    var body: some View {
        ZStack{
            Color("IKN App Brown").ignoresSafeArea()
            VStack{
                HStack{
                    Image("btn_close").resizable().frame(width: 40,height: 40).padding(.trailing,8)
                    Text(title).font(.system(size: 18,weight: .semibold))
                    Spacer()
                }
                ZStack{
                    Color.white.ignoresSafeArea()
                    content.padding(16)
                }.cornerRadius(12)
            }.padding(16)
        }.foregroundColor(.white)
    }
}

#Preview {
    BaseUIView(content: Text("halo"), title: "Back Press", isClose: true)
}
