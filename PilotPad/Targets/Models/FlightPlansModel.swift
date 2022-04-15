//
//  FlightPlansModel.swift
//  Views
//
//  Created by Richard Poutier on 4/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public class FlightPlansModel: ObservableObject {
	
	@Published public var items: [FlightPlanItem]
	
	public init() {
		self.items = [
			.init(
				flightNumber: "56",
				departureAirportCallsign: "kLAX",
				arrivalAirportCallsign: "CMH",
				departureDateString: "Apr 10, 22",
				arrivalDateString: "Apr 10, 22"
			),
			.init(
				flightNumber: "224",
				departureAirportCallsign: "kLAX",
				arrivalAirportCallsign: "CMH",
				departureDateString: "Apr 15, 22",
				arrivalDateString: "Apr 16, 22"
			),
			.init(
				flightNumber: "435",
				departureAirportCallsign: "kLAX",
				arrivalAirportCallsign: "CMH",
				departureDateString: "Apr 30, 22",
				arrivalDateString: "Apr 31, 22"
			)]
	}
}


public class FlightPlanItem: Identifiable {
	internal init(flightNumber: String, departureAirportCallsign: String, arrivalAirportCallsign: String, departureDateString: String, arrivalDateString: String) {
		self.flightNumber = flightNumber
		self.departureAirportCallsign = departureAirportCallsign
		self.arrivalAirportCallsign = arrivalAirportCallsign
		self.departureDateString = departureDateString
		self.arrivalDateString = arrivalDateString
	}
	
	public let id: UUID = .init()
	public let flightNumber: String
	public let departureAirportCallsign: String
	public let arrivalAirportCallsign: String
	public let departureDateString: String
	public let arrivalDateString: String
}

extension FlightPlanItem {
	public static var preview: FlightPlanItem {
		return .init(
			flightNumber: "123",
			departureAirportCallsign: "LAX",
			arrivalAirportCallsign: "CMH",
			departureDateString: "April 8, 2022",
			arrivalDateString: "April 8, 2022"
		)
	}
}
