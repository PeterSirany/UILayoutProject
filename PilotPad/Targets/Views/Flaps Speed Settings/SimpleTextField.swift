//
//  SimpleTextField.swift
//  Views
//
//  Created by Richard Poutier on 4/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct SimpleTextField: View {
	
	@Binding public var text: String?
	var title: String
	var placeholder: String
	
	private var safeText: Binding<String> { Binding (
		get: { self.text ?? "" },
		set: { self.text = $0 }
	)
	}
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(title)
				.lineLimit(1)
				.minimumScaleFactor(0.5)
				.font(.system(size: 13))
			TextField(placeholder, text: safeText)
				.font(.system(size: 12))
		}
		.padding(8)
		.addRoundedCornerStrokeBorder(color: (text?.isEmpty ?? true) ? Color.preliminaryTextColor : Color.blueBorderColor)
	}
}

struct SimpleDecimalTextField: View {
	@Binding var value: Double?
	
	var title: String
	var placeholder: String
	
	var numberFormatter: NumberFormatter {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.alwaysShowsDecimalSeparator = false
		return formatter
	}
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(title)
				.lineLimit(1)
				.minimumScaleFactor(0.5)
				.font(.system(size: 13))
			TextField(placeholder, value: $value, formatter: numberFormatter)
				.keyboardType(.decimalPad)
				.font(.system(size: 12))
//				.onSubmit {
//					if let val = self.value {
//						self.onCommitValue(val)
//					}
//				}
		}
		.padding(8)
		.addRoundedCornerStrokeBorder(color: value == nil ? Color.preliminaryTextColor : Color.blueBorderColor)
	}
}

struct SimpleNumberTextField: View {
	@Binding public var value: Int?
	
	var title: String
	var placeholder: String
	
	var numberFormatter: NumberFormatter {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.alwaysShowsDecimalSeparator = false
		return formatter
	}
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(title)
				.lineLimit(1)
				.minimumScaleFactor(0.5)
				.font(.system(size: 13))
			TextField(placeholder, value: $value, formatter: numberFormatter)
				.font(.system(size: 12))
				.keyboardType(.decimalPad)
//				.onSubmit {
//					if let val = self.text {
//						self.onCommitValue(val)
//					}
//				}
		}
		.padding(8)
		.addRoundedCornerStrokeBorder(color: value == nil ? Color.preliminaryTextColor : Color.blueBorderColor)
	}
}


struct SimpleTextField_Previews: PreviewProvider {
    static var previews: some View {
			SimpleTextField(
				text: .constant(""),
				title: "Title",
				placeholder: "Placeholder")
				.preferredColorScheme(.dark)
    }
}



public struct FormattedTextField<Formatter: TextFieldFormatter>: View {
		public init(_ title: String,
								value: Binding<Formatter.Value>,
								formatter: Formatter) {
				self.title = title
				self.value = value
				self.formatter = formatter
		}

		let title: String
		let value: Binding<Formatter.Value>
		let formatter: Formatter

		public var body: some View {
				TextField(title, text: Binding(get: {
						if self.isEditing {
								return self.editingValue
						} else {
								return self.formatter.displayString(for: self.value.wrappedValue)
						}
				}, set: { string in
						self.editingValue = string
						self.value.wrappedValue = self.formatter.value(from: string)
				}), onEditingChanged: { isEditing in
						self.isEditing = isEditing
						self.editingValue = self.formatter.editingString(for: self.value.wrappedValue)
				})
		}

		@State private var isEditing: Bool = false
		@State private var editingValue: String = ""
}

public protocol TextFieldFormatter {
		associatedtype Value
		func displayString(for value: Value) -> String
		func editingString(for value: Value) -> String
		func value(from string: String) -> Value
}



struct CurrencyTextFieldFormatter: TextFieldFormatter {
		typealias Value = Decimal?

		func displayString(for value: Decimal?) -> String {
				guard let value = value else { return "" }
				return NumberFormatter.currency.string(for: value) ?? ""
		}

		func editingString(for value: Decimal?) -> String {
				guard let value = value else { return "" }
				return NumberFormatter.currencyEditing.string(for: value) ?? ""
		}

		func value(from string: String) -> Decimal? {
				let formatter = NumberFormatter.currencyEditing
				let value = formatter.number(from: string)?.decimalValue
				let formattedString = value.map { formatter.string(for: $0) } as? String
				return formattedString.map { formatter.number(from: $0)?.decimalValue } as? Decimal
		}
}

extension NumberFormatter {
		static let currency: NumberFormatter = {
				let formatter = NumberFormatter()
				formatter.numberStyle = .currency
				return formatter
		}()

		static let currencyEditing: NumberFormatter = {
				let formatter = NumberFormatter()
				formatter.numberStyle = .decimal
				formatter.groupingSeparator = ""
				formatter.minimumFractionDigits = NumberFormatter.currency.minimumFractionDigits
				formatter.maximumFractionDigits = NumberFormatter.currency.maximumFractionDigits
				return formatter
		}()
}
