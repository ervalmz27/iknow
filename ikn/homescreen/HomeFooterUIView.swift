//
//  HomeFooterUIView.swift
//  ikn
//
//  Created by Cong Fandi on 11/12/23.
//

import SwiftUI

struct HomeFooterUIView: View {
    var body: some View {
        VStack{
            Button(action: {
                // Action when the button is tapped
            }) {
                Text("Kirim Saran dan Kritik")
                    .bold()
                    .font(.system(size: 16))
                    .foregroundColor(Color("Dark 1"))
                    .padding(10) // Add padding to the text
                    .frame(maxWidth: .infinity, minHeight: 44) // Set width to screen width and height to 44
                    .overlay(
                        RoundedRectangle(cornerRadius: 8) // Rounded corners
                            .stroke(Color("Dark 2"), lineWidth: 1) // Border color and width
                    )
            }
            Button(action: {
                        // Action when the text is tapped
                        print("Text tapped!")
                    }) {
                        Text("Syarat dan Ketentuan Aplikasi")
                            .bold()
                            .foregroundColor(Color("Primary Action Color"))
                            .underline() // Apply underline style
                            .padding(.horizontal, 20) // Add horizontal padding
                            .padding(.vertical, 10) // Add vertical padding
                    }
        }
    }
}

#Preview {
    HomeFooterUIView()
}
