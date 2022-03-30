//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

struct ChecklistRowView: View {
    
    let checklistItem: ChecklistItemModel
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text(checklistItem.title)
                .foregroundColor(checklistItem.isComplete ? Color.actualTextColor : Color.preliminaryTextColor)
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            
            GeometryReader { geometry in
                Path{ path in
                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                }
                .stroke(style: StrokeStyle( lineWidth: 1, dash: [2]))
                .foregroundColor(checklistItem.isComplete ? Color.actualTextColor : Color.preliminaryTextColor)
            }.frame(height: 10)
                .offset(y: -4)
            
            
            
            Image(systemName: checklistItem.isComplete ? "checkmark.circle" : "circle")
                .symbolRenderingMode(.palette)
                .foregroundStyle((checklistItem.isComplete ? Color.actualTextColor : Color.preliminaryTextColor), (checklistItem.isComplete ? Color.preliminaryTextColor : Color.preliminaryTextColor))
                .font(.title2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
    }
}



struct HLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        }
    }
}

struct ChecklistRowView_Previews: PreviewProvider {
    
    static var item1 = ChecklistItemModel(title: "First", isComplete: true)
    static var item2 = ChecklistItemModel(title: "Second", isComplete: false)
    
    static var previews: some View {
        ChecklistRowView(checklistItem: item1)
        ChecklistRowView(checklistItem: item2)
    }
}
