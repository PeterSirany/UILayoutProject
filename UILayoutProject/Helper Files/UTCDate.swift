//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation
import SwiftUI

class UTCDate: ObservableObject {
    let dateTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
}

extension Formatter {
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

extension Date {
    
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


