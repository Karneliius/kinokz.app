//
//  PlaceViewController.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 28.01.2023.
//

import UIKit
import SnapKit

final class PlaceViewController: UIViewController {
    
    var apiPlaceCaller = APIPlaceCaller()
    var nowPlayingMovieList: [NowPlayingMovieModel] = []
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let placesCategory = Constants.Places.allCases
    private let descriptionOfPlace = Constants.Info.allDataCell()
    
    private lazy var movieSearchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.searchBarStyle = .minimal
        searchbar.placeholder = "Поиск"
        return searchbar
    }()
    private lazy var movieTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NowPlayingMoviesTableViewCell.self, forCellReuseIdentifier:Constants.Identifiers.nowPlayingMoviesTableViewCell)
        tableView.isScrollEnabled = false
        return tableView
    }()
    private lazy var categoryCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell)
            collectionView.showsHorizontalScrollIndicator = false
            return collectionView
        
    }()
   /*
    private let placesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlacesTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.placesTableViewCell)
        tableView.isScrollEnabled = false
        return tableView
    }()
    */
    
    private lazy var someLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()

    /*
     private lazy var placesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.register(PlacesCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.placesCollectionViewCell)
        return collectionview
    }()
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiPlaceCaller.delegate = self
        apiPlaceCaller.fetchRequest()
        
        view.backgroundColor = .systemBackground
        movieTableView.dataSource = self
        movieTableView.delegate = self
        /*
        placesCollectionView.dataSource = self
        placesCollectionView.delegate = self
        placesTableView.dataSource = self
        placesTableView.delegate = self
         */
        
        setupViews()
        setupConstraints()
    }

}
//MARK: - API Caller delegate methods

extension PlaceViewController: APIPlaceCallerDelegate {
    func didUpdateMovieList(with nowPlayingMovieList: [NowPlayingMovieModel]) {
        self.nowPlayingMovieList.append(contentsOf: nowPlayingMovieList)
    }
    
    func didFailWithError(_ error: Error) {
        print("Filed: ", error)
    }
}
//MARK: - CollectionView dataSource methods

extension PlaceViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placesCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.placesCollectionViewCell, for: indexPath) as? PlacesCollectionViewCell else {return UICollectionViewCell() }
        cell.setupHeaders(with: placesCategory[indexPath.item].rawValue)
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}

//MARK: - CollectionView delegate methods

extension PlaceViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = placesCategory[indexPath.item].rawValue
        label.sizeToFit()
        return CGSize (width: label.frame.size.width + 30, height: collectionView.frame.size.height - 15)
    }
}

//MARK: - TableView dataSource methods

extension PlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nowPlayingMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.nowPlayingMoviesTableViewCell, for: indexPath) as? NowPlayingMoviesTableViewCell else { return UITableViewCell() }
        cell.imageMovie(with: nowPlayingMovieList[indexPath.item + 1].posterPath)
        cell.titleMovie(with: nowPlayingMovieList[indexPath.item + 1].title)
        cell.dateOfIssue(with: nowPlayingMovieList[indexPath.item + 1].releaseDate)
        cell.movieDesctiption(with: nowPlayingMovieList[indexPath.item + 1].overview)
    //    cell.imageOfPlace(with: descriptionOfPlace[indexPath.item].imageName)
    //    cell.nameOfPlace(with: descriptionOfPlace[indexPath.item].name)
    //    cell.addressOfPlace(with: descriptionOfPlace[indexPath.item].address)
        return cell
    }
}

//MARK: - TableView delegate methods

extension PlaceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.1
    }
}

//MARK: - Setup Views and Constraints methods

private extension PlaceViewController {
    
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(movieSearchBar)
        contentView.addSubview(categoryCollectionView)
        contentView.addSubview(movieTableView)
        contentView.addSubview(someLabel)
        //contentView.addSubview(placesCollectionView)
        //contentView.addSubview(placesTableView)
    }
    
    func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        movieSearchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.05)
        }
        movieSearchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(movieSearchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.06)
        }
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().offset(10)
            make.height.equalTo(view).multipliedBy(0.2)
        }
        someLabel.snp.makeConstraints { make in
            make.top.equalTo(movieTableView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            
            /* placesCollectionView.snp.makeConstraints { make in
             make.top.equalTo(movieSearchBar.snp.bottom).offset(10)
             make.leading.trailing.equalToSuperview()
             make.height.equalTo(view).multipliedBy(0.05)
             }
             
             placesTableView.snp.makeConstraints { make in
             make.top.equalTo(placesCollectionView.snp.bottom).offset(10)
             make.leading.trailing.bottom.equalToSuperview()
             make.height.equalTo(view).multipliedBy(2)
             }
             */
        }
    }
}
