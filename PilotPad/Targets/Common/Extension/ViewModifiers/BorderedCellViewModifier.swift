//
//  BorderedCellViewModifier.swift
//  Views
//
//  Created by Richard Poutier on 7/5/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public struct BorderedCell: ViewModifier {
	public func body(content: Content) -> some View {
		content
			.padding()
			.overlay(
				RoundedRectangle(cornerRadius: 10)
					.stroke(lineWidth: 3)
			)
			.foregroundColor(Color.cellBorderColor)
			.padding(.horizontal)
	}
}
