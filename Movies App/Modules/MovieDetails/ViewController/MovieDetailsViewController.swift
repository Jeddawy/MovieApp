//
//  MovieDetailsViewController.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/21/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    static let ID = "MovieDetailsViewController"
    var viewModel: MovieDetailsViewModel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    @IBOutlet weak var reviewsTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setupSubviews()
    }
    func setupCollectionView(){
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        reviewsTableView.delegate = self
        reviewsTableView.dataSource = self
    }
    private func setupSubviews(){
        let movie = viewModel.movieDetails()
        if let url = URL(string: movie.backdropPath){
            self.coverImageView.sd_setImage(with: url, completed: nil)
        }
        if let posterUrl = URL(string: movie.posterPath){
            self.posterImageView.sd_setImage(with: posterUrl, completed: nil)
        }
        self.movieTitleLabel.text = movie.title
        self.releaseDateLabel.text = movie.releaseDate
        self.ratingLabel.text = "\(movie.voteAverage)"
        self.overviewLabel.text = movie.overview
    }
    
    static func create() -> MovieDetailsViewController {
        return UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: MovieDetailsViewController.ID) as! MovieDetailsViewController
    }
    
}

extension MovieDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension MovieDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
extension MovieDetailsViewController: UICollectionViewDelegateFlowLayout{
    
}
