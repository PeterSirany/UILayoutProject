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
			Text(title)
				.foregroundColor(.preliminaryTextColor)
				.padding(.vertical, 15)
				.setWidth(217)
				.addRoundedCornerStrokeBorder(color: Color.preliminaryTextColor)
    }
}

struct DatabaseItemView_Previews: PreviewProvider {
    static var previews: some View {
			DatabaseItemView(title: "Airports")
    }
}
