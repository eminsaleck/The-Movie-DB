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
    
    let bag = DisposeBag()
    var coordinator: MainFlow?
    var viewModel: MovieListViewModel!
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: createCompositionalLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(FilmCell.self, forCellWithReuseIdentifier: FilmCell.reuseId)
        cv.backgroundColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return cv
    }()
    
    override func loadView() {
        super.loadView()
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchIntoCollectionView()
        selectedItem()
    }
    
    func fetchIntoCollectionView(){
        viewModel.fetchMoviesViewModels()
            .bind(to: collectionView.rx.items(cellIdentifier: FilmCell.reuseId, cellType: FilmCell.self)) { index, viewModel, cell in
                cell.configure(with: viewModel)
            }.disposed(by: bag)
    }
    func selectedItem(){
        collectionView.rx.modelSelected(Film.self).subscribe { item in
            print(item)
        }.disposed(by: bag)
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


