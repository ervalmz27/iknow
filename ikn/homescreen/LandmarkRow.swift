//
//  LandmarkRow.swift
//  ikn
//
//  Created by Naufal on 01/12/23.
//

import SwiftUI


struct LandmarkRow: View {
    let landmark:Menu


    var body: some View {
        HStack {
        
            Text(landmark.titleID ?? "")


            Spacer()
        }
    }
}


