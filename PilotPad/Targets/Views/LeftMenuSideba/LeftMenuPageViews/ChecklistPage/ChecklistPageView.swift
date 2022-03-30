//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI
import Common
import ViewModels

struct ChecklistPageView: View {
    
    @EnvironmentObject var checklistViewModel: ChecklistViewModel
    
    func initialize(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().contentInset.top = -40
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Preliminary")
                .font(.title3).bold()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.preliminaryTextColor)
                .background(RoundedRectangle(cornerRadius: 5)
                                .fill(LinearGradient(gradient: ColorGradient.blackGradientColors,
                                                     startPoint: UnitPoint(x: 0.3, y: 0.5),
                                                     endPoint: UnitPoint(x: 0.9, y: 0.5))).padding(.horizontal, 8)
                )
                .padding(.top, 8)
            List {
                ForEach(checklistViewModel.checklistItems) {item in
                    
                    ChecklistRowView(checklistItem: item)
                        .onTapGesture(count: 2) {
                            if !item.isComplete {
                                withAnimation(Animation.linear) {
                                    checklistViewModel.updateChecklistItem(item: item)
                                }
                            }
                            
                        }
                        .onLongPressGesture(perform: {
                            if item.isComplete {
                                checklistViewModel.updateChecklistItem(item: item)
                            }
                        })
                }.listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                
            }.frame(maxWidth: .infinity)
            .onAppear{
                self.initialize()
            }
        }
    }
}

struct ChecklistView_Previews: PreviewProvider {
    
    static var previews: some View {
        ChecklistPageView()
            .environmentObject(ChecklistViewModel())
    }
}
