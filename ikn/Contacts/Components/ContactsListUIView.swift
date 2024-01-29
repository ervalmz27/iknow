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
        let contactList = contacts?.listContact
        ZStack{
            Color.white
            ScrollView{
                VStack{
                    Text("\(contacts?.message ?? "")").font(.system(size: 16)).multilineTextAlignment(.center).padding(16).padding(.horizontal,16)
                    ForEach(contactList ?? [],id: \.id){item in
                            Button(action: {
                                let telephone = "tel://"
                                let formattedString = telephone + item.phone!
                                if let phoneURL = URL(string: formattedString), UIApplication.shared.canOpenURL(phoneURL) {
                                    UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                                } else {
                                    print("Invalid phone number or unable to open URL")
                                }
                            }){
                                HStack{
                            
                                AppImageUIView(url: item.thumbnail ?? "").frame(width: 28,height: 28).padding(.leading, 20)
                                
                                Text("\(item.titleID ?? "")").font(.system(size: 16)).lineLimit(1).truncationMode(.tail).foregroundColor(Color("Dark 1"))
                                Spacer()
                                Image("phone").resizable().frame(width: 24,height: 24)
                                
                                }.padding(.horizontal,16)
                            }.padding(.trailing, 20)
                            
                    
                        DottedSeparator(color: Color(hex: 0xDDDDDD), lineWidth: 1, dash: [4, 4])
                            .padding(.bottom, 16).padding(.top,16)
                        
                    }
                }
            }
        }.cornerRadius(12)
    }
}

