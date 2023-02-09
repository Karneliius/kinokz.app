//
//  DetailsHeaderView.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 07.02.2023.
//

import UIKit

class DetailsHeaderView: UIView {
    
    private lazy var backdropImageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Setup views and constraints

private extension DetailsHeaderView {
    func setupViews() {
        addSubview(backdropImageView)
        
        
    }
    
    func setupConstraints() {
        backdropImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
