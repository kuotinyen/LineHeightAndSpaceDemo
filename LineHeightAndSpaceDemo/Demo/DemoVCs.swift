//
//  OriginalLineSpaceDemoVC.swift
//  LineHeightAndSpaceDemo
//
//  Created by TING YEN KUO on 2018/11/12.
//  Copyright © 2018 William Kuo. All rights reserved.
//

import UIKit

class OriginalLineSpaceVC: ViewController {}

class ChangeLineSpaceVC: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLineSpace(to: 10)
    }
    
    func setLineSpace(to lineSpace: CGFloat) {
        guard let string = label.text else { return }
        label.attributedText = NSMutableAttributedString(string: string).setLineSpacing(20, font: label.font)
    }
}

class ChangeLineHeightVC: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLineHeight(to: 30)
    }
    
    func setLineHeight(to lineHeight: CGFloat) {
        guard let string = label.text else { return }
        label.attributedText = NSMutableAttributedString(string: string).setLineHeight(60, font: label.font)
    }
}

extension NSMutableParagraphStyle {
    
    @discardableResult
    func lineSpacing(_ lineSpacing: CGFloat, font: UIFont) -> Self {
        self.lineSpacing = lineSpacing - (font.lineHeight - font.pointSize)
        
        return self
    }
    
    @discardableResult
    func lineHeight(_ lineHeight: CGFloat, font: UIFont) -> Self {
        self.maximumLineHeight = lineHeight
        self.minimumLineHeight = lineHeight
        
        return self
    }
}

extension NSMutableAttributedString {
    
    @discardableResult
    func setLineSpacing(_ lineSpace: CGFloat, font: UIFont) -> Self {
        let lineSpacingStyle = NSMutableParagraphStyle().lineSpacing(lineSpace, font: font)
        
        let fullRange = self.string.range(of: self.string)!
        self.addAttribute(NSAttributedString.Key.paragraphStyle, value: lineSpacingStyle, range: NSRange(fullRange, in: self.string))
        
        return self
    }
    
    @discardableResult
    func setLineHeight(_ lineHeight: CGFloat, font: UIFont) -> Self {
        let lineSpacingStyle = NSMutableParagraphStyle().lineHeight(lineHeight, font: font)
        
        let adjustBaselineOffset = (lineHeight - font.lineHeight) / 4
        
        let fullRange = self.string.range(of: self.string)!
        self.addAttribute(NSAttributedString.Key.paragraphStyle, value: lineSpacingStyle, range: NSRange(fullRange, in: self.string))
        self.addAttribute(NSAttributedString.Key.baselineOffset, value: adjustBaselineOffset, range: NSRange(fullRange, in: self.string))
        
        return self
    }
}
