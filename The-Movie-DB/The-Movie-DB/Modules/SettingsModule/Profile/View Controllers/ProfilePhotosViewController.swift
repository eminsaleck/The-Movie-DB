//
//  ProfilePhotosViewController.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/2/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class ProfilePhotosViewController: UIViewController {

    private let numberOfColumns = 3
    private let cellOffset: CGFloat = 4.0
    private let viewModel: ProfilePhotosViewModel
    
    var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    init(viewModel: ProfilePhotosViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        collectionView.contentInset = UIEdgeInsets(top: 44.0, left: cellOffset, bottom: cellOffset, right: cellOffset)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoGridCell.self, forCellWithReuseIdentifier: PhotoGridCell.reuseIdentifier)
        collectionView.backgroundColor = .white
    }
}

extension ProfilePhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoGridCell.reuseIdentifier, for: indexPath) as! PhotoGridCell
        cell.configure(with: viewModel.photo(at: indexPath.item), session: URLSession.shared)
        return cell
    }
    
    
}

extension ProfilePhotosViewController: UICollectionViewDelegate {
    
}

extension ProfilePhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width - CGFloat(numberOfColumns + 1) * cellOffset) / CGFloat(numberOfColumns)
        return CGSize(width: cellWidth, height: cellWidth)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellOffset
    }
}
