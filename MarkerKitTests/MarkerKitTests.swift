//
//  MarkerKitTests.swift
//  MarkerKitTests
//
//  Created by Mikhail Pchelnikov on 27/12/2017.
//  Copyright © 2017 Michael Pchelnikov. All rights reserved.
//

import UIKit
import XCTest
@testable import MarkerKit

class MarkerKitTests: XCTestCase {
    
    fileprivate var containerView = UIView()
    
    //MARK: setUp/tearDown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: tests
    func testMakeConstraints() {
        let v1 = UIView()
        let v2 = UIView()
        
        self.containerView.addSubview(v1)
        self.containerView.addSubview(v2)
        
        v1.mrk.top(to: v2, attribute: .top, relation: .equal, constant: 50)
        v1.mrk.left(to: v2, attribute: .top, relation: .equal, constant: 50)
        
        XCTAssertEqual(self.containerView.constraints.count, 2, "Should have 2 constraints installed")
        
        v2.mrk.fillSuperview()
        
        XCTAssertEqual(self.containerView.constraints.count, 10, "Should have 10 constraints installed")
    }
}
