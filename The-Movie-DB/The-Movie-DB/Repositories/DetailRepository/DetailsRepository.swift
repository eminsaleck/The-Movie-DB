//
//  DetailsRepository.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//
import Foundation

typealias DetailsVOHandler = ((DetailsVO) -> Void)?

protocol DetailsRepositoryProtocol {
  func getDetails(movieId: Int, handler: DetailsVOHandler)
}

final class DetailsRepository: DetailsRepositoryProtocol {
  
  let networkManager: NetworkManagerProtocol
  let imageManager: ImageManagerProtocol

  init(network: NetworkManagerProtocol,
       imageManager: ImageManagerProtocol) {
    self.networkManager = network
    self.imageManager = imageManager
  }
  
  func getDetails(movieId: Int, handler: DetailsVOHandler) {
    let endPoint = RequestItem.getDetailsMovie(movie_id: movieId)
    networkManager.sendDataRequest(endPoint: endPoint, response: DetailsData.self) { [weak self] (detailsData) in
      guard let self = self else { return }
      self.responseData(with: detailsData, handler: handler)
    }
  }
  
  fileprivate func responseData(with response: Result<DetailsData, Error>, handler: DetailsVOHandler) {
    switch response {
    case .success(let details):
      imageManager.fetchImageConfiguration(with: .secure, size: .w780, handler: .some {
        imagePath in
        let imageUrlPath = imagePath + details.backdrop_path
        let detailVO = DetailsVO(details: details, imageUrlPath: imageUrlPath)
        handler?(detailVO)
      })
    case .failure(let error):
      print(error)
    }
  }
}
