//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//


import UIKit

public class LoadingView: UIView {

  public static var defaultView: LoadingView = {
    let recommendedFrame: CGRect = CGRect(x: 0, y: 0,
                                          width: UIScreen.main.bounds.width,
                                          height: 100)
    let defaultLoadingView = LoadingView(frame: recommendedFrame)
    return defaultLoadingView
  }()

  private let activityIndicator = UIActivityIndicatorView(style: .medium)

  // MARK: - Initializers

  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }

  public override func layoutSubviews() {
    super.layoutSubviews()
  }

  private func setupView() {
    backgroundColor = .systemBackground
    activityIndicator.color = .darkGray

    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    addSubview(activityIndicator)

    activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    activityIndicator.startAnimating()
  }
}
