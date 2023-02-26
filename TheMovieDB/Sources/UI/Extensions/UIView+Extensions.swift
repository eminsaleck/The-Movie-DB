//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.02.2023.
//

import UIKit

extension UIView {

  public func pin(to view: UIView, insets: UIEdgeInsets = .zero) {
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
      bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
      leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
      trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right)
    ])
  }
}

public class MovieDetailBackdropView: UIView {

    public override func draw(_ rect: CGRect) {
        let layerHeight = layer.frame.height
        let layerWidth = layer.frame.width
        let path = UIBezierPath()

        let points: [CGPoint] = [
            CGPoint(x: 0, y: 0),
            CGPoint(x: layerWidth, y: layerHeight * 0.8),
            CGPoint(x: layerWidth, y: layerHeight),
            CGPoint(x: 0, y: layerHeight)
        ]

        path.move(to: convert(points[0], to: self))
        for point in points.dropFirst() {
            path.addLine(to: convert(point, to: self))
        }
        path.close()

        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.layer.opacity = 0
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
        
        UIView.animate(withDuration: 0.8) {
            blurEffectView.layer.opacity = 0.8
        }
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        blurEffectView.layer.mask = maskLayer
    }
}
