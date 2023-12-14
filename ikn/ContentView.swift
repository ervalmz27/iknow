//
//  ContentView.swift
//  ikn
//
//  Created by Naufal on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HomeUIView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class AppViewModel : ObservableObject{
    @Published var currentView = AppRoute.Home
    let homeViewModel = HomeViewModel()
}
