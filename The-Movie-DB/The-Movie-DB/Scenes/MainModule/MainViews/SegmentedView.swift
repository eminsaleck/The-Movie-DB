//
//  SegmentedView.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 06.11.2022.
//

import UIKit

class SegmentedView: UIView{
    
    weak var delegate: SegmentedViewPressed?
    let segmentedControl = UISegmentedControl(items: ["Movie","TV"])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        delegate?.pressed(sender.selectedSegmentIndex)
    }
}

protocol SegmentedViewPressed: AnyObject{
    func pressed(_ value: Int)
}

extension SegmentedView{
    
    func commonInit(){
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            segmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)

        ])
    }
    
    func setupView() {
        backgroundColor = .black
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.tintColor = .gray
        segmentedControl.selectedSegmentTintColor = .gray
        segmentedControl.setTitleTextAttributes([ .foregroundColor : UIColor.white ], for: .normal)
        segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
    }
}
