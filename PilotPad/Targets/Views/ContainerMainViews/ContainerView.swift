//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI
import Common

struct ContainerView: View {
	
	@State var containerViewTitle: String = ""
	@State var viewHeight: CGFloat = 10.0
	
	var body: some View {
		ZStack(alignment: .top) {
			
			RoundedRectangle(cornerRadius: 12.0)
				.fill(Color.blackBackgroundColor)
				.padding(.top,40)
				.padding(.bottom, 12)
				.padding(.horizontal, 12)
				.background(Color.containerColor)
				.cornerRadius(12)
			
			VStack(spacing: 0) {
				Text(containerViewTitle)
					.multilineTextAlignment(.leading)
					.foregroundColor(Color.preliminaryTextColor)
					.frame(maxWidth: .infinity, alignment: .leading)
					.frame(height: 28.0)
					.padding(.horizontal, 18)
					.background(Rectangle()
												.fill(LinearGradient(gradient: ColorGradient.darkGradientColors,
																						 startPoint: UnitPoint(x: 0.3, y: 0.5),
																						 endPoint: UnitPoint(x: 0.9, y: 0.5)))
					)
					.cornerRadius(12, corners: [.topLeft, .topRight])
					.font(.headline)
				
				Rectangle()
					.fill(Color.containerColor)
					.shadow(color: Color.shadowColor, radius: 3, x: 1, y: 3)
					.frame(height: 2)
					.offset(y:-2)
			}
		}
		.frame(height: viewHeight)
		.shadow(color: Color.shadowColor, radius: 3, x: 3, y: 4)
	}
}

struct SectionContainer<Content: View, Accessory: View>: View  {
	@State var sectionTitle: String = ""
	
	var contentView: () -> Content
	var titleAccessoryView: () -> Accessory = { EmptyView() as! Accessory }
	
	var body: some View {
		VStack(alignment: .leading) {
			// header
			HStack {
				Text(sectionTitle)
					.foregroundColor(Color.preliminaryTextColor)
					.font(.system(size: 14))
					.padding(.vertical, 6)
				
				Spacer()
				
				titleAccessoryView()
			}
			.padding(.horizontal, 23)
			.background(Color.containerColor)
			.shadow(color: Color.shadowColor, radius: 3, x: 1, y: 3)
			
			Spacer(minLength: 12)
			ZStack(alignment: .top) {
				RoundedRectangle(cornerRadius: 12.0)
					.fill(Color.blackBackgroundColor)
					.padding(.horizontal)
					.padding(.bottom)
					.background(Color.containerColor)
					.cornerRadius(12)
				
				contentView()
					.padding()
				
			}
		}
		.background(Color.containerColor)
		.clipped()
		.cornerRadius(12)
	}
}

struct ContainerViews_Previews: PreviewProvider {
	static var frameHeight = 150
	static var previews: some View {
		SectionContainer(
			sectionTitle: "Container",
			contentView: {
				HStack {
					EmptyView()
				}
			},
			titleAccessoryView: {
				Text("hello")
			}
		)
			.preferredColorScheme(.dark)
	}
}
