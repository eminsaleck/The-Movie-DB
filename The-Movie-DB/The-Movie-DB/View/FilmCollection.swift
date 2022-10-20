//
//  CollectionView.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import Foundation
import UIKit


class FilmCollection: UIView{

    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(FilmCell.self, forCellWithReuseIdentifier: FilmCell.reuseId)
        cv.backgroundColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
       
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor)

    }
    func reloadData(){
        collectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
