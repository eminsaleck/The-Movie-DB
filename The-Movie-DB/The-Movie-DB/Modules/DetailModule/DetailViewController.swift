//
//  DetailViewController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//
 
import UIKit


class DetailViewController: UIViewController{
    
    var coordinator: DetailsCoordinatorFlow?
    var viewModel: DetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        print(viewModel?.movie?.overview)
    }
    
}
