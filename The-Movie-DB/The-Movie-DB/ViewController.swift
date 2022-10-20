//CollectionView
//ReusableCell
//Realm
//FetchData into Cells

//DiffableDataSource + Realm

//Pagination


import UIKit
import Alamofire


class ViewController: UIViewController {

    var films: [Film] = []  // Realm
    var items: [Displayable] = [] //from Realm to Items -> reloadData()
    var selectedItem: Displayable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFilms()

    }
}



extension ViewController{
func fetchFilms() {
    let url = "https://api.themoviedb.org/3/movie/popular?api_key=a5ac3411803536cfb4b1cd90557dc8a7&language=en-US&page=1"
    
    AF.request(url, method: .get)
        .validate()
        .responseDecodable(of: Films.self) { (response) in
    guard let films = response.value else { return }
            self.films = films.results //Films -> into Realm
          //  self.items = films.results
            print(films.page)

        }
}
}
