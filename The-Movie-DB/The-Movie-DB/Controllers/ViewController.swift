
//Realm  |->| [Film]
//dataArr|->| [Displayable]

//Coordinator + selectedItem -> 2 hours
//var data: Displayable? (DetailVC)

//DiffableDataSource + Realm    2 hourss

import Alamofire
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    private var dataSource =  CollectionDataSource()
    
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
        fetchData()
        
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        
    }
    
}
// MARK: Network 
extension ViewController{
    private func fetchData(){
        APICaller.shared.fetchFilms{ [weak self] result in
            switch result{
            case .success(let film):

               self?.dataSource.films.append(contentsOf: film)
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure:
                break
            }
        }
    }
}

// MARK: Pagination
extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll( _ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (collectionView.contentSize.height-100-scrollView.frame.size.height){
            APICaller.shared.fetchFilms(pagination: true) { [weak self] result in
                switch result{
                case .success(let film):
                    self?.dataSource.films.append(contentsOf: film)

                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                    }
                    
                case .failure(_):
                    break
                }
            }
        }
    }
    
}

// MARK: CompositionalLayout + SpinnerFooter
extension ViewController{
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            return self.createPopularSection()
        }
        return layout
    }
    
    private func createPopularSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(240))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 8, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 66, leading: 20, bottom: 0, trailing: 20)
        
        return section
    }
}

