//
//  HealtListUIView.swift
//  ikn
//
//  Created by Naufal on 13/12/23.
//

import SwiftUI

struct HealthListUIView: View {
    let healths : [Health]
    let viewModel: HealthViewModel
    let title : String
    init(healths: [Health],title:String,viewModel: HealthViewModel) {
        self.healths = healths
        self.title = title
        self.viewModel = viewModel
    }
    var body: some View {
        let healtList = healths
        ZStack{
            Color.white
            
            ScrollView{
                
                VStack(alignment: .leading){
                    Text("\(viewModel.title )").bold().font(.system(size: 16)).padding(.bottom, 14)
                    
                    
                    ForEach(healtList ,id: \.id) {item in
                        NavigationLink{
                            AppWebView(urlString: item.mapLink ?? "", title: item.titleID ?? "").navigationBarHidden(true)
                        }label: {
                            VStack(alignment: .leading){
                                
                                Text(item.titleID ?? "").bold().font(.system(size: 16)).foregroundStyle(Color.black )
                                Text(item.rsType ?? "").font(.system(size: 14)).multilineTextAlignment(.leading)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                    .foregroundStyle(Color("Dark 2"))
                                Text(item.address).font(.system(size: 14)).multilineTextAlignment(.leading)
                                    .lineLimit(1)
                                    .truncationMode(.tail).foregroundStyle(Color("Dark 1"), Color("Dark 1"))
                                HStack{
                                    Text( item.openTime ?? "" ).font(.system(size: 14))
                                        .truncationMode(.tail).foregroundStyle(Color("Dark 1"), Color("Dark 1"))
                                  
                                        Circle()
                                            .frame(width: 4, height: 4)
                                            .foregroundColor(.black)
                                        Text(item.phone ?? "").font(.system(size: 14))
                                            .truncationMode(.tail).foregroundStyle(Color("Dark 1"), Color("Dark 1"))
                                
                                }.padding(.top,-8)
                                DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                }.padding(20)
            }
        }.cornerRadius(12)
    }
}
