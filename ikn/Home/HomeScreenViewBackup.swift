////
////  HomeScreenView.swift
////  ikn
////
////  Created by Naufal on 29/11/23.
////
//
//import SwiftUI
//
//struct HomeScreenViewBackup: View {
//    @ObservedObject var viewModel = HomeViewModel()
//
//    var body: some View {
//        
//        NavigationView{
//            ScrollView {
//                HStack {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 41.69)
//                    Spacer()
//                    HStack(alignment:.center,content: {
//                        Image("wheater").resizable().frame(width:40,height: 40)
//                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
//                            Text("30C")
//                            Text("AQI 50")
//                        })
//                    })
//                }.padding()
//                
//                if let homeData = viewModel.menuHome{
//                    
//                    LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 4) {
//                        ForEach(homeData.menus ?? [], id: \.order) { item in
//                            VStack{
//                                
//                         NavigationLink(destination:
//                                            item.titleID == "Lihat Semua Fitur" ? AnyView(DashboardView()  .navigationBarItems(
//                                                leading:CloseBackButton()
//                                            ).navigationBarBackButtonHidden(true))
//                                        : item.titleID != "Lihat Semua Fitur" ? AnyView(WebView(urlString: item.url ?? "" ) .navigationBarTitle(item.titleID ?? "", displayMode: .inline)
//                                            .navigationBarBackButtonHidden(true)
//                                            .navigationBarItems(
//                                                leading:CustomBackButton(),
//                                                trailing: HStack {
//                                                    Image("home").foregroundColor(.black)
//                                                            .imageScale(.large)
//                                                    
//                                                }
//                                            ))
//                                              : AnyView(EmptyView())
//                                          ){
//                                    AsyncImage(url: URL(string: item.icon ?? "")) { phase in
//                                        switch phase {
//                                        case .success(let image):
//                                            image
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: 50, height: 50)
//                                        case .failure:
//                                            Image(systemName: "photo")
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: 50, height: 50)
//                                        case .empty:
//                                            ProgressView()
//                                        @unknown default:
//                                            EmptyView()
//                                        }
//                                    }
//                                }
//                                
//                                Text(item.titleID ??  "?").font(.system(size: 12)).bold()
//                                
//                            }
//                            
//                        }
//                        
//                    }
//                    DottedDivider().padding()
//                    VStack{
//                        Group{
//                            HStack{
//                                Text(homeData.mainLink?.titleID ?? "").font(.system(size: 24)).bold()
//                                Spacer()
//                            }
//                        }
//                       
//                        NavigationLink(destination: AnyView(WebView(urlString: homeData.mainLink?.url ?? "" ) .navigationBarTitle(homeData.mainLink?.titleID ?? "", displayMode: .inline)
//                            .navigationBarBackButtonHidden(true)
//                            .navigationBarItems(
//                                leading:CustomBackButton(),
//                                trailing: HStack {
//                                    Image("home").foregroundColor(.black)
//                                            .imageScale(.large)
//                                    
//                                }
//                            ))) {
//                            AsyncImage(url: URL(string: homeData.mainLink?.thumbnail ?? "")) { phase in
//                                switch phase {
//                                case .success(let image):
//                                    image
//                                        .resizable()
//                                        .scaledToFit()
//                                    
//                                case .failure:
//                                    Image(systemName: "photo")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 50, height: 50)
//                                case .empty:
//                                    ProgressView()
//                                @unknown default:
//                                    EmptyView()
//                                }
//                            }
//
//                                       }
//                        
//                        HStack{
//                            Text(homeData.mainLink?.subtitleID ?? "").font(.system(size: 16))
//                            Spacer()
//                        }
//                        Group{
//                            DottedDivider().padding()
//                            HStack{
//                                Text(homeData.section1?.titleID ?? "").font(.system(size: 24)).bold()
//                                Spacer()
//                            }
//                        }
//                            
//                 
//                                            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 4) {
//                                                if let section1 = homeData.section1 {
//                                         if let contents = section1.contents {
//                                                                       ForEach(contents, id: \.id) { content in
//                                                                           VStack(alignment: .leading){
//                                                                               AsyncImage(url: URL(string: content.thumbnail ?? "")) { phase in
//                                                                                               switch phase {
//                                                                                               case .success(let image):
//                                                                                                   image
//                                                                                                       .resizable()
//                                                                                                       .scaledToFit()
//                                                                                                       .onTapGesture {
//                                                                                                           openURLInBrowser(content.mapLink ?? "")
//                                                                                                       }
//                                                                                               case .failure(_):
//                                                                                                   Image(systemName: "exclamationmark.icloud")
//                                                                                                       .resizable()
//                                                                                                       .scaledToFit()
//                                                                                                       .foregroundColor(.red)
//                                                                                               case .empty:
//                                                                                                   ProgressView()
//                                                                                               @unknown default:
//                                                                                                   EmptyView()
//                                                                                               }
//                                                                                           }
//                                                                                           .frame(width: 158, height: 159)
//                                                            Text(" \(content.tourismCategoryTitleID ?? "")")
//                                                                               Text(" \(content.titleID ?? "")")                                 }
//                            
//                                        }
//                                                                   }
//                                                               }
//                        
//                                            }
//                        DottedDivider().padding()
//                        HStack{
//                            Text(homeData.section2?.titleID ?? "").font(.system(size: 24)).bold()
//                            Spacer()
//                        }.padding()
//                        Group{
//                        ScrollView(.horizontal){
//                            HStack{
//                                if let section2 = homeData.section2 {
//                                    if let contents = section2.contents {
//                                        ForEach(0..<contents.count, id: \.self) { index in
//                                            VStack(alignment: .leading){
//                                                AsyncImage(url: URL(string: contents[index].thumbnail ?? "")) { phase in
//                                                    switch phase {
//                                                    case .success(let image):
//                                                        image
//                                                            .resizable()
//                                                                
//                                                            .cornerRadius(15)
//                                                            .frame(width: 256, height: 157)
//                                                            .onTapGesture {
//                                                                openURLInBrowser(contents[index].link ?? "")
//                                                            }
//                                                    case .failure(_):
//                                                        Image(systemName: "exclamationmark.icloud")
//                                                            .resizable()
//                                                            .scaledToFit()
//                                                            .foregroundColor(.red)
//                                                    case .empty:
//                                                        ProgressView()
//                                                    @unknown default:
//                                                        EmptyView()
//                                                    }
//                                                }
//                                               
//                                                Text(" \(contents[index].titleID ?? "")")
//                                                    .lineLimit(3)
//                                                                .truncationMode(.tail)
//                                                                .frame(width: 200)
//                                                Text(contents[index].formattedCreatedAt).foregroundColor(Color(
//                                                    red: Double(0xC6) / 255.0,
//                                                    green: Double(0x9A) / 255.0,
//                                                    blue: Double(0x5A) / 255.0
//                                                ))
//
//                                                
//                                            }
//                                        
//                                        }
//                                        
//                                    }
//                                }
//                            }
//                            }
//                        }
//                        Group{
//                            DottedDivider().padding()
//                            VStack{
//                                HStack{
//                                    Text(homeData.contact?.titleID ?? "").font(.system(size: 24)).bold()
//                                    Spacer()
//                                }
//                                AsyncImage(url: URL(string: homeData.contact?.thumbnail ?? "")) { phase in
//                                    switch phase {
//                                    case .success(let image):
//                                        image
//                                            .resizable()
//                                                
//                                            .cornerRadius(5)
//                                            .frame( height: 207)
//                                            
//                                    case .failure(_):
//                                        Image(systemName: "exclamationmark.icloud")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .foregroundColor(.red)
//                                    case .empty:
//                                        ProgressView()
//                                    @unknown default:
//                                        EmptyView()
//                                    }
//                                }
//
//                            }
//                            
//                        }
//                        Group{
//                            DottedDivider().padding()
//                            Text("Nusantara di media sosial")
//                            HStack{
//                                ForEach(homeData.socialMedias ?? [], id: \.id) { sosial in
//                                            VStack(alignment: .leading){
//                                                AsyncImage(url: URL(string: sosial.icon ?? "")) { phase in
//                                                    switch phase {
//                                                    case .success(let image):
//                                                        image
//                                                            .resizable()
//                                                                
//                                                            .cornerRadius(15)
//                                                            .frame(width: 36, height: 37)
//                                                            .onTapGesture {
//                                                                openURLInBrowser(sosial.permalink ?? "")
//                                                            }
//                                                    case .failure(_):
//                                                        Image(systemName: "exclamationmark.icloud")
//                                                            .resizable()
//                                                            .scaledToFit()
//                                                            .foregroundColor(.red)
//                                                    case .empty:
//                                                        ProgressView()
//                                                    @unknown default:
//                                                        EmptyView()
//                                                    }
//                                                }
//                                                }
//                                               
//                                               
//
//                                                
//                                            }
//                                        
//                                        }
//                        
//                                Button(action: {
////                                    // Add your login logic here
////                                    print("Login button tapped")
//                                }) {
//                                    Text("Kirim Saran dan Kritik")
//                                        .foregroundColor(.black)
//                                        .padding()
//                
//                                }.frame(width: 300)
//                                    .background(Color.white) // Background color
//                                               .cornerRadius(8) // Corner radius
//                                               .overlay(
//                                                   RoundedRectangle(cornerRadius: 8)
//                                                       .stroke(Color.gray, lineWidth: 2)
//                                               )
//                                               .padding()
//                              
//                            Button("Syarat dan Ketentuan Aplikasi") {
//                                print("Button tapped!")
//                            }.foregroundColor(Color.customColor)
//                        
//                        }
//                        
//                    
//                        
//                    }.padding()
//                    
//                    
//                    
//                }else{
//                    Spacer()
//                    Text("Loading...")
//                    Spacer()
//                }
//                
//                
//            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//        }
//        .onAppear {
//                    viewModel.fetchData()
//                }
//    }
//    private func openURLInBrowser(_ urlString: String) {
//          if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
//              UIApplication.shared.open(url, options: [:], completionHandler: nil)
//          }
//      }
//}
//extension Color {
//    static let customColor = Color(red: 50/255, green: 114/255, blue: 103/255)
//}
//struct DottedDivider: View {
//    var body: some View {
//        GeometryReader { geometry in
//            Path { path in
//                let y = geometry.size.height / 2
//                path.move(to: CGPoint(x: 0, y: y))
//                path.addLine(to: CGPoint(x: geometry.size.width, y: y))
//            }
//            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
//            .foregroundColor(Color.gray)
//        }
//        .frame(height: 1)
//    }
//}
//struct CustomBackButton: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    var body: some View {
//        HStack {
//            Button(action: {
//                   self.presentationMode.wrappedValue.dismiss()
//                   }) {
//                       HStack {
//                           Image(systemName: "arrow.left").foregroundColor(.black)
//                        
//                       }
//                   }
//           
//                .foregroundColor(.blue)
//        }
//    }
//}
//struct CloseBackButton: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    var body: some View {
//        HStack {
//            Button(action: {
//                   self.presentationMode.wrappedValue.dismiss()
//                   }) {
//                       HStack {
//                           Image(systemName: "xmark.circle" ).resizable()
//                             .frame(width: 32.0, height: 32.0)
//                        
//                       }
//                   } .foregroundColor(.white)
//            Text("Menu")
//                .foregroundColor(.white)
//        }
//    }
//}
//
//struct HomeScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeScreenView()
//    }
//}
//
