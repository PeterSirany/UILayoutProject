//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

struct MainMenuContainerView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                ContainerView(containerViewTitle: "First Container View", viewHeight: 240)
                
                HStack {
                    Text("The default view is the Main Menu. This first container view will contain a List. When a row is selected, it will navigate to Main View One. Please set up this list with only title and navigation link\n• Row height: 48\n•Container View should diaplay 5 rows\nNavigation will be through the Left Menu sidebar, *and* swipping between Main View One - Main View 4. Swipping back to Main Menu is not pobssible. There is no swipping through the Tab Views, only through the Left Menu sidebar")
                }
                .foregroundColor(Color("TitleLogoColor"))
                .padding(.leading, 17)
                .padding(.top, 18)
            }
            
            ZStack(alignment: .leading) {
            ContainerView(containerViewTitle: "Second Container View", viewHeight: .infinity)
            VStack(alignment: .leading, spacing: 12) {
                Text("Please review and complete app 'Status Bar'. The scrolling text will need to be attrubited. For this and the time display, set up according to best practices.")
                
                Text("Please set up the container views according to best practices. For most of the app, the content in each will be many (3-18) custom textfields, example below.\n•Note: All insets spacing show be 12")
                Text("Please revise the custom textfields with these requirements.\nTextFields will consist of default values based on the folllowing categories:\n• **Weight**\n• **Volume**\n• **Temperature**")
                    .multilineTextAlignment(.leading)
            }
            .foregroundColor(Color("TitleLogoColor"))
            .padding(.leading, 17)
            .padding(.top, 22)
            }
            
            ZStack(alignment: .leading) {
                ContainerView(containerViewTitle: "Container View Three", viewHeight: 117)
                
                HStack {
                    CustomTextFields(textFieldTitle: "Some Title", textFieldLabel: 5280, textFieldDataType: "ºC")
                        .padding(.trailing, 8)
                    CustomTextFields(textFieldTitle: "Some Title 2", textFieldLabel: 128, textFieldDataType: "ºC")
                        .padding(.trailing, 8)
                    CustomTextFields(textFieldTitle: "Some Title 3", textFieldLabel: 1028, textFieldDataType: "ºC")
                        .padding(.trailing, 8)
                    CustomTextFields(textFieldTitle: "Some Title 4", textFieldLabel: 2580, textFieldDataType: "ºC")
                        .padding(.trailing, 8)
                    CustomTextFields(textFieldTitle: "Some Title 5", textFieldLabel: 29, textFieldDataType: "ºC")
                        .padding(.trailing, 8)
                }.padding(.leading, 17)
                    .padding(.top, 22)
            }
        }
    }
}

struct MainMenuContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuContainerView()
            .preferredColorScheme(.dark)
    }
}
