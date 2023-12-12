//
//  ContactShortcutUIView.swift
//  ikn
//
//  Created by Cong Fandi on 12/12/23.
//

import SwiftUI

struct ContactShortcutUIView: View {
    let contacts : [Contact]?
    init(contacts: [Contact]?) {
        self.contacts = contacts
    }
    var body: some View {
        ZStack{
            Color.white
            HStack{
                ForEach(contacts ?? [],id: \.id){item in
                    Button(action: {}){
                        VStack{
                            AppImageUIView(url: item.thumbnail ?? "").frame(width: 48,height: 48)
                            Text("\(item.titleID ?? "")").font(.system(size: 11)).lineLimit(2).multilineTextAlignment(.center).foregroundColor(Color("Dark 1"))
                            
                        }.frame(width: 70, alignment: .center)
                    }
                }
            }
        }.cornerRadius(12)
    }
}
