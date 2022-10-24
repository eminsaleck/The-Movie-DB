
//Realm  |->| [Film]
//dataArr|->| [Displayable]

//Coordinator + selectedItem -> 2 hours
//var data: Displayable? (DetailVC)

//DiffableDataSource + Realm    2 hourss
import UIKit
class ViewController: UIViewController, UICollectionViewDelegate {
    
    //    var films = DataManager.shared.films // Realm instance
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
// MARK:  - Network
extension ViewController{
    
    private func fetchData(){
        NetworkManager.shared.fetchFilms{ [weak self] result in
            switch result{
            case .success(let film):
                for i in film{
                    DataManager.shared.save(i)
                }
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure:
                break
            }
        }
    }
}

// MARK: - Pagination
extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll( _ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (collectionView.contentSize.height-100-scrollView.frame.size.height){
            
            NetworkManager.shared.fetchFilms(pagination: true) {  result in
                switch result{
                case .success(let film):
                    
                    for i in film{
                        DataManager.shared.save(i)
                    }
                    
                case .failure(_):
                    break
                }
            }
            self.dataSource.dataArray = DataManager.shared.getFilms()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            //       DataManager.shared.getFilms()
            
        }
    }
    
    
}

