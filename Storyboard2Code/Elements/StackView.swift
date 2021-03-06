//  Created by dasdom on 25.10.18.
//  Copyright © 2018 dasdom. All rights reserved.
//

import Foundation

final class StackView : View {
  var axis: String?
  var spacing: String?
  var distribution: String?
  var distributionDefault = "fill"
  var alignment: String?
  var alignmentDefault = "fill"

  var arrangedSubviews: [View] = []
  
  required init(dict: [String : String]) {
    
    axis = dict["axis"]
    spacing = dict["spacing"]
    distribution = dict["distribution"]
    alignment = dict["alignment"]
    
    super.init(dict: dict)

    type = ElementType.UIStackView
  }
  
  override func reflectable() -> [String] {
    var temp = super.reflectable()
    temp.append("axis")
    temp.append("spacing")
    if distribution != distributionDefault {
      temp.append("distribution")
    }
//    if alignment != alignmentDefault {
      temp.append("alignment")
//    }
    
    /// From the docs: "The opaque property has no effect in system-provided classes such as UIButton, UILabel, UITableViewCell, and so on."
    temp = temp.filter { $0 != "isOpaque" }
    
    return temp
  }
  
  override func configureForObjC() {
    super.configureForObjC()
    if let axis = axis {
      self.axis = "UILayoutConstraintAxis\(axis.capitalizeFirst)"
    }
    if let distribution = distribution {
      self.distribution = "UIStackViewDistribution\(distribution.capitalizeFirst)"
    }
    if let alignment = alignment {
      self.alignment = "UIStackViewAlignment\(alignment.capitalizeFirst)"
    }
  }
  
  func addArrangedSubviews(objC: Bool = false) -> String {
    let lines = arrangedSubviews.map({ (view) -> String in
      if objC {
        return "    [_\(userLabel) addArrangedSubview:_\(view.userLabel)];"
      } else {
        return "    \(userLabel).addArrangedSubview(\(view.userLabel))"
      }
    })
    return lines.joined(separator: "\n")
  }
}

