//
//  Formatter+ext.swift
//  Common
//
//  Created by Richard Poutier on 3/29/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public extension Formatter {
	static let preciseGMTDate: DateFormatter = {
		let formatter = DateFormatter()
		// formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.timeZone = TimeZone(abbreviation: "UTC")
		formatter.dateFormat = "EEE dd MMM''yy"
		return formatter
	}()
	
	static let preciseGMTTime: DateFormatter = {
		let formatter = DateFormatter()
		// formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.timeZone = TimeZone(abbreviation: "UTC")
		formatter.dateFormat = "HH:mm"
		return formatter
	}()
	
	static let preciseGMTYear: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy"
		return formatter
	}()
	
	static let preciseGMTMonth: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "MM"
		return formatter
	}()
	
	static let preciseGMTDay: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd"
		return formatter
	}()
	
	static let preciseLocalTime: DateFormatter = {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.dateFormat = "HH:mm"
		return formatter
	}()
	
	static let timeZoneOffset: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.positivePrefix = formatter.plusSign
		return formatter
	}()
}
