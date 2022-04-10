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
		self.items = []
	}
}


public class FlightPlanItem: Identifiable {
	public init(flightNumber: String, departureAirportCallsign: String, arrivalAirportCallsign: String, departureAirportArrivalDateString: String, arrivalAirportArrivalDateString: String) {
		self.flightNumber = flightNumber
		self.departureAirportCallsign = departureAirportCallsign
		self.arrivalAirportCallsign = arrivalAirportCallsign
		self.departureAirportArrivalDateString = departureAirportArrivalDateString
		self.arrivalAirportArrivalDateString = arrivalAirportArrivalDateString
	}
	
	public let id: UUID = .init()
	public let flightNumber: String
	public let departureAirportCallsign: String
	public let arrivalAirportCallsign: String
	public let departureAirportArrivalDateString: String
	public let arrivalAirportArrivalDateString: String
}

extension FlightPlanItem {
	public static var preview: FlightPlanItem {
		return .init(
			flightNumber: "123",
			departureAirportCallsign: "LAX",
			arrivalAirportCallsign: "CMH",
			departureAirportArrivalDateString: "April 8, 2022",
			arrivalAirportArrivalDateString: "April 8, 2022"
		)
	}
}
