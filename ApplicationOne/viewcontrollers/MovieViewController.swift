//
//  MovieViewController.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 28.01.2023.
//

import UIKit

final class MovieViewController: UIViewController {
    
<<<<<<< HEAD
=======
    var apiCaller = APICaller()
    var allMoviesList: [[MovieModel]] = []
    
>>>>>>> 784b82f (added now playing)
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let categoryList = Constants.Category.allCases
    
    private lazy var movieSearchBar: UISearchBar = {
<<<<<<< HEAD
        let searchBar = UISearchBar()
        searchBar.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search movies, series, tv shows"
        return searchBar
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell)
        collectionView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var trendingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell)
        collectionView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var categoryTableView: UITableView  = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.categoryTableViewCell)
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
=======
            let searchBar = UISearchBar()
            searchBar.searchBarStyle = .minimal
            searchBar.placeholder = "Search movies, series, tv shows"
            return searchBar
        }()
    
    private lazy var categoryCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell)
            collectionView.showsHorizontalScrollIndicator = false
            return collectionView
        
    }()
        
    private lazy var trendingCollectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell)
           collectionView.showsHorizontalScrollIndicator = false
           return collectionView
        
    }()
        
    private lazy var categoryTableView: UITableView = {
            let tableView = UITableView()
            tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.categoryTableViewCell)
            tableView.isScrollEnabled = false
            tableView.separatorStyle = .none
            return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiCaller.delegate = self
        apiCaller.fetchRequest()
        
        view.backgroundColor = .systemBackground
            
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
>>>>>>> 784b82f (added now playing)
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        
        setupViews()
        setupConstraints()
<<<<<<< HEAD
        
    }
}
//MARK: - Collection view data source methods

extension MovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categoryList.count
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
=======
    }
}

//MARK: - API Caller delegate methods

extension MovieViewController: APICallerDelegate {
    func didUpdateMovieList(with movieList: [MovieModel]) {
        self.allMoviesList.append(movieList)
        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
            self.trendingCollectionView.reloadData()
            self.categoryTableView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print("Failer with error: ", error)
        
    }
}

//MARK: - Collection view data source methods

extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categoryList.count
            
        }
        if allMoviesList.isEmpty {
            return 0
        }
        return allMoviesList[0].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:Constants.Identifiers.categoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
>>>>>>> 784b82f (added now playing)
            cell.configure(with: categoryList[indexPath.row].rawValue)
            cell.backgroundColor = .systemGray6
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            return cell
<<<<<<< HEAD
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell, for: indexPath) as! TrendingCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}


//MARK: - Collection view delegate methods

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == categoryCollectionView {
            let label = UILabel()
            label.text = categoryList[indexPath.row].rawValue
            label.font = UIFont.systemFont(ofSize: 15)
            label.sizeToFit()
            return CGSize(width:label.frame.size.width + 30, height:collectionView.frame.size.height - 15)
        }
        let height = collectionView.frame.size.height
        return CGSize(width: view.frame.size.width * 0.75, height: height)
    }
}

// TODO
//extension MovieViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//      let cell = collectionView.cellForItem(at: indexPath)
//        cell?.isSelected = true
//    }
    
//}
//MARK: - Table view  data source methods

extension MovieViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count - 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
=======
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell, for: indexPath) as! TrendingCollectionViewCell
        cell.configure(with: allMoviesList[0][indexPath.item].backdropPath)
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
        
    }
}

//MARK: - Collection view delegate methods
   
extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            let label = UILabel()
            label.text = categoryList[indexPath.row].rawValue
            label.sizeToFit()
            return CGSize(width: label.frame.size.width + 30, height: collectionView.frame.size.height - 10)
            
        }
        let height = collectionView.frame.size.height
        return CGSize(width: view.frame.size.width * 0.75, height: height)
        
    }
}

//MARK: - Table view data source methods

extension MovieViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
>>>>>>> 784b82f (added now playing)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionHeaderView()
<<<<<<< HEAD
        view.configure(with: categoryList[section + 1].rawValue, number: 6)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.categoryTableViewCell, for: indexPath) as! CategoryTableViewCell
        return cell
    }
    
}

//MARK: - Table view  delegate methods

extension MovieViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.4
=======
        let title = String(categoryList[section].rawValue.dropFirst())
        view.configure(with: title, number: 6)
        return view
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if allMoviesList.count == Constants.Values.urlList.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.categoryTableViewCell, for:indexPath) as! CategoryTableViewCell
            cell.configure(with: allMoviesList[indexPath.section + 1])
            return cell
        }
        return UITableViewCell()
     }
 }

//MARK: - Table view delegate methods
    
extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.3
        
>>>>>>> 784b82f (added now playing)
    }
}

//MARK: - Setup views and constraints

private extension MovieViewController {
<<<<<<< HEAD
    
    func setupViews(){
=======
    func setupViews() {
>>>>>>> 784b82f (added now playing)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(movieSearchBar)
        contentView.addSubview(categoryCollectionView)
        contentView.addSubview(trendingCollectionView)
        contentView.addSubview(categoryTableView)
<<<<<<< HEAD
    }
    
    func setupConstraints(){
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
=======
        
    }
        
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
>>>>>>> 784b82f (added now playing)
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        movieSearchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
<<<<<<< HEAD
            make.height.equalToSuperview().multipliedBy(0.05)
=======
            make.height.equalTo(view).multipliedBy(0.06)
        }
        movieSearchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
>>>>>>> 784b82f (added now playing)
        }
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(movieSearchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
<<<<<<< HEAD
            make.height.equalToSuperview().multipliedBy(0.05)
=======
            make.height.equalTo(view).multipliedBy(0.06)
>>>>>>> 784b82f (added now playing)
        }
        trendingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
<<<<<<< HEAD
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(trendingCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view)
            make.bottom.equalToSuperview()
            
        }
    }
=======
            make.height.equalTo(view).multipliedBy(0.2)
        }
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(trendingCollectionView.snp.bottom).offset(10)
            make.height.equalTo(view).multipliedBy(1.6)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
>>>>>>> 784b82f (added now playing)
}
