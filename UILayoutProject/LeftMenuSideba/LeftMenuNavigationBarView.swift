//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

struct LeftMenuNavigationBarView<Content: View>: View {
    
    //Main Navigation Views
    @EnvironmentObject var leftMenuNavigationViewModel: LeftMenuNavigationViewModel
    
    func initialize(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    // PageView Content
    @EnvironmentObject var checklistViewModel: ChecklistViewModel
    
    //TabView Content
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = [
        TabBarItem(iconName: "gearshape.2", title: "Settings", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "doc.plaintext", title: "PDF View", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "bed.double", title: "Rest A", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "cloud.sun.rain", title: "Rest B", color: Color.preliminaryTextColor)
    ]
    
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "gear", title: "Settings", color: Color.actualTextColor)
    
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content ) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: ColorGradient.darkGradientColors,
                                     startPoint: UnitPoint(x: 0.15, y: 0.5),
                                     endPoint: UnitPoint(x: 0.7, y: 0.5)))
                .cornerRadius(18, corners: .topRight)
                .cornerRadius(18, corners: .bottomRight)
                .shadow(color: Color.shadowColor, radius: 3, x: 3, y: 4)
            
            VStack {

                VStack {
                    ForEach(leftMenuNavigationViewModel.leftMenuNavigationItems) {item in

                        LeftMenuListRowView(leftMenuNavigationItem: item)
                            .onTapGesture() {
                                withAnimation(Animation.linear(duration: 0.2)) {
                                    leftMenuNavigationViewModel.updateLetMenuNavigationItem(item: item)
                                }

                            }
                    }
                }.padding(.top, 12)
                    .padding(.trailing, 12)

                Divider()
                    .background(Color.blackBackgroundColor)
                    .padding(.horizontal, 12)
                    .padding(.bottom, 12)
                    .shadow(color: Color.shadowColor, radius: 2, x: 2, y: 2)
                
                TabView {
                    PhotosPage()
                        
                    ChecklistPageView()
                        .padding(.vertical, 4)
                }
                .cornerRadius(8)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.darkBackgroundColor, lineWidth: 2).background(Color.darkBackgroundColor)
                                .shadow(color: Color.shadowColor, radius: 4, x: 2, y: 2))
                
                .padding(.horizontal, 24)
        
                
                Spacer()
                Divider()
                    .background(Color.blackBackgroundColor)
                    .shadow(color: Color.shadowColor, radius: 2, x: 2, y: 2)
                    .padding(.horizontal, 12)
                    .padding(.top, 12)
                
                LeftMenuTabBarView(tabs: tabs, selectedTabBarItem: $selection)
   
            }
            .padding(.bottom, 7)
        }.ignoresSafeArea(.all)
    }
}


struct LeftMenuNavigationBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "gearshape.2", title: "Settings", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "doc.plaintext", title: "PDF View", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "bed.double", title: "Rest A", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "cloud.sun.rain", title: "Rest B", color: Color.preliminaryTextColor)
    ]
    
    static var previews: some View {
        LeftMenuNavigationBarView(selection: .constant(tabs.first!)) {
            Color.blue
        }
        .environmentObject(ChecklistViewModel())
        .environmentObject(LeftMenuNavigationViewModel())
        .preferredColorScheme(.dark)
    }
}
