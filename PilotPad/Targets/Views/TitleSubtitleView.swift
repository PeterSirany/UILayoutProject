//
//  TitleSubtitleView.swift
//  Views
//
//  Created by Richard Poutier on 4/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct TitleSubtitleView: View {
	var titlePrefix: String?
	var highlightedTitle: String
	var subtitle: String
	
	var body: some View {
		VStack {
			HStack(spacing: 0) {
				Text(titlePrefix ?? "")
					.font(.system(size: 16))
					.foregroundColor(.preliminaryTextColor)
				Text(highlightedTitle)
					.font(.system(size: 20))
					.foregroundColor(.highlightedTextColor)
			}
			
			Text(subtitle)
				.font(.system(size: 12))
				.foregroundColor(.preliminaryTextColor)
		}
	}
}

struct TitleSubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleSubtitleView(
				titlePrefix: "FLT",
				highlightedTitle: "123",
				subtitle: "Date"
				)
    }
}
