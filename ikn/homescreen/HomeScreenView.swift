//
//  HomeScreenView.swift
//  ikn
//
//  Created by Naufal on 29/11/23.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView{
            ScrollView {
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 41.69)
                    Spacer()
                    HStack(alignment:.center,content: {
                        Image("wheater").resizable().frame(width:40,height: 40)
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                            Text("30C")
                            Text("AQI 50")
                        })// Adjust the height as needed
                    })
                }.padding()
                
                if let homeData = viewModel.homeData{
                    
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 4) {
                        ForEach(homeData.menus ?? [], id: \.order) { item in
                            VStack{
                                
                         NavigationLink(destination:
                                            item.titleID == "Lihat Semua Fitur" ? AnyView(DashboardView()  .navigationBarItems(
                                                leading:CloseBackButton()
                                            ).navigationBarBackButtonHidden(true))
                                        : item.titleID != "Lihat Semua Fitur" ? AnyView(WebView(urlString: item.url ?? "" ) .navigationBarTitle(item.titleID ?? "", displayMode: .inline)
                                            .navigationBarBackButtonHidden(true)
                                            .navigationBarItems(
                                                leading:CustomBackButton(),
                                                trailing: HStack {
                                                    Image("home").foregroundColor(.black)
                                                            .imageScale(.large)
                                                    
                                                }
                                            ))
                                              : AnyView(EmptyView())
                                          ){
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
                                }
                                
                                Text(item.titleID ??  "?").font(.system(size: 12)).bold()
                                
                            }
                            
                        }
                        
                    }
                    DottedDivider().padding()
                    VStack{
                        HStack{
                            Text(homeData.mainLink?.titleID ?? "").font(.system(size: 24)).bold()
                            Spacer()
                        }
                        NavigationLink(destination: DashboardView()) {
                            AsyncImage(url: URL(string: homeData.mainLink?.thumbnail ?? "")) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                    
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

                                       }
                        
                        HStack{
                            Text(homeData.mainLink?.subtitleID ?? "").font(.system(size: 16))
                            Spacer()
                        }
                        DottedDivider().padding()
                        HStack{
                            Text(homeData.section1?.titleID ?? "").font(.system(size: 24)).bold()
                            Spacer()
                        }
                        
                        
                        Text("We have \(homeData.section1?.contents?.count ?? 0) menu items")
//                                            LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 4) {
//                                                ForEach(homeData.section1?.contents ?? [], id:\.self) { item in
//                                                    VStack{
//                                                        AsyncImage(url: URL(string: item.icon ?? "")) { phase in
//                                                            switch phase {
//                                                            case .success(let image):
//                                                                image
//                                                                    .resizable()
//                                                                    .scaledToFit()
//                                                                    .frame(width: 50, height: 50)
//                                                            case .failure:
//                                                                Image(systemName: "photo")
//                                                                    .resizable()
//                                                                    .scaledToFit()
//                                                                    .frame(width: 50, height: 50)
//                                                            case .empty:
//                                                                ProgressView()
//                                                            @unknown default:
//                                                                EmptyView()
//                                                            }
//                                                        }
//                                                        Text(item.titleID ??  "?").font(.system(size: 12)).bold()
//                        
//                                                    }
//                        
//                                                }
//                        
//                                            }
                        
                        
                    }.padding()
                    
                    
                    
                }else{
                    Spacer()
                    Text("Loading...")
                    Spacer()
                }
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .onAppear {
                    viewModel.fetchData()
                }
    }
}
struct DottedDivider: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let y = geometry.size.height / 2
                path.move(to: CGPoint(x: 0, y: y))
                path.addLine(to: CGPoint(x: geometry.size.width, y: y))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundColor(Color.gray)
        }
        .frame(height: 1)
    }
}
struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        HStack {
            Button(action: {
                   self.presentationMode.wrappedValue.dismiss()
                   }) {
                       HStack {
                           Image(systemName: "arrow.left").foregroundColor(.black)
                        
                       }
                   }
           
                .foregroundColor(.blue)
        }
    }
}
struct CloseBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        HStack {
            Button(action: {
                   self.presentationMode.wrappedValue.dismiss()
                   }) {
                       HStack {
                           Image(systemName: "xmark.circle" ).resizable()
                             .frame(width: 32.0, height: 32.0)
                        
                       }
                   } .foregroundColor(.white)
            Text("Menu")
                .foregroundColor(.white)
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}

