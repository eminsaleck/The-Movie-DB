//
//  CollectionViewDataSource.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 21.10.2022.
//

//
//  CollectionDataSource.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//
import UIKit

class CollectionDataSource: NSObject, UICollectionViewDataSource{

    var films: [Film] = []  // Realm
    var dataArray: [Film] = []
//    var items: [Displayable] = [] //dataArr
//    var selectedItem: Displayable?
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.reuseId, for: indexPath) as! FilmCell
        cell.configure(with: films[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return films.count
    }

    func fromRealmToArray(){
        
    }
}
