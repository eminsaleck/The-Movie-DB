//
//  CustomFooterView.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

class CustomFooterView: UIView {

    static let recommendedFrame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = FontHelper.subheadLight
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Internal

    var message: String? {
        didSet {
            messageLabel.text = message
        }
    }

    // MARK: - Initializers

    init(message: String) {
        super.init(frame: CustomFooterView.recommendedFrame)
        setupUI()
        messageLabel.text = message
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Private

    private func setupUI() {
        addSubview(messageLabel)
        messageLabel.fillSuperview(padding: .init(top: 0, left: Constants.horizontalMargin,
                                                  bottom: 0, right: Constants.horizontalMargin))
    }

    // MARK: - Constants

    struct Constants {
        static let horizontalMargin: CGFloat = 8.0
    }

}
