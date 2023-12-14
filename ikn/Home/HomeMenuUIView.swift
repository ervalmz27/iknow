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
                    NavigationLink{
                        if(item.isUnderDevelopment == false){
                            if(item.url == nil){
                                let path = item.titleID
                                if path == "Daftar Kontak Darurat" {
                                    ContactsUIView().navigationBarHidden(true)
                                } else if path == "Pelayanan Kesehatan" {
                                    Text("Health Service")
                                } else if path == "population-services" {
                                    Text("Population Service")
                                } else if path == "topup-bills" {
                                    Text("Top Up")
                                } else if path == "public-transportation" {
                                    Text("Public Transportation")
                                } else if path == "Lihat Semua Fitur" {
                                    AllMenuUIView(menus: allMenu).navigationBarHidden(true)
                                }
                            }else{
                                AppWebView(urlString: item.url ?? "", title: item.titleID ?? "").navigationBarHidden(true)
                            }
                        }
                    }label: {
                        MenuItemUIView(menu: item)
                            .padding(.bottom, 24)
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
