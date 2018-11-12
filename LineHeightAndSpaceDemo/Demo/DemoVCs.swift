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
        let attributedText = NSMutableAttributedString(string: label.text ?? "")
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10 - (label.font.lineHeight - label.font.pointSize)
        
        let fullRange = attributedText.string.range(of: attributedText.string)!
        
        attributedText.addAttributes([
            NSAttributedString.Key.paragraphStyle: style
            ], range: NSRange(fullRange, in: attributedText.string))
        
        label.attributedText = attributedText
    }
}

class ChangeLineHeightVC: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLineHeight(to: 30)
    }
    
    func setLineHeight(to lineHeight: CGFloat) {
        let attributedText = NSMutableAttributedString(string: label.text ?? "")
        
        let style = NSMutableParagraphStyle()
        style.maximumLineHeight = lineHeight
        style.minimumLineHeight = lineHeight
        
        let adjustBaselineOffset = (lineHeight - label.font.lineHeight) / 4
        
        let fullRange = attributedText.string.range(of: attributedText.string)!
        
        attributedText.addAttributes([
            NSAttributedString.Key.paragraphStyle: style,
            NSAttributedString.Key.baselineOffset: adjustBaselineOffset
            ], range: NSRange(fullRange, in: attributedText.string))
        
        label.attributedText = attributedText
    }
}
