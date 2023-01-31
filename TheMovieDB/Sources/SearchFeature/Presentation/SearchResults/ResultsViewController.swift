//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    private let viewModel: ResultsViewModelProtocol
    private let resultsView = ResultsView()

    
    init(viewModel: ResultsViewModelProtocol) {
      self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
      super.loadView()
      view = resultsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
