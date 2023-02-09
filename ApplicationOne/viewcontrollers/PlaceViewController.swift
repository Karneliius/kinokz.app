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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiPlaceCaller.delegate = self
        apiPlaceCaller.fetchRequest()
        
        view.backgroundColor = .systemBackground
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
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

//MARK: - TableView dataSource methods

extension PlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nowPlayingMovieList.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.nowPlayingMoviesTableViewCell, for: indexPath) as? NowPlayingMoviesTableViewCell else { return UITableViewCell() }
        cell.imageMovie(with: nowPlayingMovieList[indexPath.item + 1].posterPath)
        cell.titleMovie(with: nowPlayingMovieList[indexPath.item + 1].title)
        cell.dateOfIssue(with: nowPlayingMovieList[indexPath.item + 1].releaseDate)
        cell.movieDesctiption(with: nowPlayingMovieList[indexPath.item + 1].overview)
        return cell
    }
}

//MARK: - TableView delegate methods

extension PlaceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.3
    }
}

//MARK: - Setup Views and Constraints methods

private extension PlaceViewController {
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(movieSearchBar)
        contentView.addSubview(movieTableView)
    }
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        movieTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges).inset(10)
        }
        movieSearchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.06)
        }
        movieSearchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
       
    }
}
