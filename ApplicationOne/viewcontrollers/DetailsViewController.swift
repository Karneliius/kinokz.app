//
//  DetailsViewController.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 07.02.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
}
//MARK: - Setup views and constraints

private extension  DetailsViewController {
    func setupViews() {
        view.addSubview(mainTableView)
        
    }
    
    func setupConstraints() {
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
