//
//  HomeContactUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct HomeContactUIView: View {
    let healt:Health?
    init(healt: Health?) {
        self.healt = healt
    }
    var body: some View {
        VStack(alignment: .leading){
            Text("\(healt?.titleID ?? "")").bold().font(.system(size: 18)).padding(.bottom,16)
//            AppImageUIView(url: healt?.thumbnail ?? "").padding(.bottom,12)
        }
    }
}
