//
//  XCUIElement+Size.swift
//  FlickerSearchUITests
//
//  Created by Mahmoud Hamads on 17/04/2022.
//

import XCTest

extension XCUIElement {
    func largerThan(_ width: CGFloat, _ height: CGFloat) -> Bool {
        return self.frame.width > width && self.frame.height > height
    }
    
    func largerThan(_ size: CGFloat) -> Bool {
        return self.frame.width > size && self.frame.height > size
    }
    
    func smallerThan(_ width: CGFloat, _ height: CGFloat) -> Bool {
        return self.frame.width < width && self.frame.height < height
    }
    
    func smallerThan(_ size: CGFloat) -> Bool {
        return self.frame.width < size && self.frame.height < size
    }
}

