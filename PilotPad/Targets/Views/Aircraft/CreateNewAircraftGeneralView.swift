//
//  CreateNewAircraftView.swift
//  Views
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import ViewModels
import Models

public struct CreateNewAircraftView: View {
	enum SegmentedControlTag {
		case airspeed
		case fuel
	}
	
	public init(viewModel: CreateNewAircraftViewModel) {
		self.viewModel = viewModel
	}
	
	@ObservedObject public var viewModel: CreateNewAircraftViewModel
	
	public var body: some View {
		SectionContainer(
			sectionTitle: "New Aircraft General",
			contentView: {
				HStack(spacing: 21) {
					getLeftColumn()
						.setWidth(125)
					getMiddleColumn()
						.setWidth(262)
					getRightColumn()
				}.padding()
			},
			titleAccessoryView: {
				Button(
					action: {
						viewModel.save()
					},
					label: {
						Text("Save")
					}
				)
			}
		)
	}
	
	@ViewBuilder
	func getLeftColumn() -> some View {
		VStack {
			SimpleTextField(text: $viewModel.aircraft.registration, title: "Registration", placeholder: "A-123")
			SimpleDecimalTextField(value: $viewModel.aircraft.emptyWeight, title: "Empty Weight", placeholder: "Kgs")
			SimpleDecimalTextField(value: $viewModel.aircraft.taxiFuelFlow, title: "Taxi Fuel Flow", placeholder: "Kgs")
			SimpleNumberTextField(value: $viewModel.aircraft.climbSpeed, title: "CLB Speed", placeholder: "KTS")
			SimpleNumberTextField(value: $viewModel.aircraft.descentSpeed, title: "DES Speed", placeholder: "KTS")
			SimpleNumberTextField(value: $viewModel.aircraft.holdingSpeed, title: "Holding Speed", placeholder: "KTS")
			SimpleNumberTextField(value: $viewModel.aircraft.apchSpeed, title: "Apch Speed", placeholder: "KTS")
			Spacer()
		}
	}
	
	@ViewBuilder
	func getMiddleColumn() -> some View {
		VStack(spacing: 20) {
			HStack(spacing: 12) {
				SimpleTextField(text: $viewModel.aircraft.type, title: "Type", placeholder: "B-737")
				SimpleTextField(text: $viewModel.aircraft.model, title: "Model", placeholder: "ABC")
			}
			HStack {
				Text("TAS Calibration")
				// for some reason, doing this causes the view to update and then removes the flaps speed settings
				Slider(value: $viewModel.aircraft.tasCalibration, in: 0...1)
			}
			CreateNewFlapsSpeedItemsView(model: viewModel.flapsModel)
				.frame(height: 308)
			Spacer()
		}
	}
	
	@ViewBuilder
	func getRightColumn() -> some View {
		VStack(alignment: .leading) {
			HStack {
				SettingsOptionToggle(title: "ETOPS", isOn: $viewModel.aircraft.etopsEnabled)
				Spacer(minLength: 12)
				SimpleNumberTextField(value: $viewModel.aircraft.etopsTime, title: "ETOPS Time", placeholder: "Enter Minutes")
					.setHidden(viewModel.aircraft.etopsEnabled == false)
			}
			HStack {
				SettingsOptionToggle(title: "Rest Operations", isOn: $viewModel.aircraft.restOperationsEnabled)
				Spacer(minLength: 12)
				SimpleDecimalTextField(value: $viewModel.aircraft.etopsSpeed, title: "ETOPS Speed", placeholder: "TAS KTS 123")
					.setHidden(viewModel.aircraft.etopsEnabled == false)
			}
			Divider()
				.foregroundColor(.preliminaryTextColor)
			VStack(alignment: .leading) {
				getSegmentedControl(title: "Airspeed", tag: .airspeed)
				getSegmentedControl(title: "Fuel", tag: .fuel)
				self.getLeftRightTanks()
				
				VStack(alignment: .leading) {
					SettingsOptionToggle(title: "Center & Wing Tip Tanks", isOn: $viewModel.aircraft.centerAndWingTipTanks)
					self.getCenterWingTipTanksTextFields()
					
					SettingsOptionToggle(title: "Fuel Jettison System", isOn: $viewModel.aircraft.fuelJettisonSystem)
					SettingsOptionToggle(title: "Single Point Refueling", isOn: $viewModel.aircraft.singlePointRefueling)
					SettingsOptionToggle(title: "Flight Plans ZFW Fuel Correction", isOn: $viewModel.aircraft.flightPlansZfwFuelCorrection)
					SettingsOptionToggle(title: "Weather Radar System", isOn: $viewModel.aircraft.weatherRadarSystem)
					
					HStack {
						Spacer()
						SimpleDecimalTextField(value: $viewModel.aircraft.radarBeamWidth, title: "Radar Beam Wd.", placeholder: "123")
					}.setHidden(viewModel.aircraft.weatherRadarSystem == false)
					
					SettingsOptionToggle(title: "Autobreaks", isOn: $viewModel.aircraft.autobreakSystem)
					
				}
			}
			.padding()
			Spacer()
		}
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
					selection: $viewModel.aircraft.airspeedUnits) {
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
					selection: $viewModel.aircraft.fuelUnits) {
						Text("LBS").tag(AircraftFuelUnits.lbs)
						Text("KBS").tag(AircraftFuelUnits.kbs)
						Text("GAL").tag(AircraftFuelUnits.gal)
						Text("LTR").tag(AircraftFuelUnits.ltr)
					}.pickerStyle(.segmented)
			}
		}
	}
	
	@ViewBuilder
	func getLeftRightTanks() -> some View {
		HStack {
			Spacer()
			SimpleDecimalTextField(value: $viewModel.aircraft.leftTankCapacity, title: "Left Tank", placeholder: "123")
			SimpleDecimalTextField(value: $viewModel.aircraft.rightTankCapacity, title: "Right Tank", placeholder: "123")
		}
	}
	
	@ViewBuilder
	func getCenterWingTipTanksTextFields() -> some View {
		HStack {
			SimpleDecimalTextField(value: $viewModel.aircraft.leftWingTipTankCapacity, title: "Left", placeholder: "123")
			Spacer()
			SimpleDecimalTextField(value: $viewModel.aircraft.centerWingTipTankCapacity, title: "Center", placeholder: "123")
			Spacer()
			SimpleDecimalTextField(value: $viewModel.aircraft.rightWingTipTankCapacity, title: "Right", placeholder: "123")
		}.setHidden(viewModel.aircraft.centerAndWingTipTanks == false)
	}
}

//struct CreateNewAircraftView_Previews: PreviewProvider {
//	static var previews: some View {
//		CreateNewAircraftView(
//			viewModel: CreateNewAircraftViewModel(
//				aircraft: Aircraft()
//			)
//		)
//			.preferredColorScheme(.dark)
//			.previewInterfaceOrientation(.landscapeLeft)
//	}
//}


/*
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
*/
