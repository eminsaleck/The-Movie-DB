//
//  MovieDetailBackdropView.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit

@IBDesignable
class MovieDetailBackdropView: UIView {

    override func draw(_ rect: CGRect) {
        let layerHeight = layer.frame.height
        let layerWidth = layer.frame.width
        let path = UIBezierPath()

        let points: [CGPoint] = [
            .zero,
            CGPoint(x: layerWidth, y: 0),
            CGPoint(x: layerWidth, y: layerHeight),
            CGPoint(x: 0, y: layerHeight * 0.7)
        ]

        path.move(to: convert(points[0], to: self))
        for point in points.dropFirst() {
            path.addLine(to: convert(point, to: self))
        }
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }

}
