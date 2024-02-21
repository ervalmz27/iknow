//
//  HomeUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct HomeUIView: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView{
            VStack{
                if(viewModel.menuHome == nil){
                    LoadingView()
                }else{
                    
                    ScrollView{
                        VStack{
                            HomeHeaderUIView(weather: viewModel.weather).padding(.bottom,12)
                            HomeMenuUIView(allMenu: viewModel.homeData?.menus, filteredMenu: viewModel.menuHome).padding(.bottom,2)
                            DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                                            .padding(.bottom, 8)
                            HomeMainLinkUIView(mainLink: viewModel.homeData?.mainLink).padding(.bottom, 16)
                            DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                                            .padding(.bottom, 8)
                            SectionOneUIView(sectionOne: viewModel.homeData?.section1).padding(.bottom,16)
                            DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                                            .padding(.bottom, 8)
                            SectionTwoUIView(sectionTwo: viewModel.homeData?.section2)
                            DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                               .padding(.top,8)
                            HomeContactUIView(contact: viewModel.homeData?.contact)
                                
                            DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                                            .padding(.bottom, 8)
                            HomeSocialMediaUIView(socialMedia: viewModel.homeData?.socialMedias).padding(.bottom,16)
                            HomeFooterUIView()
                        }
                    }.onAppear{
                        UIScrollView.appearance().showsVerticalScrollIndicator = false
                    }
                }
            }.onAppear{
                viewModel.fetchData()
                viewModel.fetchWeather()
            }.padding(.horizontal,16)
        }
    }
}

struct LoadingView:View {
    var body: some View {
        VStack{
            Spacer()
            Text("Loading...")
            Spacer()
        }
    }
}

#Preview {
    HomeUIView()
}

