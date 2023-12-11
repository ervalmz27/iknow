//
//  HomeContactUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct HomeContactUIView: View {
    let contact:Contact
    var body: some View {
        VStack(alignment: .leading){
            Text("\(contact.titleID ?? "")").bold().font(.system(size: 18)).padding(.bottom,16)
            AppImageUIView(url: contact.thumbnail ?? "").padding(.bottom,12)
        }
    }
}
