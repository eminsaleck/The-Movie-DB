//
//  MainViewModelV2.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//


import UIKit

final class MainViewModel: CollectionViewModel<FilmCell> {
    public var viewModelNetwork: MainNetworkViewModelProtocol!
    var coordinator:  MainFlow!
    var navigationController:  UINavigationController?
     var dataManager:  DataManagerProtocol!

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


extension MainViewModel{
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        configureContextMenu(index: indexPath.row)
    }
    func configureContextMenu(index: Int) -> UIContextMenuConfiguration{
        let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (action) -> UIMenu? in
            
            let edit = UIAction(title: "Like", image: UIImage(systemName: "heart"), identifier: nil, discoverabilityTitle: nil, state: .off) {  _ in
                self.dataManager.save(self.items.value[index])
            }
            
            let delete = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
                print("Share button clicked")
                //add tasks...
            }
            return UIMenu(title: "Option:", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [edit,delete])
        }
        return context
    }
    
}
