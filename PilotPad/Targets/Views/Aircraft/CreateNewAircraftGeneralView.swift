//
//  CreateNewAircraftGeneralView.swift
//  Views
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import ViewModels
import Models

public enum AirspeedUnits: Int, Identifiable {
	case kts = 0
	case kph
	case mph
}
extension AirspeedUnits {
	public var id: Int {
		return self.rawValue
	}
}

public enum AircraftFuelUnits: Int, Identifiable {
	case lbs = 0
	case kbs
	case gal
	case ltr
}
extension AircraftFuelUnits {
	public var id: Int {
		return self.rawValue
	}
}

public class Aircraft: ObservableObject {
	@Published public var type: String?
	@Published public var registration: String?
	@Published public var model: String?
	@Published public var emptyWeight: Double?
	@Published public var taxiFuelFlow: Double?
	@Published public var climbSpeed: Int?
	@Published public var decentSpeed: Int?
	@Published public var holdingSpeed: Int?
	@Published public var apchSpeed: Int?
	
	@Published public var tasCalibration: Double?
	@Published public var etopsEnabled: Bool = false
	@Published public var etopsTime: Int?
	@Published public var etopsSpeed: Double?
	@Published public var restOperationsEnabled: Bool = false
	
	@Published public var flaps: [FlapsSpeedSetting] = []
	@Published public var airspeedUnits: AirspeedUnits = .kts
	@Published public var fuelUnits: AircraftFuelUnits = .lbs
	
	@Published public var centerAndWingTipTanks: Bool = false
	@Published public var fuelJettisonSystem: Bool = false
	@Published public var singlePointRefueling: Bool = false
	@Published public var flightPlansZfwFuelCorrection: Bool = false
	@Published public var weatherRadarSystem: Bool = false
	@Published public var autobreakSystem: Bool = false
	
	@Published public var leftTankCapacity: Double?
	@Published public var rightTankCapacity: Double?
	@Published public var leftWingTipTankCapacity: Double?
	@Published public var centerWingTipTankCapacity: Double?
	@Published public var rightWingTipTankCapacity: Double?
	@Published public var radarBeamWidth: Double?
	
	public init() {
		print("New aircraft created")
	}
}



public struct CreateNewAircraftGeneralView: View {
	enum TextFieldTag {
		case registration
		case type
		case model
		case emptyWeight
		case taxiFuelFlow
		case clbSpeed
		case desSpeed
		case holdingSpeed
		case apchSpeed
		case etopsTime
		case etopsSpeed
		case leftTank
		case rightTank
		case left
		case center
		case right
		case radarBeamWidth
	}
	
	enum SettingsTag {
		case etops
		case restOperations
		case centerWingTipTanks
		case fuelJettisonSystem
		case singlePointRefueling
		case flightPlansZfwFuelCorrection
		case weatherRadarSystem
		case autobreaks
	}
	
	enum SegmentedControlTag {
		case airspeed
		case fuel
	}
	
	public init(aircraft: Aircraft) {
		self.aircraft = aircraft
		self.flapsModel = .init(items: aircraft.flaps)
	}
	
	@ObservedObject public var aircraft: Aircraft
	@ObservedObject public var flapsModel: CreateNewFlapsSpeedItemsModel
	
