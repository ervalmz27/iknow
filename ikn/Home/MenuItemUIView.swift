//
//  MenuItemUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct MenuItemUIView: View {
    @State private var showAllMenu:Bool=false
    @State private var showWebView:Bool=false
    let menu : HomeMenu
    let allMenu: [HomeMenu]?
    init(menu: HomeMenu,allMenu: [HomeMenu]?) {
        self.menu = menu
        self.allMenu = allMenu
    }
    
    var body: some View {
        Button(action:{
            if(menu.titleID=="Lihat Semua Fitur"){
                showAllMenu=true
            }else{
                showWebView = true
            }
        }
        ){
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
                    .font(.system(size: 11, weight: .regular)).multilineTextAlignment(.center).foregroundColor(Color("Dark 1"))
            }.sheet(isPresented:$showAllMenu){
                AllMenuUIView(menus: allMenu)
            } .sheet(isPresented: $showWebView) {
                WebView(urlString: menu.url ?? "")
            }
        }
    }
}
