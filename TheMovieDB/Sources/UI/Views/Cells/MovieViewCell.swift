//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//


import UIKit

public class MovieViewCell: UICollectionViewCell {
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        return imageView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        backgroundColor = .secondarySystemBackground
        constructHierarchy()
        activateConstraints()
    }
    
    private func constructHierarchy() {
        contentView.addSubview(posterImageView)
    }
    
    private func activateConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: activateConstraintsForPosterView())
        NSLayoutConstraint.activate(constraints)
    }
    
    private func activateConstraintsForPosterView() -> [NSLayoutConstraint] {
        return [
            posterImageView.topAnchor.constraint(equalTo: topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo:  bottomAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
    }
    
    // MARK: - Public
    public func setModel(viewModel: MovieCellViewModel) {
        posterImageView.loadImage(imagePath: viewModel.posterPathURL!)
    }
}
