//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

struct LeftMenuListRowView: View {
    
    let leftMenuNavigationItem: leftMenuNavigationItemModel
    
    var body: some View {
        
        ZStack(alignment: .trailing) {
            HStack {
                Text(leftMenuNavigationItem.title)
//                    .font(.title3)
                    .foregroundColor(Color.preliminaryTextColor)
                    .padding(.leading, 5)
                Spacer()
                
                
            }.frame(maxWidth: .infinity)
                .frame(height: 61)
                .background(Color.blackBackgroundColor)
                .cornerRadius(18, corners: .topRight)
                .cornerRadius(18, corners: .bottomRight)
                .shadow(color: (leftMenuNavigationItem.isSelected ? Color.actualTextColor : Color.clear).opacity(0.6), radius: 1, x: 2.5, y: 1.5)
                .padding(.trailing, 14)
                
            
            ZStack {
                Circle()
                    .fill(Color.blackBackgroundColor)
                Circle()
                    .stroke(leftMenuNavigationItem.isSelected ? Color.actualTextColor : Color.containerColor, style: StrokeStyle(lineWidth: leftMenuNavigationItem.isSelected ? 2 : 3))
                    .background(Color.containerColor.clipShape(Circle()))
                    .padding(7)
            }.frame(width: 32, height: 32)
        }
    }
}

struct LeftMenuListCellView_Previews: PreviewProvider {
    
    static var item1 = leftMenuNavigationItemModel(title: "Main Menu", isSelected: false)
    
    static var item2 = leftMenuNavigationItemModel(title: "Main View One", isSelected: true)
    static var item3 = leftMenuNavigationItemModel(title: "Main View Two", isSelected: false)
    static var item4 = leftMenuNavigationItemModel(title: "Main View Three", isSelected: false)
    static var item5 = leftMenuNavigationItemModel(title: "Main View Four", isSelected: false)
    
    static var previews: some View {
        LeftMenuListRowView(leftMenuNavigationItem: item1)
    }
}
