//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

struct ChecklistAddItemView: View {
    
    @State var checklistItemTextField: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 42)
                
            }
            .frame(width: 240, height: 180, alignment: .top)
            
            CustomTextFields(textFieldTitle: "Item Title", textFieldLabel: 0, textFieldDataType: "Name")
            
        }
    }
}

struct ChecklistAddItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistAddItemView()
    }
}
