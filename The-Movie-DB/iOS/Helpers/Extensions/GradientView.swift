//
//  File.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 04.11.2022.
//

import Foundation
import UIKit

final class GradientView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  fileprivate func setupView() {
    autoresizingMask = [.flexibleWidth, .flexibleHeight]
    guard let theLayer = self.layer as? CAGradientLayer else {
      return;
    }
    
    theLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
    theLayer.locations = [0.0, 1.0]
    theLayer.frame = self.bounds
  }
  
  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
}
