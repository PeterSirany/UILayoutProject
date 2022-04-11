//
//  SimpleTextField.swift
//  Views
//
//  Created by Richard Poutier on 4/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

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
	}
}


struct SimpleTextField_Previews: PreviewProvider {
    static var previews: some View {
			SimpleTextField(
				title: "Title",
				placeholder: "Placeholder",
				onCommitText: { _ in })
				.preferredColorScheme(.dark)
    }
}
