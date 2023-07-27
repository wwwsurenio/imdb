//
//  AttributedStringHelper.swift
//  imdb
//
//  Created by User01 on 23/7/23.
//

import Foundation
import UIKit

class AttributedStringHelper {
    static func makeTermsAttributedString() -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 20, options: [:])]
        paragraphStyle.defaultTabInterval = 20
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.headIndent = 20
        paragraphStyle.paragraphSpacingBefore = 5
        
        let termsText = "By continuing, you are accepting our\nTerms of Service and Privacy"
        let attributedText = NSMutableAttributedString(string: termsText)
        
        let colorAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 0, green: 0.52, blue: 1, alpha: 1)
        ]
        attributedText.addAttributes(colorAttributes, range: (termsText as NSString).range(of: "Terms of Service"))
        attributedText.addAttributes(colorAttributes, range: (termsText as NSString).range(of: "Privacy"))
        
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        
        return attributedText
    }
}
