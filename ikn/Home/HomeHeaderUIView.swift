//
//  HomeHeaderUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct HomeHeaderUIView: View {
    
    let weather:WeatherModel?
    
    init(weather: WeatherModel?) {
        self.weather = weather
    }
    
    var body: some View {
        HStack(alignment:.center){
            Image("logo")
            Spacer()
            ImageView(urlString: weather?.data?.icon ?? "").padding(.trailing,6).frame(width: 40,height: 40)
            VStack(alignment: .leading){
                Text("\(weather?.data?.temperature ?? "0")°C").font(.system(size: 11))
                Text("\(weather?.data?.weather ?? "")").font(.system(size: 12)).foregroundStyle(Color("Dark 1"))
            }
        }
    }
}
