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
        BaseUIView(content: ScrollView{
            VStack(alignment: .leading){
                ForEach(menus ?? [],id: \.id){ item in
                    if(item.titleID != "Lihat Semua Fitur"){
                        AllMenuItem(menu: item)
                    }
                }
            }
        }, title: "Menu", isClose: true)
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
                    HStack{
                        Text("SEGERA HADIR").font(.system(size: 8)).foregroundStyle(.white).padding(.horizontal,4).padding(.vertical,2)
                    }.background().presentationCornerRadius(12)
                }
            }
            DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                            .padding(.bottom, 8)
        }
    }
}

#Preview {
    AllMenuUIView(menus: [])
}
