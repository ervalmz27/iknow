//
//  TestSwiftUIView.swift
//  ikn
//
//  Created by Cong Fandi on 14/12/23.
//

import SwiftUI

struct TestSwiftUIView: View {
    var body: some View {
        NavigationLink("Press ME"){
            SecondView()
        }
    }
}


struct SecondView: View{
    var body: some View {
        NavigationLink{
            TestSwiftUIView()
        }label: {
            Text("Lets back")
        }
    }
}

#Preview {
    TestSwiftUIView()
}
