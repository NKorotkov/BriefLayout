//
//  BriefLayoutTests.swift
//  BriefLayoutTests
//
//  Created by KOROTKOV Nikolay on 04.03.2021.
//

import XCTest
@testable import BriefLayout

class BriefLayoutTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvinientAnchors() throws {
        let anyView = UIView()
        XCTAssertNotNil(anyView.top)
        XCTAssertNotNil(anyView.left)
        XCTAssertNotNil(anyView.right)
        XCTAssertNotNil(anyView.bottom)
        XCTAssertNotNil(anyView.centerX)
        XCTAssertNotNil(anyView.centerY)
        XCTAssertNotNil(anyView.width)
        XCTAssertNotNil(anyView.height)
    }
    
    func testConvinientMethodForAutolayout() throws {
        let anyView = UIView()
        let autolayoutView = anyView.forAutolayout()
        XCTAssertEqual(autolayoutView, anyView)
        XCTAssertTrue(autolayoutView.translatesAutoresizingMaskIntoConstraints == false)
    }
    
    func testConvinientMethodPlacedOn() throws {
        let anyView = UIView()
        let superview = UIView()
        let placedView = anyView.placedOn(superview)
        XCTAssertEqual(placedView, anyView)
        XCTAssertTrue(placedView.superview == superview)
    }
    
    func testConvinientMethodPinToCenter() throws {
        
        let superview = UIView()
        let anyView = UIView().placedOn(superview)
        anyView.pinToCenter(of: superview)
        
        XCTAssertTrue(superview.constraints.count == 2)
        
        let centerXConstraint = superview.constraints[0]
        XCTAssertTrue(centerXConstraint.isActive)
        XCTAssertTrue(centerXConstraint.firstItem as! UIView == anyView)
        XCTAssertTrue(centerXConstraint.secondItem as! UIView == superview)
        XCTAssertTrue(centerXConstraint.relation == .equal)
        XCTAssertTrue(centerXConstraint.firstAnchor == anyView.centerXAnchor)
        XCTAssertTrue(centerXConstraint.secondAnchor == superview.centerXAnchor)
        
        let centerYConstraint = superview.constraints[1]
        XCTAssertTrue(centerYConstraint.isActive)
        XCTAssertTrue(centerYConstraint.firstItem as! UIView == anyView)
        XCTAssertTrue(centerYConstraint.secondItem as! UIView == superview)
        XCTAssertTrue(centerYConstraint.relation == .equal)
        XCTAssertTrue(centerYConstraint.firstAnchor == anyView.centerYAnchor)
        XCTAssertTrue(centerYConstraint.secondAnchor == superview.centerYAnchor)
    }

    func testActivation() throws {
        let firstView = UIView()
        let anyConstraint = firstView.widthAnchor.constraint(equalToConstant: 0)
        XCTAssertTrue(anyConstraint.isActive == false)
        let activated = anyConstraint.activated()
        XCTAssertEqual(activated, anyConstraint)
        XCTAssertTrue(anyConstraint.isActive == true)
    }
    
    func testCoreFunctions() throws {
        let firstView = UIView()
//        let secondView = UIView()
        
        let widthConstraint = firstView.width => 1
        XCTAssertTrue(widthConstraint.isActive == true)
        XCTAssertTrue(widthConstraint.constant == 1)
        
        let superview = UIView()
        superview.addSubview(firstView)
        
        let heightConstraint = firstView.height => superview.height + 1
        XCTAssertTrue(heightConstraint.constant == 1)
        XCTAssertTrue(heightConstraint.isActive == true)
        XCTAssertTrue(heightConstraint.firstItem as! UIView == firstView)
        XCTAssertTrue(heightConstraint.secondItem as! UIView == superview)
        XCTAssertTrue(heightConstraint.relation == .equal)
        XCTAssertTrue(heightConstraint.firstAnchor == firstView.height)
        XCTAssertTrue(heightConstraint.secondAnchor == superview.height)
        
        let leftConstraint = firstView.left => superview.left - 1
        XCTAssertTrue(leftConstraint.constant == -1)
        XCTAssertTrue(leftConstraint.isActive == true)
        XCTAssertTrue(leftConstraint.firstItem as! UIView == firstView)
        XCTAssertTrue(leftConstraint.secondItem as! UIView == superview)
        XCTAssertTrue(leftConstraint.relation == .equal)
        XCTAssertTrue(leftConstraint.firstAnchor == firstView.left)
        XCTAssertTrue(leftConstraint.secondAnchor == superview.left)
    }
}
