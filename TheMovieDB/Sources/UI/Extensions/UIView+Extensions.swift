//
//  UIView+Extensions.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

public extension UIView {

    /**
     * Frame of the view relative to another view.
     */
    public func absoluteFrame(relativeTo view: UIView?) -> CGRect? {
        return convert(bounds, to: view)
    }

    /**
     * Show a single shadow around the border of the view.
     */
    public func setShadowBorder(shadowColor: CGColor = UIColor.black.cgColor, shadowRadious: CGFloat = 5) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = shadowRadious
        self.layer.shadowOpacity = 0.5
    }

    public func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        guard duration != .zero else {
            self.layer.removeAllAnimations()
            self.transform = CGAffineTransform(rotationAngle: toValue)
            return
        }
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }

    /**
     * Fade in animation.
     */
    public func fadeIn(_ duration: TimeInterval, to alpha: CGFloat = 1.0) {
      UIView.animate(withDuration: duration, animations: {
        self.alpha = alpha
      })
    }

    /**
     * Fade out animation.
     */
    public func fadeOut(_ duration: TimeInterval) {
      UIView.animate(withDuration: duration, animations: {
        self.alpha = 0.0
      })
    }

    // MARK: - Overlay

    public func addOverlay(with backgroundColor: UIColor = .black, and alpha: CGFloat = 0.35) {
        let overlayView = UIView()
        overlayView.backgroundColor = backgroundColor
        overlayView.alpha = alpha
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(overlayView)
        overlayView.fillSuperview()
    }

}
