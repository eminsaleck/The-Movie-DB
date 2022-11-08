//
//  MainViewModelV2.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//


import UIKit

class MainViewModel: CollectionViewModel<FilmCell> {
    private var coordinator:  MainFlow!
    public var viewModelNetwork: MainNetworkViewModelProtocol!
    

    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView, cellReuseIdentifier: FilmCell.reuseId)
    }

}

extension MainViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("didSelect")
    }
}

