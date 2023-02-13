//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import Foundation
import Combine

protocol SearchPopularViewModelDelegate: AnyObject {
  func searchPopularViewModel(_ searchPopularViewModel: SearchPopularViewModel,
                              popularMoviePicked id: Int,
                              title: String?)
}

protocol SearchPopularViewModelProtocol{
  // MARK: - Input
  func viewDidLoad()
  func modelIsPicked(with item: SearchSectionItem)

  // MARK: - Output
  var viewState: CurrentValueSubject<PopularViewState, Never> { get }
  var dataSource: CurrentValueSubject<[SearchPopularSectionModel], Never> { get }
}
