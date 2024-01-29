//
//  AppImageUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct AppImageUIView: View {
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
            case .failure:
                Image("ErrorImage")
                    .resizable()
            case .empty:
                ProgressView()
            @unknown default:
                EmptyView()
            }
        }
    }
}

