//
//  CategoryCollectionViewCell.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 28.01.2023.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    private var cellSelected: Bool = false
<<<<<<< HEAD
    
    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .label
        label.textAlignment = .center
        return label
        
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
=======
        
    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setupViews()
        setupConstraints()
>>>>>>> 784b82f (added now playing)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        categoryNameLabel.text = text
    }
}
<<<<<<< HEAD
//MARK: - Setup views and constraints

=======

//MARK: - Setup views and constraints
>>>>>>> 784b82f (added now playing)
private extension CategoryCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(categoryNameLabel)
<<<<<<< HEAD
        
=======
>>>>>>> 784b82f (added now playing)
    }
    
    func setupConstraints() {
        categoryNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
<<<<<<< HEAD
        
=======
>>>>>>> 784b82f (added now playing)
    }
}
