//
//
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class MainViewController: UIViewController, UICollectionViewDelegate {
     
    let bag = DisposeBag()
    var viewModel: MainViewModelProtocol!    
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: createCompositionalLayout())
        cv.register(FilmCell.self, forCellWithReuseIdentifier: FilmCell.reuseId)
        cv.backgroundColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        setupCollectionView()
        collectionView.rx.setDelegate(self).disposed(by: bag)
        bindCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
    }

}

extension MainViewController{
    
    private func bindCollectionView() {
        
        viewModel.fetchMoviesViewModels()
            .bind(to: collectionView.rx.items(cellIdentifier: FilmCell.reuseId, cellType: FilmCell.self)) { index, viewModel, cell in
                cell.configure(with: viewModel)
            }.disposed(by: bag)
        
        collectionView.rx.modelSelected(Film.self).subscribe { item in
            self.viewModel
                .coordinator
                .coordinateToDetails(with: item.element!,
                navigationController: self.navigationController!)
        }.disposed(by: bag)
    }
}

extension MainViewController{
    
    private func setupCollectionView(){
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
