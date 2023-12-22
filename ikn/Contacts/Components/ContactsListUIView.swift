//
//  ContactsListUIView.swift
//  ikn
//
//  Created by Cong Fandi on 12/12/23.
//

import SwiftUI

struct ContactsListUIView: View {
    let contacts : ContactsResponse?
    init(contacts: ContactsResponse?) {
        self.contacts = contacts
    }
    var body: some View {
        let contactList = contacts?.list_contact
        ZStack{
            Color.white
            Text("\(contacts?.message ?? "")").font(.system(size: 16)).multilineTextAlignment(.center).padding(16)
            ForEach(contactList ?? [],id: \.id){item in
                VStack{
                    HStack{
                        AppImageUIView(url: item.thumbnail ?? "").frame(width: 28,height: 28)
                        Text("\(item.titleID ?? "")").font(.system(size: 16)).lineLimit(1).truncationMode(.tail)
                        Spacer()
                        Image("phone").resizable().frame(width: 24,height: 24)
                    }
                    DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                        .padding(.bottom, 16).padding(.top,16)
                }
            }
        }.cornerRadius(12)
    }
}
