//
//  NewFlapsSpeedItemCellView.swift
//  Views
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Common

struct NewFlapsSpeedItemCellView: View {
	var onSubmitPosition: (String) -> Void
	var onSubmitSpeed: (String) -> Void
	
    var body: some View {
			HStack {
				SimpleTextField(
					title: "POS",
					placeholder: "123",
					onCommitText: { self.onSubmitPosition($0) }
				)
					.setWidth(67)
				Spacer(minLength: 17)
				SimpleTextField(
					title: "SPD",
					placeholder: "Vref + KTS",
					onCommitText: { self.onSubmitSpeed($0) }
				)
					.setWidth(94)
			}
			.frame(width: 178)
			.padding(.vertical, 13)
			.padding(.horizontal, 12)
			.addRoundedCornerStrokeBorder(color: .gray.opacity(0.5))
    }
	
	func submitValue(_ str: String) {
		print(str)
	}
}

struct NewFlapsSpeedItemCellView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			VStack {
				NewFlapsSpeedItemCellView(onSubmitPosition: { _ in }, onSubmitSpeed: { _ in })
			}
		}
		.previewInterfaceOrientation(.landscapeLeft)
		.preferredColorScheme(.dark)
	}
}

struct SimpleTextField: View {
	
	@State var text: String = ""
	var title: String
	var placeholder: String
	var onCommitText: (String) -> Void
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(title)
				.lineLimit(1)
				.minimumScaleFactor(0.5)
				.font(.system(size: 13))
			TextField(placeholder, text: $text)
				.font(.system(size: 12))
				.onSubmit {
					self.onCommitText(text)
				}
		}
		.padding(8)
		.addRoundedCornerStrokeBorder(color: text.isEmpty ? Color.preliminaryTextColor : Color.blueBorderColor)
//		.addRoundedCornerStrokeBorder(color: textFieldNumberIsFocused ? Color.warningAlertColor : (textFieldData.isEmpty ? Color.preliminaryTextColor : Color.blueBorderColor), lineWidth: 1)))
		
	}
}
