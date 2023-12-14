//
//  SectionOneUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct SectionOneUIView: View {
    let sectionOne : Section1?
    init(sectionOne: Section1?) {
        self.sectionOne = sectionOne
    }
    
    var body: some View {
        let sectionData = sectionOne?.contents
        VStack(alignment: .leading){
            Text("\(sectionOne?.titleID ?? "")").bold().font(.system(size: 18))
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 12) {
                ForEach(sectionData ?? [], id: \.id) { item in
                    SectionOneItemView(sectionData: item)
                }
            }
            Button(action: {
                // Action when the button is tapped
            }) {
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
            }.padding(.vertical,16)
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
            VStack(alignment: .leading){
                
                AppImageUIView(url: sectionData.thumbnail ?? "")
                Text(sectionData.tourismCategoryTitleID ?? "").bold().font(.system(size: 12)).foregroundStyle(Color("Dark 2"), Color("Dark 2")).padding(.top,12)
                Text(sectionData.titleID ?? "").bold().font(.system(size: 12)).foregroundStyle(Color("Dark 1"), Color("Dark 1")).padding(.top,4).multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text(sectionData.location ?? "").bold().font(.system(size: 12)).foregroundStyle(Color("IKN App Brown"), Color("IKN App Brown")).padding(.top,4)
                
            }
        }
    }
}
