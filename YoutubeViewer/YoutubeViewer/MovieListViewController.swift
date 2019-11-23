//
//  MovieListViewController.swift
//  YoutubeViewer
//
//  Created by STV-M025 on 2019/10/26.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    @IBOutlet weak var movieList: UITableView!
    
    let movieListEndPoint = "/videos"
    let channelListEndPoint = "/chancels"
    let movieListRealm = MovieListDao()
    var movieListDBData: [MovieListData] = []

    let channelListRealm = ChannelListDao()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieList.delegate = self
        movieList.dataSource = self
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        movieListDBData = Array(movieListRealm.findAll())
        
        // Do any additional setup after loading the view.
        let apiClient = APIClient()
        apiClient.fetchCoupons(endPoint: movieListEndPoint) { (result) in
            switch result {
            case .success(let data):
                self.decodeMovieList(data: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func decodeMovieList(data: Data) {
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(MovieList.self, from: data) else {
            return
        }
        movieListRealm.deleteAll()
        movieListRealm.add(objects: setMovieListDataFromAPI(data: decodeData))
        print(decodeData)
        reloadListData()
    }
    
    func reloadListData() {
        movieListDBData = Array(movieListRealm.findAll())
        movieList.reloadData()
    }
}

extension MovieListViewController {
    func decodeChannelList(data: Data) {
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(ChannelList.self, from: data) else {
            return
        }

        
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if movieListDBData.count == 0 {
            return
        }

        let apiClient = ChannelListAPIClient()
        apiClient.fetchChannelList(endPoint: channelListEndPoint, parameter: movieListDBData[indexPath.row].id) { (result) in
            switch result  {
            case .success(let data):
                self.decodeMovieList(data: data)
            case .failure(let error):
                print(error)
            }
        }

        let storyboard: UIStoryboard = UIStoryboard(name: "ChannelDetailViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChannelDetailViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if movieListDBData.count < 1 {
            return 1
        } else {
            return movieListDBData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if movieListDBData.count < 1 {
            tableView.register(UINib(nibName: "NoMovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "NoMovieListTableViewCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoMovieListTableViewCell", for: indexPath)
            return cell
        }
        
        tableView.register(UINib(nibName: "MovieListCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListCellTableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCellTableViewCell", for: indexPath)
        guard let movieListCell = cell as? MovieListCellTableViewCell else {
            return cell
        }
        movieListCell.setLayout(data: movieListDBData[indexPath.row])
        return movieListCell
    }
    
    
}
