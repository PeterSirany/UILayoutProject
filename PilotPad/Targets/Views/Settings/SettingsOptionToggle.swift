//
//  SettingsOptionToggle.swift
//  Views
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct SettingsOptionToggle: View {
	var title: String
	@Binding var isOn: Bool
    var body: some View {
			HStack {
				Text(title)
					.lineLimit(2)
					.minimumScaleFactor(0.5)
					.font(.system(size: 16))
					.foregroundColor(Color.preliminaryTextColor)
				Spacer()
				VStack {
					Toggle("", isOn: $isOn)
						.labelsHidden()
					Text("No / Yes")
						.font(.system(size: 11))
						.foregroundColor(Color.preliminaryTextColor)
				}
			}
    }
}

struct SettingsOptionToggle_Previews: PreviewProvider {
    static var previews: some View {
			SettingsOptionToggle(title: "Rest Operations", isOn: .constant(true))
				.previewInterfaceOrientation(.landscapeLeft)
    }
}
