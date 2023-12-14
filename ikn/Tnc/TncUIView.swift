//
//  TncUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct TncUIView: View {
    @ObservedObject var viewModel = TncViewModel()

    var body: some View {
        NavigationView{
            BaseUIView(
                content: ScrollView{
                    VStack{
                        Text(viewModel.tnc?.contentID ?? "").font(.system(size: 14)).foregroundStyle(Color("Dark 1"))
                    }
                },
                title: "Syarat dan Ketentuan",
                isClose: true
            )
            .onAppear {
                viewModel.fetchTnc()
            }
        }
    }
}

#Preview {
    TncUIView()
}
