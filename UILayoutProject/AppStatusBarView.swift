//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

struct AppStatusBarView: View {
    @State var currentDate: Date = Date()
    
    @State var statusBarViewsText: String = ""
    
    var body: some View {
        
        HStack(spacing: 18) {
            Text("Gate: \(Text("26L").foregroundColor(Color.blue))").padding(.leading, 10)
            
            MarqueeTextScrollView(
                text: "\(currentDate.preciseMonthDate)/\(currentDate.preciseDayDate)/\(currentDate.preciseYearDate) \(currentDate.preciseLocalTime)(\(currentDate.preciseTimeZoneOffset))  \(currentDate.preciseGMTTime)z  \(currentDate.preciseGMTDate)       ",
                font: UIFont.preferredFont(forTextStyle: .subheadline),
                leftFade: 5,
                rightFade: 4,
                startDelay: 1.0,
                alignment: .trailing
            )
            
            Group {
                Text("\(currentDate.preciseGMTTime)").foregroundColor(Color.timeColor)
                + Text("z ").font(Font.system(size: 14))
                    .foregroundColor(Color.timeColor)
                + Text("(\(currentDate.preciseTimeZoneOffset))").font(Font.system(size: 14))
                    .foregroundColor(Color.calculatedTextColor)
                + Text(" \(currentDate.preciseLocalTime)").foregroundColor(Color.calculatedTextColor)
                + Text(" \(Date().preciseGMTDate)").foregroundColor(Color.logoColor)
                
            }
            .font(Font.system(.callout, design: .monospaced))
            .minimumScaleFactor(0.5)
            .foregroundColor(Color.logoColor)
            .padding(.trailing, 10)
            
            
        }
        .foregroundColor(Color.logoColor)
        .frame(maxWidth: .infinity)
        .frame(height: 28.0)
        .background(Rectangle()
                        .fill(LinearGradient(gradient: ColorGradient.darkGradientColors,
                                             startPoint: UnitPoint(x: 0.3, y: 0.5),
                                             endPoint: UnitPoint(x: 0.9, y: 0.5)))
        )
        .cornerRadius(10)
        .shadow(color: Color.shadowColor, radius: 3, x: 3, y: 4)
        .padding(.horizontal, 10)
        
        
        .onReceive(UTCDate().dateTimer, perform: { timeDate in
            currentDate = timeDate
        })
    }
    
}


struct AppStatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        
        AppStatusBarView()
    }
}
