//
//
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class MainController: UIViewController, UICollectionViewDelegate {
    
    var didSendEventClosure: ((MainController.Event) -> Void)?
    
    let bag = DisposeBag()
//    var coordinator: MainFlow!
    var viewModel: MainViewModel!
    
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: createCompositionalLayout())
        cv.register(FilmCell.self, forCellWithReuseIdentifier: FilmCell.reuseId)
        cv.backgroundColor =  #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return cv
    }()
    
    override func loadView() {
        super.loadView()
//        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        collectionView.rx.setDelegate(self).disposed(by: bag)
        bindCollectionView()
    }
    deinit {
        print("GoViewController deinit")
    }
    
    private func bindCollectionView() {
        
        viewModel.fetchMoviesViewModels()
            .bind(to: collectionView.rx.items(cellIdentifier: FilmCell.reuseId, cellType: FilmCell.self)) { index, viewModel, cell in
                cell.configure(with: viewModel)
            }.disposed(by: bag)
        collectionView.rx.modelSelected(Film.self).subscribe { item in
//            self.coordinrator?.coordinateToDetails(with: item, navController: self.navigationController!)
            
        }.disposed(by: bag)
    }
    
    func setupCollectionView(){
         view.backgroundColor = .white
         view.addSubview(collectionView)
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
             collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
             collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
             collectionView.topAnchor.constraint(equalTo: view.topAnchor),
             collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
         
    }
    
}
extension MainController {
    enum Event {
        case main
    }
}

// MARK: - Pagination
//extension MainController: UIScrollViewDelegate{
//    func scrollViewDidScroll( _ scrollView: UIScrollView) {
//        let position = scrollView.contentOffset.y
//        if position > (collectionView.contentSize.height-100-scrollView.frame.size.height){
//            guard NetworkManager.shared.isPageRefreshing == false else {return}
//            viewModel.fetchMoviesViewModels(pagination: true)
//                .bind(to: collectionView.rx.items(cellIdentifier: FilmCell.reuseId, cellType: FilmCell.self)) { index, viewModel, cell in
//                    cell.configure(with: viewModel)
//                }.disposed(by: bag)
//        }
//    }
//
//}


