//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.02.2023.
//

import UIKit

public class LineView: UICollectionReusableView {
    
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    public var lineColor: UIColor = .black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var lineWidth: CGFloat = 1.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        blurView.frame = bounds
        blurView.alpha = 1.0
    }
    
    override public func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.midY - lineWidth/2))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.midY - lineWidth/2))
        path.lineWidth = lineWidth
        lineColor.setStroke()
        path.stroke()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(blurView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
