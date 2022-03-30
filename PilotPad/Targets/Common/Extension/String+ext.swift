//
//  String+ext.swift
//  Common
//
//  Created by Richard Poutier on 3/29/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import UIKit

public extension String {
	
	func widthOfString(usingFont font: UIFont) -> CGFloat {
		let fontAttributes = [NSAttributedString.Key.font: font]
		let size = self.size(withAttributes: fontAttributes)
		return size.width
	}
	
	func heightOfString(usingFont font: UIFont) -> CGFloat {
		let fontAttributes = [NSAttributedString.Key.font: font]
		let size = self.size(withAttributes: fontAttributes)
		return size.height
	}
}

