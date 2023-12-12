//
//  SectionTwoUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct SectionTwoUIView: View {
    
    let sectionTwo:Section2?
    
    init(sectionTwo: Section2?) {
        self.sectionTwo = sectionTwo
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\(sectionTwo?.titleID ?? "")").bold().font(.system(size: 18)).padding(.bottom,12)
            ScrollView(.horizontal){
                HStack{
                    ForEach(sectionTwo?.contents ?? [], id: \.id) { item in
                        SectionTwoItemView(sectionData: item).frame(width: 200).padding(.trailing,14)
                    }
                    
                    LoadMoreView()
                }
            }
        }
    }
}

	
struct LoadMoreView: View {
    @State private var isShowingArticlesView = false

    var body: some View {
        Button(action: {
            isShowingArticlesView = true
        }) {
            VStack(alignment: .leading) {
                Image(systemName: "arrow.right")
                Text("Lihat Semua Artikel").font(.system(size: 11))
            }
        }.sheet(isPresented: $isShowingArticlesView){
            ArticlesUIView()
        }
    }
}

struct SectionTwoItemView:View{
    let sectionData : Section2_Content
    init(sectionData: Section2_Content) {
        self.sectionData = sectionData
    }
    var body: some View{
        VStack(alignment: .leading){
            AppImageUIView(url: sectionData.thumbnail ?? "").padding(.bottom,12).frame(height: 200)
            Text("\(sectionData.titleID ?? "")").padding(.bottom,4).bold().font(.system(size: 16)).lineLimit(1).truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            Text("\(formatDateString(_: sectionData.createdAt ?? ""))").bold().font(.system(size: 14)).foregroundStyle(Color("IKN App Brown"),Color("IKN App Brown"))
        }
    }
}

func formatDateString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd MMMM yyyy"
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
