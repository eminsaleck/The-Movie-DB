//
//  MovieCreditsDataSource.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import UI

class MovieCreditsDataSource: NSObject, UICollectionViewDataSource, CollapsibleHeaderViewDelegate {

    private let viewModel: MovieCreditsViewModelProtocol
    private var isAnimationEnabled = false

    // MARK: - Initializers

    init(viewModel: MovieCreditsViewModelProtocol) {
        self.viewModel = viewModel
    }

    // MARK: - UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(for: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: MovieCreditCell.self, for: indexPath)
        cell.viewModel = viewModel.creditModel(for: indexPath.section, and: indexPath.row)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: "CollapsibleCollectionHeaderView",
                                                                     for: indexPath) as! CollapsibleCollectionHeaderView
        header.viewModel = viewModel.headerModel(for: indexPath.section)
        header.delegate = self
        header.updateArrowImageView(animated: isAnimationEnabled)
        if isAnimationEnabled { isAnimationEnabled.toggle() }
        return header
    }

    // MARK: - CollapsibleHeaderViewDelegate

    func collapsibleHeaderView(sectionHeaderView: CollapsibleCollectionHeaderView, sectionToggled section: Int) {
        isAnimationEnabled = true
        viewModel.toggleSection(section)
    }

}
