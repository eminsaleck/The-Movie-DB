//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation

struct SectionHeaderViewModel: Hashable {
    let title: String

    init(title: String, showSeeAllButton: Bool) {
        self.title = title
    }
}
