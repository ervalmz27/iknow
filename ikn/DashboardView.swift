//
//  DashboardView.swift
//  ikn
//
//  Created by Naufal on 22/11/23.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var dataModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
                   VStack {
                       ZStack {
                           Color.gray.edgesIgnoringSafeArea(.all)
                           
                           List(dataModel.homeData?.menus ?? [],id: \.order){item in
                               HStack{
                                   AsyncImage(url: URL(string: item.icon ?? "")) { phase in
                                       switch phase {
                                       case .success(let image):
                                           image
                                               .resizable()
                                               .scaledToFit()
                                               .frame(width: 50, height: 50)
                                       case .failure:
                                           Image(systemName: "photo")
                                               .resizable()
                                               .scaledToFit()
                                               .frame(width: 50, height: 50)
                                       case .empty:
                                           ProgressView()
                                       @unknown default:
                                           EmptyView()
                                       }
                                   }

                                   Text(item.titleID ?? "helloo")
                                       .foregroundStyle(.black)
                                       .font(.headline)
                               }
                             
                           }
                           .listStyle(PlainListStyle())
                           .background(Color.white) // Warna latar belakang daftar
                           .cornerRadius(10) // Rounding corners for a nice look
                       }
                       .padding()
                       .background( Color(
                                        red: Double(0xC6) / 255.0,
                                        green: Double(0x9A) / 255.0,
                                        blue: Double(0x5A) / 255.0
                                    ))
                   }
               }
        .onAppear {
                    dataModel.fetchData()
                }
    }
        
}




struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

