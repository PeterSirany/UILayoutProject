//
//  MainMenuView.swift
//  Views
//
//  Created by Richard Poutier on 4/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
			VStack {
				FlightPlansView(model: .init())
				
			}
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
