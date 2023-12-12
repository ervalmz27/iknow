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
        VStack{
            if(viewModel.menuHome == nil){
                LoadingView()
            }else{
                HomeHeaderUIView(weather: viewModel.weather).padding(.bottom,12)
                ScrollView{
                    VStack{
                        HomeMenuUIView(allMenu: viewModel.homeData?.menus, filteredMenu: viewModel.menuHome).padding(.bottom,16)
                        DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                                        .padding(.bottom, 16)
                        HomeMainLinkUIView(mainLink: viewModel.homeData?.mainLink).padding(.bottom, 16)
                        DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                                        .padding(.bottom, 16)
                        SectionOneUIView(sectionOne: viewModel.homeData?.section1).padding(.bottom,16)
                        DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                                        .padding(.bottom, 32)
                        SectionTwoUIView(sectionTwo: viewModel.homeData?.section2)
                        DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                            .padding(.bottom, 16).padding(.top,16)
                        HomeContactUIView(contact: viewModel.homeData?.contact).padding(.bottom,16)
                        DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                                        .padding(.bottom, 16)
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

struct LoadingView:View {
    var body: some View {
        VStack{
            Spacer()
            Text("Loading...")
            Spacer()
        }
    }
}

