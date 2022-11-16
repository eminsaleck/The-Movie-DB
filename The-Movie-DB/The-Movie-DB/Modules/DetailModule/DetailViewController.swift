//
//  DetailViewController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import UIKit
import RxSwift
import RxCocoa


final class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModelProtocol?
    let bag = DisposeBag()

    
    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentInsetAdjustmentBehavior = .never
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .black
        return $0
    }(UIScrollView())
    
    private let imageContainer: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let detailsContentView: DetailsContentView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(DetailsContentView())
    
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        setupUI()
        bindData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.scrollIndicatorInsets = view.safeAreaInsets
        scrollView.contentInset = UIEdgeInsets(top: 0,
                                               left: 0,
                                               bottom: view.safeAreaInsets.bottom,
                                               right: 0)
    }
    
    private func bindData() {
        
        imageView.loadImage(imagePath: viewModel?.getImage() ?? "")
        detailsContentView.setContent(info: viewModel?.movie!)
//        
//        viewModel?.getTrailerKey().bind(onNext: { [weak self] key in
//            self?.detailsContentView.setTrailer(key: key.first!)
//        }).disposed(by: bag)
    }
    
    private func setupUI() {
        setupScrollView()
        setupImageContainerView()
        setupDetailsContentView()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = " "
        navigationController?.navigationBar.barTintColor = .clear
    }

}

//MARK: - Constraints
extension DetailViewController{
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageContainer)
        scrollView.addSubview(detailsContentView)
        scrollView.addSubview(imageView)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupDetailsContentView() {
        NSLayoutConstraint.activate([
            detailsContentView.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 1),
            detailsContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setupImageContainerView() {
        let gradientView = GradientView(frame: imageView.bounds)
        imageView.addSubview(gradientView)
        
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 400),
            imageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageContainer.heightAnchor.constraint(equalTo: imageContainer.widthAnchor, multiplier: 0.7),
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor)
        ])
        
        let topImageConstraint = imageView.topAnchor.constraint(equalTo: view.topAnchor)
        topImageConstraint.isActive = true
        topImageConstraint.priority = .defaultLow
        
        let heightImageConstraint = imageView.heightAnchor.constraint(greaterThanOrEqualTo: imageContainer.heightAnchor, constant: 330)
        heightImageConstraint.isActive = true
        heightImageConstraint.priority = .required
    }
}
