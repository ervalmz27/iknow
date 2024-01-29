//
//  RekreasiUIView.swift
//  ikn
//
//  Created by Naufal on 11/01/24.
//


import SwiftUI

struct RekreasiUIView: View {
    let sectionData : [Section1_Content]?
    init(sectionData: [Section1_Content]) {
        self.sectionData = sectionData
    }
    var body: some View {
        BaseUIView(content:LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing:8) {
            ForEach(sectionData ?? [], id: \.id) { item in
                SectionOneItemView(sectionData: item)
           }
       }, title: "Rekreasi dan Wisata Sekitar", isClose: true)
    }
}


struct RekreasiItemView:View{
    let sectionData : Section1_Content
    init(sectionData: Section1_Content) {
        self.sectionData = sectionData
    }
    var body: some View{
        VStack(alignment: .leading){
            AppImageUIView(url: sectionData.thumbnail ?? "").padding(.bottom,12).cornerRadius(5).frame(width: 146,height: 110).scaledToFit()
            Text("\(sectionData.titleID ?? "")").padding(.bottom,4).bold().font(.system(size: 16)).lineLimit(1).truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).foregroundColor(Color("Dark 1"))
            Text("\(formatDateString(_: sectionData.createdAt ?? ""))").bold().font(.system(size: 14)).foregroundStyle(Color("IKN App Brown"),Color("IKN App Brown"))
          
        }
    }
}

#Preview {
    RekreasiUIView(sectionData: [])
}
