//
//  CreateNewHeadingView.swift
//  Views
//
//  Created by Richard Poutier on 6/17/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

//class Heading {
//
//	let value: Double
//	let variation: HeadingVariation?
//}

protocol CreateNewEntityViewModel {
	
}

struct CreateNewHeadingView: View {
	@Binding var value: Double?
	var title: String
	
	var body: some View {
		SimpleDecimalTextField(value: $value, title: title, placeholder: "Degrees")
	}
}

struct CreateNewHeadingView_Previews: PreviewProvider {
	static var previews: some View {
		CreateNewHeadingView(value: .constant(112), title: "Variation")
	}
}

