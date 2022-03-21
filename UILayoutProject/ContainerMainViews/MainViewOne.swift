//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

struct MainViewOne: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .background(.ultraThinMaterial)
                .clipped()
                .opacity(0.25)
            
            Text("Main View One")
        }
    }
}

struct MainViewOne_Previews: PreviewProvider {
    static var previews: some View {
        MainViewOne()
    }
}
