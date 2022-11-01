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
    var coordinator: MainFlow!
    var viewModel: MainViewModel!
    
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
        print("MAIN")
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.rx.setDelegate(self).disposed(by: bag)
        bindCollectionView()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func bindCollectionView() {
        
        viewModel.fetchMoviesViewModels()
            .bind(to: collectionView.rx.items(cellIdentifier: FilmCell.reuseId, cellType: FilmCell.self)) { index, viewModel, cell in
                cell.configure(with: viewModel)
            }.disposed(by: bag)
        collectionView.rx.modelSelected(Film.self).subscribe { item in
            self.coordinator?.coordinateToDetails(with: item, navController: self.navigationController!)
            
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


