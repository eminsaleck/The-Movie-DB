//
//  CollectionDataSource.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import UIKit

class CollectionDataSource: NSObject, UICollectionViewDataSource{

    var films: [Film] = [] 
    var items: [Displayable] = [] //from Realm to Items -> reloadData()
    var selectedItem: Displayable?
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.reuseId, for: indexPath)
       
        cell.backgroundColor = .black
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return films.count
    }

    
}

