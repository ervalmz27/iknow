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
            Text("\(sectionTwo?.titleID ?? "")").foregroundStyle(Color("Dark 1")).font(Font.custom("Inter", size: 18)).bold()
.padding(.bottom,8)
            ScrollView(.horizontal){
                HStack{
                    ForEach(sectionTwo?.contents ?? [], id: \.id) { item in
                        NavigationLink{
                            AppWebView(urlString: item.link ?? "",title: item.titleID ?? "").navigationBarHidden(true)
                        }label: {
                            SectionTwoItemView(sectionData: item).frame(width: 200).padding(.trailing,14).navigationBarHidden(true)
                        }
                    }
                    
                    NavigationLink{
                        ArticlesUIView().navigationBarHidden(true)
                    }label: {
                        LoadMoreView()
                    }
                }
            }
        }
    }
}

	
struct LoadMoreView: View {
    var body: some View {
            VStack(alignment: .leading) {
                Image(systemName: "arrow.right")
                Text("Lihat Semua Artikel").font(.system(size: 11))
            }.foregroundColor(Color("Dark 1"))
    }
}

struct SectionTwoItemView:View{
    let sectionData : Section2_Content
    init(sectionData: Section2_Content) {
        self.sectionData = sectionData
    }
    var body: some View{
        VStack(alignment: .leading,spacing: 2){
            ImageView(urlString: sectionData.thumbnail ?? "") .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 159)
                                .cornerRadius(5)
                   Text("\(sectionData.titleID ?? "")").bold().font(Font.custom("Inter", size: 16)).foregroundStyle(Color("Dark 1"), Color("Dark 1")).multilineTextAlignment(.leading)
                .lineLimit(2)
                .truncationMode(.tail)
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
