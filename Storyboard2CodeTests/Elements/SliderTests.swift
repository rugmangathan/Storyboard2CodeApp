//  Created by dasdom on 08.05.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import XCTest
@testable import Storyboard2Code

class SliderTests: XCTestCase {
  
  var sut: Slider!
  
  override func setUp() {
    super.setUp()
    
    sut = Slider(dict: ["id": "L8L-a5-BCh", "userLabel": "fooSlider"])
  }
  
  override func tearDown() {
    sut = nil
    
    super.tearDown()
  }
  
  func test_sliderPropertyString_HasExpectedOutput() {
    
    let result = sut.propertyString()

    let expected = "let fooSlider: UISlider"
    XCTAssertEqual(result.trimmed, expected)
  }
  
  func test_sliderInitString_HasExpectedOutput() {
    
    let result = sut.initString()

    let expected = "fooSlider = UISlider()"
    XCTAssertEqual(result.trimmed, expected)
  }
  
  func test_sliderSetupString_HasExpectedOutputFor_translatesAutoresizingMaskIntoConstraints() {
    let attr = ["translatesAutoresizingMaskIntoConstraints": "NO",
                          "id": "42",
                          "userLabel": "fooSlider"]
    let sut = Slider(dict: attr)
    
    let result = sut.setupString(objC: false)

    let expected = "fooSlider.translatesAutoresizingMaskIntoConstraints = false"
    XCTAssertEqual(result.trimmed, expected)
  }
  
  func test_sliderSetupString_HasExpectedOutputFor_value() {
    let attributesDict = ["value": "5",
                          "id": "42",
                          "userLabel": "fooSlider"]
    let sut = Slider(dict: attributesDict)
    
    let result = sut.setupString(objC: false)

    let expected = "fooSlider.value = 5.0"
    XCTAssertEqual(result.trimmed, expected)
  }
  
  func test_sliderSetupString_HasExpectedOutputFor_minValue() {
    let attributesDict = ["minValue": "-7",
                          "id": "42",
                          "userLabel": "fooSlider"]
    let sut = Slider(dict: attributesDict)
    
    let result = sut.setupString(objC: false)
    
    let expected = "fooSlider.minimumValue = -7.0"
    XCTAssertEqual(result.trimmed, expected)
  }
  
  func test_sliderSetupString_HasExpectedOutputFor_maxValue() {
    let attributesDict = ["maxValue": "33",
                          "id": "42",
                          "userLabel": "fooSlider"]
    let sut = Slider(dict: attributesDict)
    
    let result = sut.setupString(objC: false)
    
    let expected = "fooSlider.maximumValue = 33.0"
    XCTAssertEqual(result.trimmed, expected)
  }
  
  func test_sliderSetupString_HasExpectedOutputFor_continuous() {
    let attributesDict = ["continuous": "NO",
                          "id": "42",
                          "userLabel": "fooSlider"]
    let sut = Slider(dict: attributesDict)
    
    let result = sut.setupString(objC: false)
    
    let expected = "fooSlider.continuous = false"
    XCTAssertEqual(result.trimmed, expected)
  }
  
  func test_sliderSetupString_HasExpectedOutputFor_minimumTrackTintColor() {
    let color = Color(dict: ["key": "minimumTrackTintColor", "red": "0.0", "green": "0.50196081400000003", "blue": "0.0", "alpha": "1", "colorSpace": "custom", "customColorSpace": "sRGB"])
    sut.colors.append(color)
    
    let result = sut.setupString(objC: false)
    
    let expected = "fooSlider.minimumTrackTintColor = UIColor(red: 0.000, green: 0.502, blue: 0.000, alpha: 1.000)"
    XCTAssertEqual(result.trimmed, expected)
  }
  
  func test_sliderSetupString_HasExpectedOutputFor_maximumTrackTintColor() {
    let color = Color(dict: ["key": "maximumTrackTintColor", "red": "1", "green": "0.0", "blue": "0.0", "alpha": "1", "colorSpace": "custom", "customColorSpace": "sRGB"])
    sut.colors.append(color)
    
    let result = sut.setupString(objC: false)
    
    let expected = "fooSlider.maximumTrackTintColor = UIColor(red: 1.000, green: 0.000, blue: 0.000, alpha: 1.000)"
    XCTAssertEqual(result.trimmed, expected)
  }
  
  func test_sliderSetupString_HasExpectedOutputFor_thumbTintColor() {
    let color = Color(dict: ["key": "thumbTintColor", "red": "0.0", "green": "0.25098040700000002", "blue": "0.50196081400000003", "alpha": "1", "colorSpace": "custom", "customColorSpace": "sRGB"])
    sut.colors.append(color)
    
    let result = sut.setupString(objC: false)
    
    let expected = "fooSlider.thumbTintColor = UIColor(red: 0.000, green: 0.251, blue: 0.502, alpha: 1.000)"
    XCTAssertEqual(result.trimmed, expected)
  }
}

extension SliderTests {
  func test_sliderSetupString_HasNoOutputForDefaultValues() {
    let attributesDict = ["opaque": "NO",
                          "contentMode": "scaleToFill",
                          "contentHorizontalAlignment": "center",
                          "contentVerticalAlignment": "center",
                          "id": "42",
                          "userLabel": "fooSlider"]
    let sut = Slider(dict: attributesDict)
    
    let expectedOutput = ""
    XCTAssertEqual(sut.setupString(objC: false), expectedOutput)
  }
}
