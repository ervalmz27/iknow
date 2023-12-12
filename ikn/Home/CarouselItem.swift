//
//  CarouselItem.swift
//  ikn
//
//  Created by Naufal on 05/12/23.
//

import SwiftUI

struct CarouselItemView: View {
    let index: Int

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
            .overlay(
                Text("Item \(index + 1)")
                    .foregroundColor(.white)
                    .font(.title)
            )
            .padding()
    }
}

