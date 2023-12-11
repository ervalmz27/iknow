//
//  ContentView.swift
//  ikn
//
//  Created by Naufal on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var redirectToHome = false

    var body: some View {
        HomeUIView()
//        VStack {
//            if redirectToHome {
//                NavigationLink(
//                    destination: HomeUIView(),
//                    label: { EmptyView() }
//                )
//                .opacity(0)
//            } else {
//                Image("splash_screen")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                            redirectToHome = true
//                        }
//                    }
//            }
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
