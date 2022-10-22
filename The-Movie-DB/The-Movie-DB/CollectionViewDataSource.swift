
//
//  CollectionDataSource.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//
import UIKit

class CollectionDataSource: NSObject, UICollectionViewDataSource{

    
    var dataArray: [Film] = []
    var selectedItem: Film?
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.reuseId, for: indexPath) as! FilmCell
        cell.configure(with: dataArray[indexPath.item]) 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     //   selectedItem = dataArray[indexPath.item]
    }
}
