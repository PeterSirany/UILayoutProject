//
//  ContentView.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

public struct ContentView : View {
	public init() { }
	
	@State public var isShowingLeftMenu: Bool = true
	
	@State private var selection: String = "gear"
	@State private var tabSelection: TabBarItem = TabBarItem(iconName: "gear", title: "Settings", color: Color.actualTextColor)
	
	let background_Image = ImagePaint(image: Image(decorative: "Background_Image"))
	
	public var body: some View {
		ZStack() {
			
			Image("Background_Image")
				.resizable()
				.ignoresSafeArea(.all)
			
			VStack {
				TitleBar
				
				HStack(alignment: .top, spacing: 0) {
					
					if isShowingLeftMenu {
						LeftMenuNavigationBarView(selection: $tabSelection) {
							
						}
						.transition(.move(edge: .leading))
						.frame(maxWidth: 324)
						.padding(.bottom, 12)
					}
					
					VStack {
						AppStatusBarView(statusBarViewsText: String("This will contain a string of scrolling information for each view"))
						
						TabView {
							MainMenuContainerView()
								.padding(.horizontal, 12)
								.padding(.bottom, 12)
							
							MainViewOne()
								.padding(.horizontal, 12)
								.padding(.bottom, 12)
							
							MainViewTwo()
								.padding(.horizontal, 12)
								.padding(.bottom, 12)
							
						}.tabViewStyle(.page(indexDisplayMode: .never))
							.background(RoundedRectangle(cornerRadius: 12).fill(.clear).clipped())
					}
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	//        static var isShowingLeftMenu = true
	//    @FocusState static var thisIsFalse: Bool
	
	static var previews: some View {
		
		ContentView()
			.preferredColorScheme(.dark)
	}
}

public extension ContentView {
	private var TitleBar: some View {
		HStack {
			ZStack(alignment: .leading) {
				Group {
					Text(Image(systemName: "paperplane")).fontWeight(.semibold)
					+ Text(" App")
					+ Text("Title").bold()
				}
				.foregroundColor(Color.logoColor)
				.multilineTextAlignment(.trailing)
				.frame(maxWidth: .infinity)
				.frame(height: 32.0)
				.background(Color.blackBackgroundColor)
				
				Button {
					withAnimation(Animation.linear(duration: 0.28)) {
						isShowingLeftMenu.toggle()
					}
				} label: {
					Image(systemName: "line.3.horizontal")
						.foregroundColor(Color.logoColor)
				}
				.frame(height: 32.0)
				.padding(.horizontal, 24)
				
			}
		}
		.background(Color.black
									.edgesIgnoringSafeArea(.top))
	}
}
