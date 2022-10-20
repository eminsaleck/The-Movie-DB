//CollectionView
//ReusableCell
//Realm
//FetchData into Cells

//DiffableDataSource + Realm

//Pagination

//selectedItem ->   var data: Displayable? (DetailVC)


import UIKit

class ViewController: UIViewController {

    var dataSource = CollectionDataSource() {
        didSet {
          collectionView.reloadData()
          }
    }
 
    
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
        fetchFilms()
        collectionView.dataSource = dataSource
    }
}


extension ViewController{
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in

            return self.createPopularSection()
        }
        
        return layout
    }
    
    func createPopularSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(200))
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
