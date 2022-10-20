//CollectionView
//ReusableCell
//Realm
//FetchData into Cells

//DiffableDataSource + Realm

//Pagination

//selectedItem ->   var data: Displayable? (DetailVC)


import UIKit
import Alamofire


class ViewController: UIViewController {

    var films: [Film] = []  // Realm
    var items: [Displayable] = [] //from Realm to Items -> reloadData()
    var selectedItem: Displayable?
    
    override func loadView() {
        view = FilmCollection()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFilms()
        

    }
}




extension ViewController{
private func fetchFilms() {
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


/*

 // MARK: - Alamofire
 extension DetailViewController {
   private func fetch<T: Decodable & Displayable>(_ list: [String], of: T.Type) {
     var items: [T] = []
     let fetchGroup = DispatchGroup()
     
     list.forEach { (url) in
       fetchGroup.enter()
       AF.request(url).validate().responseDecodable(of: T.self) { (response) in
         if let value = response.value {
           items.append(value)
         }
         fetchGroup.leave()
       }
     }
     
     fetchGroup.notify(queue: .main) {
       self.listData = items
       self.listTableView.reloadData()
     }
   }
   
   func fetchList() {
     guard let data = data else { return }
     
     switch data {
     case is Film:
       fetch(data.listItems, of: Starship.self)
     case is Starship:
       fetch(data.listItems, of: Film.self)
     default:
       print("Unknown type: ", String(describing: type(of: data)))
     }
   }
 }
*/
