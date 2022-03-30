//
//  Date+ext.swift
//  Common
//
//  Created by Richard Poutier on 3/29/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public extension Date {
	
	//  GMT time
	var preciseGMTDate: String {
		let timeString = "\(Formatter.preciseGMTDate.string(for: self) ?? "")"
		return timeString
	}
	
	var preciseGMTTime: String {
		let timeString = "\(Formatter.preciseGMTTime.string(for: self) ?? "")"
		return timeString
	}
	
	var preciseLocalTime: String {
		let nowtimeString = "\(Formatter.preciseLocalTime.string(for: self) ?? "")"
		return nowtimeString
	}
	
	var preciseYearDate: String {
		let nowYear = "\(Formatter.preciseGMTYear.string(for: self) ?? "")"
		return nowYear
	}
	
	var preciseMonthDate: String {
		let nowMonth = "\(Formatter.preciseGMTMonth.string(for: self) ?? "")"
		return nowMonth
	}
	
	var preciseDayDate: String {
		let nowDay = "\(Formatter.preciseGMTDay.string(for: self) ?? "")"
		return nowDay
	}
	
	var preciseTimeZoneOffset: String {
		let UTCOffset = "\(Formatter.timeZoneOffset.string(for:TimeZone.current.secondsFromGMT() / 3600) ?? "")"
		return UTCOffset
	}
}
