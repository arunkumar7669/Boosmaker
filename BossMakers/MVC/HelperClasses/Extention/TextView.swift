//
//  TextView.swift
//  UserMandoopApp
//
//  Created by Ashutosh Mishra on 28/05/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import UIKit

class TextView: UITextView {
    // MARK: Properties
    
    open var didTouchedLink: ((URL, NSRange, CGPoint) -> Void)?
    
    var callBack: ((URL, NSRange, CGPoint) -> Void)?
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = Array(touches)[0]
        if let view = touch.view {
            let point = touch.location(in: view)
            self.tapped(on: point)
        }
    }
}

extension TextView {
    fileprivate func tapped(on point: CGPoint) {
        var location: CGPoint = point
        location.x -= self.textContainerInset.left
        location.y -= self.textContainerInset.top
        let charIndex = layoutManager.characterIndex(for: location, in: self.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        guard charIndex < self.textStorage.length else {
            return
        }
        var range = NSRange(location: 0, length: 0)
        if let attributedText = self.attributedText {
            if let link = attributedText.attribute(NSAttributedString.Key.link, at: charIndex, effectiveRange: &range) as? URL {
                //                print("\n\t##-->You just tapped on '\(link)' withRange = \(NSStringFromRange(range))\n")
                self.callBack?(link, range, location)
            }
        }
        
    }
}
