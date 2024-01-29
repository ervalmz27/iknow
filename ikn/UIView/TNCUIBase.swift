//
//  TNCUIBase.swift
//  ikn
//
//  Created by Naufal on 10/01/24.
//

import SwiftUI

struct TNCUIBase<Content: View>: View {
    
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
                VStack{
                    HStack{
                        NavigationLink{
                            HomeUIView().navigationBarHidden(true)
                        }label: {
                            Image("btn_close").resizable().frame(width: 40,height: 40).padding(.trailing,8)
                        }
                        Text(title).font(.system(size: 18,weight: .semibold))
                        Spacer()
                    }
                    ZStack{
                        Color.white.ignoresSafeArea()
                        content.padding(16)
                    }.cornerRadius(12)
                    
                }.padding()
                NavigationLink{
                    HomeUIView().navigationBarHidden(true)
                }label: {
                    VStack {
                        Text("SETUJU")
                            .bold()
                            .font(.system(size: 16))
                            .foregroundColor(Color.white)
                            .padding(14) //
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color("Green 1"))
                            .cornerRadius(8)
                    }
                    .padding(.vertical, 35).padding(.horizontal,14)
                    
                    .background(RoundedCorners(color: .white, tl: 15, tr: 15, bl: 0, br: 0))
                    .frame(height: 50)
                    .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                    
                }}
            
        }.foregroundColor(.white)
    }
}

#Preview {
    TNCUIBase(content: Text("halo"), title: "Back Press", isClose: true)
}
