//
//  NewFlapsSpeedItemCellView.swift
//  Views
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Common
import Models

struct NewFlapsSpeedItemCellView: View {
	@Binding public var flapsSpeedSetting: FlapsSpeedSetting
		
	var body: some View {
		HStack {
			SimpleDecimalTextField(
				value: $flapsSpeedSetting.position,
				title: "POS",
				placeholder: "123"
			)
				.setWidth(67)
			Spacer(minLength: 17)
			SimpleDecimalTextField(
				value: $flapsSpeedSetting.speed,
				title: "SPD",
				placeholder: "Vref + KTS"
			)
				.setWidth(94)
		}
		.frame(width: 178)
		.padding(.vertical, 13)
		.padding(.horizontal, 12)
		.addRoundedCornerStrokeBorder(color: .gray.opacity(0.5))
	}
}

struct NewFlapsSpeedItemCellView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			VStack {
//				NewFlapsSpeedItemCellView(onSubmitPosition: { _ in }, onSubmitSpeed: { _ in })
			}
		}
		.previewInterfaceOrientation(.landscapeLeft)
		.preferredColorScheme(.dark)
	}
}
