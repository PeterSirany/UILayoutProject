//
//  NewAircraftView.swift
//  Views
//
//  Created by Richard Poutier on 4/16/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models

public struct NewAircraftView: View {
	@ObservedObject var aircraft: Aircraft
	
	@State private var amount: Decimal?
	
	public init(aircraft: Aircraft) {
		self.aircraft = aircraft
	}
	
	public var body: some View {
		VStack {
			SimpleTextField(text: $aircraft.type, title: "Type", placeholder: "B-737")
			SimpleDecimalTextField(value: $aircraft.emptyWeight, title: "Empty Weight", placeholder: "Kgs")
			SimpleDecimalTextField(value: $aircraft.taxiFuelFlow, title: "Taxi Fuel Flow", placeholder: "Kgs")
			SimpleNumberTextField(value: $aircraft.climbSpeed, title: "CLB Speed", placeholder: "KTS")
			SimpleNumberTextField(value: $aircraft.descentSpeed, title: "DES Speed", placeholder: "KTS")
			SimpleNumberTextField(value: $aircraft.holdingSpeed, title: "Holding Speed", placeholder: "KTS")
			SimpleNumberTextField(value: $aircraft.apchSpeed, title: "Apch Speed", placeholder: "KTS")
			
			Button(action: { printResults() }, label: {
				Text("Print Results")
			})
		}
	}
	
	func printResults() {
		print("--- Aircraft Results ---")
		print("•type        : \(aircraft.type ?? "NA")")
		print("•emptyWeight : \(aircraft.emptyWeight ?? 0)")
		print("•taxFuelFlow : \(aircraft.taxiFuelFlow ?? 0)")
		print("•climbSpeed  : \(aircraft.climbSpeed ?? 0)")
		print("•descentSpeed : \(aircraft.descentSpeed ?? 0)")
		print("•holdSpeed   : \(aircraft.holdingSpeed ?? 0)")
		print("•apchSpeed   : \(aircraft.apchSpeed ?? 0)")
	}
}

struct NewAircraftView_Previews: PreviewProvider {
	static var previews: some View {
		NewAircraftView(aircraft: .init())
			.preferredColorScheme(.dark)
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
