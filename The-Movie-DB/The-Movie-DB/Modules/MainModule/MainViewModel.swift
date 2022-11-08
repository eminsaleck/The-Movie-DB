//
//  MainViewModelV2.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//


import UIKit

class LibraryViewModel: CollectionViewModel<FilmCell> {

    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView, cellReuseIdentifier: FilmCell.reuseId)
    }

}

extension LibraryViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("didSelect")
    }
}
