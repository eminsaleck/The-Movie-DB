//
//  MainViewModelV2.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//


import UIKit

class MainViewModel: CollectionViewModel<FilmCell> {
    public var viewModelNetwork: MainNetworkViewModelProtocol!
    var coordinator:  MainFlow!
    var navigationController:  UINavigationController?

    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView, cellReuseIdentifier: FilmCell.reuseId)
   
    }

}

extension MainViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let film = items.value[indexPath.item]
        print(film)
        coordinator.coordinateToDetails(with: film, navigationController: navigationController!)
    }
}

