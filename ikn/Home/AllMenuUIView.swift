//
//  AllMenuUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct AllMenuUIView: View {
    let menus:[HomeMenu]?
    init(menus: [HomeMenu]?) {
        self.menus = menus
    }
    var body: some View {
        NavigationView{
            BaseUIView(content: ScrollView{
                VStack(alignment: .leading){
                    ForEach(menus ?? [],id: \.id){ item in
                        if(item.titleID != "Lihat Semua Fitur"){
                            NavigationLink{
                                if(item.isUnderDevelopment == false){
                                    if(item.url == nil){
                                        let path = item.titleID
                                        if path == "Daftar Kontak Darurat" {
                                            ContactsUIView().navigationBarHidden(true)
                                        } else if path == "Pelayanan Kesehatan" {
                                            HealtUIView().navigationBarHidden(true)
                                        } else if path == "population-services" {
                                            Text("Population Service")
                                        } else if path == "topup-bills" {
                                            Text("Top Up")
                                        } else if path == "public-transportation" {
                                            Text("Public Transportation")
                                        }
                                    }else{
                                        AppWebView(urlString: item.url ?? "", title: item.titleID ?? "").navigationBarHidden(true)
                                    }
                                }
                            } label: {
                                AllMenuItem(menu: item)
                            }
                        }
                    }
                }
            }, title: "Menu", isClose: true)
        }
    }
}

struct AllMenuItem : View {
    let menu : HomeMenu
    init(menu: HomeMenu) {
        self.menu = menu
    }
    var body: some View {
        VStack{
            HStack(alignment: .center){
                AppImageUIView(url: menu.icon ?? "").frame(width: 48, height: 48).padding(.leading,8)
                Text("\(menu.titleID ?? "")").font(.system(size: 16)).foregroundStyle(Color("Dark 1"))
                Spacer()
                if(menu.isUnderDevelopment == true){
                    Text("SEGERA HADIR")
                                .font(.system(size: 8))
                                .padding(2)
                                .padding(.horizontal, 4)
                                .foregroundColor(.white)
                                .background(Color("Primary Action Color"))
                                .cornerRadius(12)
                }
            }
            DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                            .padding(.bottom, 8)
        }
    }
}
