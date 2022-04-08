//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

public struct CustomTextFields: View {
	
	public init(textFieldTitle: String, textFieldLabel: Int, textFieldDataType: String) {
		self.textFieldTitle = textFieldTitle
		self.textFieldLabel = textFieldLabel
		self.textFieldData = textFieldDataType
	}
	
	let textFieldTitle: String
	@State var textFieldLabel: Int = 0
	@State var textFieldDataType: String = ""
	@State private var textFieldData = ""
	
	@FocusState private var textFieldNumberIsFocused: Bool
	
	enum TextFieldUnits {
		case lbs
		case kgs
		case ºC
		case ºF
		case inHg
		case QNH
		case feet
		case meter
		
	}
	
	public var body: some View {
		
		ZStack(alignment: .topLeading) {
			ZStack(alignment: .bottom) {
				
				ZStack(alignment: .bottomTrailing) {
					// Only show custom hint text if there is no text entered
					if textFieldData.isEmpty &&  textFieldNumberIsFocused == true {
						Text("*\(textFieldDataType)*")
							.foregroundColor(Color.preliminaryTextColor)
							.font(.subheadline)
						
					}
					TextField("", text: $textFieldData)
						.focused($textFieldNumberIsFocused)
						.foregroundColor(Color.actualTextColor)
						.multilineTextAlignment(.trailing)
						.minimumScaleFactor(0.5)
						.keyboardType(.numbersAndPunctuation)
					
				}
				.font(.system(size: 18, weight: .semibold, design: .default))
				.monospacedDigit()
				.padding(.horizontal, 8)
				.frame(width: 123, height:36.0)
				.background(
					// Add the outline
					RoundedRectangle(cornerRadius: 8)
						.stroke(textFieldNumberIsFocused ? Color.warningAlertColor : (textFieldData.isEmpty ? Color.preliminaryTextColor : Color.blueBorderColor), lineWidth: 1))
				
				Text("\(textFieldLabel)")
					.font(.caption2)
					.offset(x: 0, y: 14)
					.foregroundColor(Color.preliminaryTextColor)
				
			}
			
			Text(textFieldTitle)
				.font(.caption2)
				.multilineTextAlignment(.center)
				.foregroundColor(Color.preliminaryTextColor)
				.padding(.horizontal, 4.5)
				.background(Color.blackBackgroundColor)
				.offset(x: 12, y: -8)
			
		}
		
	}
}

struct CustomTextFields_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			CustomTextFields(textFieldTitle: "Some Title", textFieldLabel: 2460, textFieldDataType: "kgs")
				.preferredColorScheme(.dark)
		}
	}
}
