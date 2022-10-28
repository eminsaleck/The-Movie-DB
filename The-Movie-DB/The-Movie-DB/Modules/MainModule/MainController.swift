//
//
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import UIKit
import RxSwift

final class MainController: UIViewController, UICollectionViewDelegate {
    
    let bag = DisposeBag()
    var coordinator: MainFlow?
    private var dataSource =  CollectionDataSource()
    private var dataManager = DataManager()
    
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
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        fetchData()
//        
//        let service = NetworkManager()
//        service.fetchMovies().subscribe { film in
//            print(film)
//        }.disposed(by: bag)

    }
}
// MARK:  - Network
extension MainController{
    private func fetchData(){
        NetworkManager.shared.fetchFilms{ [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let filmArray):
                for film in filmArray{
                    self.dataManager.save(film)
                }
                self.dataSource.dataArray = self.dataManager.getFilms()
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure:
                break
            }
        }
    }
}

// MARK: - Pagination
extension MainController: UIScrollViewDelegate{
    func scrollViewDidScroll( _ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (collectionView.contentSize.height-100-scrollView.frame.size.height){
            guard NetworkManager.shared.isPageRefreshing == false else {return}
            NetworkManager.shared.fetchFilms(pagination: true) {  result in
                switch result{
                case .success(let filmArray):
                    for film in filmArray{
                        self.dataManager.save(film)
                    }
                    self.dataSource.dataArray = self.dataManager.getFilms()
                    DispatchQueue.main.async{
                        self.collectionView.reloadData()
                    }
                case .failure(_):
                    break
                }
            }
            DispatchQueue.main.async{
                self.collectionView.reloadData()
            }
        }
    }
}
//MARK: - DataSource
final class CollectionDataSource: NSObject, UICollectionViewDataSource{
    var dataArray: [Displayable] = []
    var selectedItem: Film?
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.reuseId, for: indexPath) as! FilmCell
        cell.configure(with: dataArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     //   selectedItem = dataArray[indexPath.item]
    }
}
