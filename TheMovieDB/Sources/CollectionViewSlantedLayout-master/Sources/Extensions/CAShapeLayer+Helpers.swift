/**
 This file is part of the CollectionViewSlantedLayout package.

 Copyright © 2016-present Yassir Barchi <github@yassir.fr>

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import QuartzCore
import UIKit

/// :nodoc:
extension CAShapeLayer {

    /// :nodoc:
    convenience init(path cgpath: CGPath?) {
        self.init()
        path = cgpath
    }

    /// :nodoc:
    convenience init(pathPoints: [CGPoint]) {
        self.init()
        guard pathPoints.count > 2 else { return }

        let bezierPath = UIBezierPath()
        bezierPath.move(to: pathPoints[0])

        for idx in 1..<pathPoints.count {
            bezierPath.addLine(to: pathPoints[idx])
        }

        bezierPath.close()

        path = bezierPath.cgPath
    }

}
