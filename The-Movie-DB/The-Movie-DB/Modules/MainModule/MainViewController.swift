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
    
    private lazy var viewModel = MainViewModel(collectionView: collectionView)
    public var viewModelNetwork: MainNetworkViewModelProtocol!

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
        
        for genre in Genre.allCases{
            getDataForEverySection(genre)
        }
  
    }
    func getDataForEverySection(_ genre: Genre){
        viewModelNetwork.fetchMoviesViewModels(genre: genre) { [weak self] film in
            self?.viewModel.addItems(items: film, to: genre)
        }
    }
}

extension MainViewController: SegmentedViewPressed{
    
    func pressed(_ value: Int) {
        print("Selected Segment Index is : \(value)")
        collectionView.reloadData()
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
