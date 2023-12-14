//
//  ContactsHeaderUIView.swift
//  ikn
//
//  Created by Cong Fandi on 12/12/23.
//

import SwiftUI

struct ContactsHeaderUIView: View {
    var body: some View {
        HStack{
           
            NavigationLink{
                HomeUIView().navigationBarHidden(true)
            }label: {
                Image("btn_back").resizable().frame(width: 56,height: 56).padding(.trailing,16)
            }
            Text("Daftar Kontak Darurat").font(.system(size: 18,weight:.semibold)).foregroundStyle(.white)
            Spacer()
        }
    }
}

#Preview {
    ContactsHeaderUIView()
}
