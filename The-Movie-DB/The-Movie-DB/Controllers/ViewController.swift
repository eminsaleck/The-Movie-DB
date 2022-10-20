//Pagination
//Realm
//Coordinator + selectedItem ->   var data: Displayable? (DetailVC)

//DiffableDataSource + Realm


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

