//
//  NowPlayingMoviesTableViewCell.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 09.02.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class NowPlayingMoviesTableViewCell: UITableViewCell {
    
    private lazy var imageViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var someView: UIView = {
        let view = UIView()
        return view
    }()
        
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
        
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
        
    private lazy var desctiptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .systemGray4
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func imageMovie(with posterPath: String) {
        guard let url = URL(string: "\(Constants.Links.image)\(posterPath)") else { fatalError("Incorrect linkposterPath") }
        DispatchQueue.main.async {
            self.imageViewCell.kf.setImage(with: url)
        }
    }
        
    func titleMovie(with title: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = title
        }
    }
        
    func dateOfIssue(with text: String) {
        DispatchQueue.main.async {
            self.dateLabel.text = text
        }
    }
    
    func movieDesctiption(with text: String) {
        DispatchQueue.main.async {
            self.desctiptionLabel.text = text
        }
    }
}

//MARK: - Setup Views and Constraints methods

private extension NowPlayingMoviesTableViewCell {
    func setupViews() {
        contentView.addSubview(someView)
        contentView.addSubview(imageViewCell)
        someView.addSubview(nameLabel)
        someView.addSubview(dateLabel)
        someView.addSubview(desctiptionLabel)
    }
        
    func setupConstraints() {
        imageViewCell.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.9)
        }
        someView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(imageViewCell.snp.trailing).offset(9)
            make.trailing.equalToSuperview().inset(17)
            make.height.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        desctiptionLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        }
    }
}