	public var body: some View {
		HStack(spacing: 21) {
			VStack {
				SimpleTextField(text: $aircraft.registration, title: "Registration", placeholder: "A-123")
				SimpleDecimalTextField(value: $aircraft.emptyWeight, title: "Empty Weight", placeholder: "Kgs")
				SimpleDecimalTextField(value: $aircraft.taxiFuelFlow, title: "Taxi Fuel Flow", placeholder: "Kgs")
				SimpleNumberTextField(value: $aircraft.climbSpeed, title: "CLB Speed", placeholder: "KTS")
				SimpleNumberTextField(value: $aircraft.decentSpeed, title: "DES Speed", placeholder: "KTS")
				SimpleNumberTextField(value: $aircraft.holdingSpeed, title: "Holding Speed", placeholder: "KTS")
				SimpleNumberTextField(value: $aircraft.apchSpeed, title: "Apch Speed", placeholder: "KTS")
				Spacer()
			}
//			.setWidth(125)
			
			VStack(spacing: 20) {
				HStack(spacing: 12) {
					SimpleTextField(text: $aircraft.type, title: "Type", placeholder: "B-737")
					SimpleTextField(text: $aircraft.model, title: "Model", placeholder: "ABC")
				}
				HStack {
					Text("TAS Calibration")
					// for some reason, doing this causes the view to update and then removes the flaps speed settings
//					Slider(value: tasCalibration, in: 0...1)
				}
				CreateNewFlapsSpeedItemsView(model: flapsModel)
					.frame(width: 250, height: 308)	
				Spacer()
			}
//			.setWidth(262)
			
			VStack {
				HStack {
					SettingsOptionToggle(title: "ETOPS", isOn: $aircraft.etopsEnabled)
					Spacer(minLength: 12)
					SimpleNumberTextField(value: $aircraft.etopsTime, title: "ETOPS Time", placeholder: "Enter Minutes")
						.setWidth(125)
						.setHidden(aircraft.etopsEnabled == false)
				}
				HStack {
					SettingsOptionToggle(title: "Rest Operations", isOn: $aircraft.restOperationsEnabled)
					Spacer(minLength: 12)
					SimpleDecimalTextField(value: $aircraft.etopsSpeed, title: "ETOPS Speed", placeholder: "TAS KTS 123")
						.setWidth(125)
						.setHidden(aircraft.etopsEnabled == false)
				}
				Divider()
					.foregroundColor(.preliminaryTextColor)
				
				ScrollView(showsIndicators: false) {
					getSegmentedControl(title: "Airspeed", tag: .airspeed)
					getSegmentedControl(title: "Fuel", tag: .fuel)
					HStack {
						Spacer()
						SimpleDecimalTextField(value: $aircraft.leftTankCapacity, title: "Left Tank", placeholder: "123")
							.setWidth(125)
						SimpleDecimalTextField(value: $aircraft.rightTankCapacity, title: "Right Tank", placeholder: "123")
							.setWidth(125)
					}
					VStack(alignment: .leading) {
						SettingsOptionToggle(title: "Center & Wing Tip Tanks", isOn: $aircraft.centerAndWingTipTanks)
						HStack {
							SimpleDecimalTextField(value: $aircraft.leftWingTipTankCapacity, title: "Left", placeholder: "123")
								.setWidth(90)
							Spacer()
							
							SimpleDecimalTextField(value: $aircraft.centerWingTipTankCapacity, title: "Center", placeholder: "123")
								.setWidth(90)
							Spacer()
							
							SimpleDecimalTextField(value: $aircraft.rightWingTipTankCapacity, title: "Right", placeholder: "123")
								.setWidth(90)
						}.setHidden(aircraft.centerAndWingTipTanks == false)
						
						VStack {
							SettingsOptionToggle(title: "Fuel Jettison System", isOn: $aircraft.fuelJettisonSystem)
							SettingsOptionToggle(title: "Single Point Refueling", isOn: $aircraft.singlePointRefueling)
							SettingsOptionToggle(title: "Flight Plans ZFW Fuel Correction", isOn: $aircraft.flightPlansZfwFuelCorrection)
							SettingsOptionToggle(title: "Weather Radar System", isOn: $aircraft.weatherRadarSystem)
							HStack {
								Spacer()
								SimpleDecimalTextField(value: $aircraft.radarBeamWidth, title: "Radar Beam Wd.", placeholder: "123")
									.setWidth(90)
							}.setHidden(aircraft.weatherRadarSystem == false)
							SettingsOptionToggle(title: "Autobreaks", isOn: $aircraft.autobreakSystem)
							Spacer(minLength: 12)
						}
						
					}
				}
				Spacer()
			}
		}
		.padding()
	}
	
	func getSettingForTag(_ tag: SettingsTag) -> Binding<Bool> {
		return .constant(true)
	}
	
	@ViewBuilder
	func getTextField(title: String, placeholder: String, tag: TextFieldTag) -> some View {
		SimpleTextField(
			text: .constant(""),
			title: title,
			placeholder: placeholder
		)
	}
	
	@ViewBuilder
	func getSegmentedControl(title: String, tag: SegmentedControlTag) -> some View {
		switch tag {
		case .airspeed:
			HStack {
				Text(title)
					.font(.system(size: 16))
					.foregroundColor(.preliminaryTextColor)
				Spacer()
				Picker(
					title,
					selection: $aircraft.airspeedUnits) {
						Text("KTS").tag(AirspeedUnits.kts)
						Text("KPH").tag(AirspeedUnits.kph)
						Text("MPH").tag(AirspeedUnits.mph)
					}.pickerStyle(.segmented)
			}
			
		case .fuel:
			HStack {
				Text(title)
					.font(.system(size: 16))
					.foregroundColor(.preliminaryTextColor)
				Spacer()
				Picker(
					title,
					selection: $aircraft.fuelUnits) {
						Text("LBS").tag(AircraftFuelUnits.lbs)
						Text("KBS").tag(AircraftFuelUnits.kbs)
						Text("GAL").tag(AircraftFuelUnits.gal)
						Text("LTR").tag(AircraftFuelUnits.ltr)
					}.pickerStyle(.segmented)
			}
		}
	}
}

struct CreateNewAircraftGeneralView_Previews: PreviewProvider {
	static var previews: some View {
		CreateNewAircraftGeneralView(aircraft: .init())
			.preferredColorScheme(.dark)
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
