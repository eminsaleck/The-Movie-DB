
import UIKit

class HeaderView: UICollectionReusableView {
    static let reuseIdentifier = "header-reuse-identifier"
    
    let label = UILabel()
    
    let button = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension HeaderView {
    func configure() {
        backgroundColor = .systemBackground
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addSubview(label)
        addSubview(button)
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        button.setTitle("All", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.6006157446, green: 0.9003378892, blue: 0.9005155683, alpha: 1), for: .normal)
        
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset - 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: label.centerYAnchor)
        ])
    }
}
