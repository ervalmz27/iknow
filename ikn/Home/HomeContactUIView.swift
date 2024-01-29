//
//  HomeContactUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct HomeContactUIView: View {
    let contact:Contact?
    init(contact: Contact?) {
        self.contact = contact
    }
    var body: some View {
        Button(action: {
            openMailApp()
        }, label: {
            VStack(alignment: .leading){
                Text("\(contact?.titleID ?? "")").foregroundStyle(Color("Dark 1")).font(Font.custom("Inter", size: 18)).bold()
                AppImageUIView(url: contact?.thumbnail ?? "").frame(
                    height: 159
                ).cornerRadius(5).padding(.bottom,8)
            }
        })
    }
    
    func openMailApp() {
        let email = contact?.email ?? ""
            let subject = "[Kolaborasi] - [Subject email]"
        let body = "Halo, saya ingin bertanya terkait \(contact?.titleID ?? "")"

        if let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let url = URL(string: "mailto:\(email)?subject=\(encodedSubject)&body=\(encodedBody)")
               {
                   UIApplication.shared.open(url)
               }
        }
    
    
}
