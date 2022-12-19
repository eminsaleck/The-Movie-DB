//
//  Displayable.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

protocol Displayable: UIView {

    var isPresented: Bool { get set }

    func show(in view: UIView, animated: Bool, completion: ((Bool) -> Void)?)
    func hide(animated: Bool, completion: ((Bool) -> Void)?)

}

extension Displayable {

    func show(in view: UIView, animated: Bool, completion: ((Bool) -> Void)?) {
        guard !isPresented else {
            completion?(true)
            return
        }
        isPresented = true

        view.addSubview(self)
        fillSuperview()

        let animationDuration = animated ? 0.3 : 0.0
        alpha = 0
        UIView.animate(withDuration: animationDuration, animations: {
            self.alpha = 1
        }, completion: completion)
    }

    func hide(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard isPresented else {
            completion?(true)
            return
        }
        isPresented = false

        let animationDuration = animated ? 0.3 : 0.0
        UIView.animate(withDuration: animationDuration, animations: {
            self.alpha = 0
        }, completion: { finished in
            if finished { self.removeFromSuperview() }
            completion?(finished)
        })
    }

}
