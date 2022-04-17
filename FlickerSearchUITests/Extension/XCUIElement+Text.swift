//
//  XCUIElement+Text.swift
//  FlickerSearchUITests
//
//  Created by Mahmoud Hamad on 17/04/2022.
//

import XCTest

extension XCUIElement {
    // The following is a workaround for inputting text in the
    // simulator when the keyboard is hidden
    func setText(text: String, application: XCUIApplication) {
        UIPasteboard.general.string = text
        doubleTap()
        application.menuItems["Paste"].tap()
    }
}
