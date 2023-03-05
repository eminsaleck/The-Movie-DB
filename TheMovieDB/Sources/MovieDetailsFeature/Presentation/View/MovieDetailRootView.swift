//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 25.02.2023.
//

import UIKit
import Common
import UI

class MovieDetailRootView: UIView {
    private let viewModel: MovieDetailViewModelProtocol
    private let scrollView: UIScrollView = UIScrollView()
    private let backDropView = MovieDetailBackdropView()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titleContainerView,
            backDropView,
            episodeGuideContainerView,
            overViewContainer,
            votesViewContainer,
        ])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 10.0
        return stack
    }()
    
    private lazy var episodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "safa"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var numberEpisodesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "1123"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var rightSelectorView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private lazy var backDropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleContainerView: UIView = {
        let view = UIView()
        view.addSubview(titleStackView)
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.pin(to: view, insets: UIEdgeInsets(top: 8, left: 10, bottom: 0, right: 0) )
        return view
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, releaseContainerView, genreLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 4.0
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    private lazy var releaseContainerView: UIView = {
        let view = UIView()
        view.addSubview(releaseDate)
        view.addSubview(durationLabel)
        
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            releaseDate.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            releaseDate.trailingAnchor.constraint(equalTo: durationLabel.leadingAnchor, constant: -40),
            releaseDate.topAnchor.constraint(equalTo: view.topAnchor),
            releaseDate.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: view.topAnchor),
            durationLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        return view
    }()
    
    private lazy var releaseDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "1997 - 2002"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "23 min"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Drama"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    // MARK: - Episode Guide
    private lazy var episodeGuideContainerView: UIView = {
        let view = UIView()
        view.addSubview(episodeLabel)
        view.addSubview(numberEpisodesLabel)
        view.addSubview(rightSelectorView)
        
        episodeLabel.translatesAutoresizingMaskIntoConstraints = false
        numberEpisodesLabel.translatesAutoresizingMaskIntoConstraints = false
        rightSelectorView.translatesAutoresizingMaskIntoConstraints = false
        
        episodeLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        episodeLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        episodeLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        numberEpisodesLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        numberEpisodesLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        numberEpisodesLabel.numberOfLines = 1
        
        NSLayoutConstraint.activate([
            episodeLabel.topAnchor.constraint(equalTo: view.topAnchor),
            episodeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            episodeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            episodeLabel.trailingAnchor.constraint(equalTo: numberEpisodesLabel.leadingAnchor, constant: -8),
            
            numberEpisodesLabel.topAnchor.constraint(equalTo: view.topAnchor),
            numberEpisodesLabel.trailingAnchor.constraint(equalTo: rightSelectorView.leadingAnchor, constant: -8),
            
            rightSelectorView.centerYAnchor.constraint(equalTo: numberEpisodesLabel.centerYAnchor),
            rightSelectorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            rightSelectorView.widthAnchor.constraint(equalToConstant: 22),
            rightSelectorView.heightAnchor.constraint(equalToConstant: 22)
        ])
        return view
    }()
    
    
    private lazy var overViewContainer: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(posterImageView)
        view.addSubview(overViewText)
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            posterImageView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 0),
            posterImageView.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: 0),
            posterImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            posterImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        overViewText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overViewText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            overViewText.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 0),
            overViewText.widthAnchor.constraint(equalToConstant: 300),
            overViewText.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: 0),
            overViewText.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return view
    }()
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.opacity = 0
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var overViewText: UITextView = {
        let overViewText = UITextView()
        overViewText.textAlignment = NSTextAlignment.justified
        overViewText.isSelectable = true
        overViewText.isEditable = false
        overViewText.font = .systemFont(ofSize: 15)
        overViewText.backgroundColor = .secondarySystemBackground
        overViewText.adjustsFontForContentSizeCategory = true
        return overViewText
    }()
    
    // MARK: - Votes Container
    private lazy var votesViewContainer: UIView = {
        let view = UIView()
        view.addSubview(voteContainerStackView)
        voteContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteContainerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            voteContainerStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            voteContainerStackView.topAnchor.constraint(equalTo: view.topAnchor),
            voteContainerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    private lazy var voteContainerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [starImageView, voteMaxStackView, countVoteLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 2
        return stack
    }()
    
    private lazy var starImageView: UIImageView = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)
        let starFill = UIImage(systemName: "star.fill", withConfiguration: largeConfig)
        let imageView = UIImageView(image: starFill)
        imageView.tintColor = .systemYellow
        imageView.contentMode = .scaleToFill
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        return imageView
    }()
    
    private lazy var voteMaxStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [scoreLabel, maxScoreLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 0
        return stack
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "7.8/"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    private lazy var maxScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "10"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    private lazy var countVoteLabel: UILabel = {
        let label = UILabel()
        label.text = "3054"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    init(frame: CGRect = .zero, viewModel: MovieDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPoster(_ imageView: UIImageView) {
        imageView.layer.cornerRadius = 20
    }
    
    func setupView(with movie: MovieDetailInfoModel) {
        nameLabel.text = movie.name
        releaseDate.text = movie.releaseDate
        genreLabel.text = movie.genre
        overViewText.text = movie.overView
        scoreLabel.text = movie.score
        countVoteLabel.text = movie.countVote
        maxScoreLabel.text = movie.maxScore
        backDropImageView.loadImage(imagePath:movie.backDropPath!)
        posterImageView.loadImage(imagePath: movie.posterPath!)
        setupPoster(posterImageView)
        animateBackDrop()
    }
    
    // MARK: - Private
    private func setupUI() {
        backgroundColor = .secondarySystemBackground
        constructHierarchy()
        activateConstraints()
        setupGestures()
        animateOverviewContainer()
    }
    
    func animateOverviewContainer() {
        UIView.animate(withDuration: 1) { [weak self] in
            self?.posterImageView.transform = CGAffineTransform(translationX: 0, y: -250)
            self?.overViewText.transform = CGAffineTransform(translationX: -40, y: 0)
            self?.votesViewContainer.transform = CGAffineTransform(translationX: 75, y: 0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backDropView.addSubview(backDropImageView)
        backDropImageView.frame = backDropView.bounds
    }
    
    private func animateBackDrop() {
        UIView.animate(withDuration: 2.0) { [weak self] in
            self?.posterImageView.layer.opacity = 1.0  }
    }
    
    private func constructHierarchy() {
        backDropImageView.frame = backDropView.bounds
        backDropView.addSubview(backDropImageView)
        
        scrollView.addSubview(mainStackView)
        addSubview(scrollView)
    }
    
    private func activateConstraints() {
        activateConstraintsScrollView()
        activateConstraintsMainStackView()
        activateConstraintsForSubViews()
    }
    
    private func activateConstraintsForSubViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backDropView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            overViewContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
        ])
    }
    
    private func activateConstraintsScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func activateConstraintsMainStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    
    // MARK: - Gestures
    private func setupGestures() {
        episodeGuideContainerView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleEpisodesGesture))
        episodeGuideContainerView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleEpisodesGesture(_ sender: UITapGestureRecognizer) {
        viewModel.navigateToSeasons()
    }
}
