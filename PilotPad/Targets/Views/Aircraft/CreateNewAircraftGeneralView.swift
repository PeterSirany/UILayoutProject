//
//  CreateNewAircraftGeneralView.swift
//  Views
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct CreateNewAircraftGeneralView: View {
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
	
    var body: some View {
			HStack(spacing: 21) {
				VStack {
					getTextField(title: "Registration", placeholder: "(Optional) A123", tag: .registration)
					getTextField(title: "Empty Weight", placeholder: "Placeholder KGS", tag: .emptyWeight)
					getTextField(title: "Texi Fuel Flow", placeholder: "Units/hr", tag: .taxiFuelFlow)
					getTextField(title: "CLB Speed", placeholder: "Placeholder KTS", tag: .clbSpeed)
					getTextField(title: "DES Speed", placeholder: "Placeholder KTS", tag: .desSpeed)
					getTextField(title: "Holding Speed", placeholder: "Placeholder KTS", tag: .holdingSpeed)
					getTextField(title: "Apch Speed", placeholder: "Placeholder KTS", tag: .apchSpeed)
					Spacer()
				}
				.setWidth(125)
				
				VStack(spacing: 20) {
					HStack(spacing: 12) {
						getTextField(title: "Type", placeholder: "Placeholder A123", tag: .type)
						getTextField(title: "Model", placeholder: "Placeholder ABC", tag: .model)
					}
					CreateNewFlapsSpeedItemsView(model: .init())
						.frame(width: 250, height: 308)
					Spacer()
				}
				.setWidth(262)
				
				VStack {
					HStack {
						SettingsOptionToggle(title: "ETOPS", isOn: getSettingForTag(.etops))
						Spacer(minLength: 12)
						getTextField(title: "ETOPS Time", placeholder: "Enter Minutes", tag: .etopsTime)
							.setWidth(125)
					}
					HStack {
						SettingsOptionToggle(title: "Rest Operations", isOn: getSettingForTag(.etops))
						Spacer(minLength: 12)
						getTextField(title: "ETOPS Speed", placeholder: "TAS KTS 123", tag: .etopsSpeed)
							.setWidth(125)
					}
					Divider()
						.foregroundColor(.preliminaryTextColor)
					
					ScrollView(showsIndicators: false) {
						getSegmentedControl(title: "Airspeed", tag: .airspeed)
						getSegmentedControl(title: "Fuel", tag: .fuel)
						HStack {
							Spacer()
							getTextField(title: "Left Tank", placeholder: "Capacity 123", tag: .leftTank)
								.setWidth(125)
							getTextField(title: "Right Tank", placeholder: "Capacity 123", tag: .rightTank)
								.setWidth(125)
						}
						VStack(alignment: .leading) {
							SettingsOptionToggle(title: "Center & Wing Tip Tanks", isOn: getSettingForTag(.centerWingTipTanks))
							HStack {
								getTextField(title: "Left", placeholder: "Capacity 123", tag: .left)
									.setWidth(90)
								Spacer()
								
								getTextField(title: "Center", placeholder: "Capacity 123", tag: .center)
									.setWidth(90)
								Spacer()
								
								getTextField(title: "Right", placeholder: "Capacity 123", tag: .right)
									.setWidth(90)
							}
							
							VStack {
								SettingsOptionToggle(title: "Fuel Jettison System", isOn: getSettingForTag(.fuelJettisonSystem))
								SettingsOptionToggle(title: "Single Point Refueling", isOn: getSettingForTag(.singlePointRefueling))
								SettingsOptionToggle(title: "Flight Plans ZFW Fuel Correction", isOn: getSettingForTag(.flightPlansZfwFuelCorrection))
								SettingsOptionToggle(title: "Weather Radar System", isOn: getSettingForTag(.weatherRadarSystem))
								HStack {
									Spacer()
									getTextField(title: "Radar Beam Wd.", placeholder: "Degree 123", tag: .radarBeamWidth)
										.setWidth(90)
								}
								SettingsOptionToggle(title: "Autobreaks", isOn: getSettingForTag(.autobreaks))
								Spacer(minLength: 12)
							}
							
						}
					}
					Spacer()
				}
				.setWidth(305)
			}
    }
	
	func getSettingForTag(_ tag: SettingsTag) -> Binding<Bool> {
		return .constant(true)
	}
	
	@ViewBuilder
	func getTextField(title: String, placeholder: String, tag: TextFieldTag) -> some View {
		SimpleTextField(
			title: title,
			placeholder: placeholder,
			onCommitText: { self.commitTextWithTag(text: $0, tag: tag) }
		)
	}
	
	@ViewBuilder
	func getSegmentedControl(title: String, tag: SegmentedControlTag) -> some View {
		switch tag {
		case .airspeed:
			let initialValue: Binding<Int> = .constant(0)
			HStack {
				Text(title)
					.font(.system(size: 16))
					.foregroundColor(.preliminaryTextColor)
				Spacer()
				Picker(
					title,
					selection: initialValue) {
						Text("KTS").tag(0)
						Text("KPH").tag(1)
						Text("MPH").tag(2)
					}.pickerStyle(.segmented)
			}

		case .fuel:
			let initialValue: Binding<Int> = .constant(0)
			HStack {
				Text(title)
					.font(.system(size: 16))
					.foregroundColor(.preliminaryTextColor)
				Spacer()
			Picker(
				title,
				selection: initialValue) {
					Text("LBS").tag(0)
					Text("KBS").tag(1)
					Text("GAL").tag(2)
					Text("LTR").tag(3)
				}.pickerStyle(.segmented)
			}
		}
	}
	
	func commitTextWithTag(text: String, tag: TextFieldTag) {
		
	}
}

struct CreateNewAircraftGeneralView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewAircraftGeneralView()
				.preferredColorScheme(.dark)
				.previewInterfaceOrientation(.landscapeLeft)
    }
}
