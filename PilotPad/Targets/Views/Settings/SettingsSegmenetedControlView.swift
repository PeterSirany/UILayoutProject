//
//  SettingsSegmenetedControlView.swift
//  Views
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct SettingsSegmenetedControlView: View {
	@State private var favoriteColor = "Red"
	var colors = ["Red", "Green", "Blue"]
	
	var body: some View {
		VStack {
			Picker("What is your favorite color?", selection: $favoriteColor) {
				ForEach(colors, id: \.self) {
					Text($0)
				}
			}
			.pickerStyle(.segmented)
			
			Text("Value: \(favoriteColor)")
		}
	}
}

struct SettingsSegmenetedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSegmenetedControlView()
    }
}
