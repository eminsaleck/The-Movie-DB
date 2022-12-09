
import UIKit

class HeaderView: UICollectionReusableView {
    static let reuseIdentifier = "header-reuse-identifier"
    
    let label = UILabel()
    let label2 = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension HeaderView {
    func setup() {
        backgroundColor = .systemBackground
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addSubview(label)
        addSubview(label2)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        
        label2.text = "All"
        label2.textColor = #colorLiteral(red: 0.5994125605, green: 0.9020920396, blue: 0.9021293521, alpha: 1)
        label2.font = .systemFont(ofSize: 18, weight: .light)

        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
       
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset - 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
                        
            label2.trailingAnchor.constraint(equalTo: trailingAnchor),
            label2.centerYAnchor.constraint(equalTo: label.centerYAnchor)
        ])
    }
    
}


