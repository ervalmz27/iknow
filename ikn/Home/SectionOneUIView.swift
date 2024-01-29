//
//  SectionOneUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct SectionOneUIView: View {
    let columns = Array(repeating: GridItem(.flexible(),spacing: 16), count: 2)

    let sectionOne : Section1?
    init(sectionOne: Section1?) {
        self.sectionOne = sectionOne
    }
    
    var body: some View {
        let sectionData = sectionOne?.contents
        VStack(alignment: .leading){
            Text("\(sectionOne?.titleID ?? "")").foregroundStyle(Color("Dark 1")).font(Font.custom("Inter", size: 18)).bold()

            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(sectionData ?? [], id: \.id) { item in
                    if item.showAtDashboard == true{
                        SectionOneItemView(sectionData: item)
                    }
                 
                }
            }
            NavigationLink{
                TourismUIView().navigationBarHidden(true)
            }label: {
                Text("Lihat Semua")
                    .bold()
                    .font(.system(size: 16))
                    .foregroundColor(Color("Dark 1")) // Text color
                    .padding(10) // Add padding to the text
                    .frame(maxWidth: .infinity, minHeight: 44) // Set width to screen width and height to 44
                    .overlay(
                        RoundedRectangle(cornerRadius: 8) // Rounded corners
                            .stroke(Color("Dark 2"), lineWidth: 1) // Border color and width
                    )
            }
        }
    }
}


struct SectionOneItemView:View{
   
    let sectionData : Section1_Content
    init(sectionData: Section1_Content) {
        self.sectionData = sectionData
    }
    var body: some View{
        NavigationLink{
            AppWebView(urlString: sectionData.mapLink ?? "", title: sectionData.titleID ?? "").navigationBarHidden(true)
        }label: {
            VStack(alignment: .leading,spacing: 2){
                ImageView(urlString: sectionData.thumbnail ?? "").cornerRadius(5).frame(width: 170,height: 159).scaledToFit()
                Text(sectionData.tourismCategoryTitleID ?? "").bold().font(.system(size: 12)).foregroundStyle(Color("Dark 2"), Color("Dark 2")).padding(.top,4)
                Text(sectionData.titleID ?? "").bold().font(Font.custom("Inter", size: 16)).foregroundStyle(Color("Dark 1"), Color("Dark 1")).multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .truncationMode(.tail)
                Text(sectionData.location ?? "").bold().font(Font.custom("Inter", size: 12)).foregroundStyle(Color("IKN App Brown"), Color("IKN App Brown"))
                
            }
        }
    }
}
