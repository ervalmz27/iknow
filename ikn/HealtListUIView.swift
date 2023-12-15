//
//  HealtListUIView.swift
//  ikn
//
//  Created by Naufal on 13/12/23.
//

import SwiftUI

struct HealthListUIView: View {
    let healths : HealthResponse?
    init(healths: HealthResponse?) {
        self.healths = healths
    }
    var body: some View {
        let healtList = healths?.list_health
        ZStack{
            Color.white
            //            Text("\(healths?.message ?? "")").font(.system(size: 16)).multilineTextAlignment(.center).padding(16)
            ForEach(healtList ?? [],id: \.id) {item in
              
                    VStack(alignment: .leading){
                        
                        Text(item.titleID ?? "").bold().font(.system(size: 14))
                        Text(item.rsType ?? "").font(.system(size: 12)).foregroundStyle(Color("Dark 1"), Color("Dark 1")).padding(.top,4).multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        Text(item.address).font(.system(size: 12)).padding(.top,4).multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        HStack{
                            Text("Buka " + (item.openTime ?? "")  ).font(.system(size: 12)).padding(.top,4).multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            HStack{
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.black)
                                Text(item.phone ?? "").font(.system(size: 12)).padding(.top,4).multilineTextAlignment(.leading)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                            
                        }
                        
                        //                        AppImageUIView(url: item.thumbnail ?? "").frame(width: 28,height: 28)
                        //                        Text("\(item.titleID ?? "")").font(.system(size: 16)).lineLimit(1).truncationMode(.tail)
                        //                        Spacer()
                        //                        Image("phone").resizable().frame(width: 24,height: 24)
                        
                        DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                            .padding(.bottom, 16).padding(.top,16)
                    }
                }
            }.cornerRadius(12)
        }
    }
}
