//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.02.2023.
//

import UIKit

public class ExploreLayout: UICollectionViewCompositionalLayout {
    
    public init() {
        super.init(section: Self.createSection())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static func createSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .fractionalHeight(1))
         let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
         layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 5, bottom: 0, trailing: 5)


         let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(170),
                                                      heightDimension: .estimated(180))
         let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])

         let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
         layoutSection.orthogonalScrollingBehavior = .continuous
         layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 12, bottom: 40, trailing: 12)

        let headerFooterSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .estimated(30)
        )

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: headerFooterSize,
          elementKind: "headers",
          alignment: .top
        )
        layoutSection.boundarySupplementaryItems = [sectionHeader]

         return layoutSection
    }
}
