//
//  HealthHeaderUIView.swift
//  ikn
//
//  Created by Naufal on 13/12/23.
//

import Foundation

import SwiftUI

struct HealthHeaderUIView: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image("btn_back").resizable().frame(width: 56,height: 56).padding(.trailing,16)
            }
            Text("Pelayanan Kesehatan").font(.system(size: 18,weight:.semibold)).foregroundStyle(.white)
            Spacer()
        }
    }
}

#Preview {
    HealthHeaderUIView()
}
