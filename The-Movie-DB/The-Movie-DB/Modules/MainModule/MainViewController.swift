//
//  MainViewControllerV2.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    
    static let sectionHeaderElementKind = "section-header-element-kind"
    
    
    private let viewForSwitch: SegmentedView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(SegmentedView())
    
    lazy var collectionView: UICollectionView =  {
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
    private var tokens = [AnyCancellable]()
    
    private lazy var viewModel = LibraryViewModel(collectionView: collectionView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = viewModel.makeDataSource()
        collectionView.delegate = viewModel
        setupCollectionView()
        viewForSwitch.delegate = self
        
        getDataForEverySection()
    }
    
    func getDataForEverySection(){
        for genre in Genre.allCases{
            NetworkManager().fetchMovieListByGenre(genre: genre.id) { [weak self] result in
                switch result{
                case .success(let items):
                    print(items)
                    self?.viewModel.addItems(items: items.reversed(), to: genre)
                case .failure(_):
                    print(result)
                }
            }
        }
    }
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        guard let nav = segue.destination as? UINavigationController, let dest = nav.viewControllers.first as? NewNoteViewController else { fatalError() }
    //
    //        dest.notePublisher.sink { [unowned self] note in
    //            viewModel.addItems(items: <#T##[Item]#>, to: <#T##Genre#>)
    //        }
    //        .store(in: &tokens)
    //    }
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

extension MainViewController{
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            return self.createSection()
        }
        return layout
    }
    
    private func createSection() -> NSCollectionLayoutSection {
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
            heightDimension: .estimated(20)
        )
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: MainViewController.sectionHeaderElementKind,
            alignment: .top
        )
        layoutSection.boundarySupplementaryItems = [sectionHeader]
        
        return layoutSection
    }
}

extension MainViewController: SegmentedViewPressed{
    
    func pressed(_ value: Int) {
        print("Selected Segment Index is : \(value)")
        collectionView.reloadData()
    }
}
