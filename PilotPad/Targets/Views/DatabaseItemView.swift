//
//  DatabaseItemView.swift
//  Views
//
//  Created by Richard Poutier on 4/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Common

struct DatabaseItemView: View {
	var title: String
    var body: some View {
			HStack {
				Image("database").resizable().frame(width: 27, height: 27, alignment: .center).foregroundColor(.white)
				Text(title)
					.foregroundColor(.preliminaryTextColor)
			}.setWidth(217)
				.borderedCell()
				
    }
}

struct DatabaseItemView_Previews: PreviewProvider {
    static var previews: some View {
			DatabaseItemView(title: "Airports")
    }
}
