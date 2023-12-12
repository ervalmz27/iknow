//
//  ArticlesUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct ArticlesUIView: View {
    @ObservedObject var viewModel = ArticlesViewModel()
    var body: some View {
        BaseUIView(content:LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 12) {
           ForEach(viewModel.listArticles ?? [], id: \.id) { item in
               ArticleItemView(sectionData: item)
           }
       }, title: "Artikel & Siaran", isClose: true).onAppear{
           viewModel.getArticles()
       }
    }
}


struct ArticleItemView:View{
    let sectionData : Section2_Content
    init(sectionData: Section2_Content) {
        self.sectionData = sectionData
    }
    var body: some View{
        VStack(alignment: .leading){
            AppImageUIView(url: sectionData.thumbnail ?? "").padding(.bottom,12)
            Text("\(sectionData.titleID ?? "")").padding(.bottom,4).bold().font(.system(size: 16)).lineLimit(1).truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).foregroundColor(Color("Dark 1"))
            Text("\(formatDateString(_: sectionData.createdAt ?? ""))").bold().font(.system(size: 14)).foregroundStyle(Color("IKN App Brown"),Color("IKN App Brown"))
        }
    }
}

#Preview {
    ArticlesUIView()
}
