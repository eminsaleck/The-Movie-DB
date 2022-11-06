//
//
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import UIKit
import RxCocoa
import RxSwift

final class MainViewController: UIViewController {
    
    
    static let sectionHeaderElementKind = "section-header-element-kind"
    
    
    var viewModel: MainViewModelProtocol!
    
    
    var dataSource: UICollectionViewDiffableDataSource<Genre, Film>! = nil
    
    private let viewForSwitch: SegmentedView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(SegmentedView())
    
    lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: createCompositionalLayout())
        collectionView.register(FilmCell.self, forCellWithReuseIdentifier: FilmCell.reuseId)
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: MainViewController.sectionHeaderElementKind,
            withReuseIdentifier: HeaderView.reuseIdentifier)
        collectionView.backgroundColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        viewForSwitch.delegate = self
        
        title = "Main"
        setupCollectionView()
        configureDataSource()
        for genre in Genre.allCases{
            NetworkManager().fetchMovieListByGenre(genre: genre.id) { [weak self] result in
                result.map { filmsArray in
                    self?.addItems(items: filmsArray, to: genre)
                }
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureDataSource(){
        
        dataSource = UICollectionViewDiffableDataSource<Genre, Film>(collectionView: collectionView) { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.reuseId, for: indexPath) as! FilmCell
            cell.configure(with: item)
            return cell
        }
        
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderView.reuseIdentifier,
                for: indexPath) as! HeaderView
            var name = String(describing: Genre.allCases[indexPath.section]).capitalized
            sectionHeader.label.text = name
                 return sectionHeader
             }
        let snapshot = dataSource.snapshot()
        dataSource.apply(snapshot, animatingDifferences: false)
    }

}

extension MainViewController: UICollectionViewDelegate{
    
    func addItems(items: [Film], to section: Genre) {
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
}

extension MainViewController{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = dataSource.itemIdentifier(for: indexPath) else { return }
        viewModel.coordinator.coordinateToDetails(with: model, navigationController: navigationController!)
    }
}

extension MainViewController{
    
    private func setupCollectionView(){
        view.backgroundColor = .black
        view.addSubview(collectionView)
        view.addSubview(viewForSwitch)

        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            viewForSwitch.topAnchor.constraint(equalTo: view.topAnchor),
            viewForSwitch.rightAnchor.constraint(equalTo: view.rightAnchor),
            viewForSwitch.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewForSwitch.bottomAnchor.constraint(equalTo: collectionView.topAnchor)
        ])
    }
}

extension MainViewController: SegmentedViewPressed{
    func pressed(_ value: Int) {
        print("Selected Segment Index is : \(value)")
        collectionView.reloadData()
    }
}
