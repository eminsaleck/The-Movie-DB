//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 17.02.2023.
//

import UIKit

public class EmptyView: UIView {
    private let label = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        label.text = "No content to display"
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    public static var defaultView: EmptyView {
        let view = EmptyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
