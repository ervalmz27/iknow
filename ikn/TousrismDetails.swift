//
//  TousrismDetails.swift
//  ikn
//
//  Created by Naufal on 29/01/24.
//


import SwiftUI


struct TourismDetailItemView:View{
   
    let sectionData : Section1_Content
    init(sectionData: Section1_Content) {
        self.sectionData = sectionData
    }
    var body: some View{
        NavigationLink{
            AppWebView(urlString: sectionData.mapLink ?? "", title: sectionData.titleID ?? "").navigationBarHidden(true)
        }label: {
            VStack(alignment: .leading,spacing: 2){
                ImageView(urlString: sectionData.thumbnail ?? "").cornerRadius(5).frame(width: 158,height: 159).scaledToFit()
                Text(sectionData.tourismCategoryTitleID ?? "").bold().font(.system(size: 12)).foregroundStyle(Color("Dark 2"), Color("Dark 2")).padding(.top,4)
                Text(sectionData.titleID ?? "").bold().font(Font.custom("Inter", size: 17)).foregroundStyle(Color("Dark 1"), Color("Dark 1")).multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .truncationMode(.tail)
                Text(sectionData.location ?? "").bold().font(Font.custom("Inter", size: 12)).foregroundStyle(Color("IKN App Brown"), Color("IKN App Brown"))
                
            }
        }
    }
}

