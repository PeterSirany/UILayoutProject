//
//  AddButtonView.swift
//  Views
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct AddButtonView: View {
	var action: () -> Void
    var body: some View {
			Button {
				action()
			} label: {
				ZStack {
					Circle()
						.strokeBorder(Color.white, lineWidth: 1)
						.background(Circle().fill(Color.blackBackgroundColor))
					
					Text("+")
						.font(.system(size: 12))
						.foregroundColor(.white)
				}
			}.buttonStyle(PlainButtonStyle())
				.shadow(
					color: .black,
					radius: 6,
					x: 0,
					y: 3
				)

    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
			AddButtonView(action: {
				print("tapped")
			})
				.preferredColorScheme(.dark)
				.frame(width: 20, height: 20)
		}
}
