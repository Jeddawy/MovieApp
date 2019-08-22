//
//  MovieDetailsViewController.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/21/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class MovieDetailsViewController: BaseViewController {
    
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
    
    internal let minimumCellSpacing : CGFloat = 15
    internal let cellWidth: CGFloat = 200
    internal let cellHieght: CGFloat = 125
    
    private func initVM(){
        viewModel.showLoader = { [weak self] in
            self?.startLoading()
        }
        
        viewModel.hideLoader = { [weak self] in
            self?.endLoading()
        }
        
        viewModel.refreshClosure = {
            [weak self] () in
            self?.videosCollectionView.reloadData()
            self?.reviewsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setup()
        initVM()
        setupCollectionAndTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setupSubviews()
    }
    func setupCollectionAndTableView(){
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        reviewsTableView.delegate = self
        reviewsTableView.dataSource = self
        reviewsTableView.rowHeight = UITableView.automaticDimension
        reviewsTableView.estimatedRowHeight = 200
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
        if let vote = movie.voteAverage {
            self.ratingLabel.text = String(describing: vote) + "/10"
        }
        self.overviewLabel.text = movie.overview
    }
    
    static func create() -> MovieDetailsViewController {
        return UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: MovieDetailsViewController.ID) as! MovieDetailsViewController
    }
    
}

extension MovieDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reviewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let review = viewModel.getReview(atIndex: indexPath.row){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.ID, for: indexPath) as? ReviewTableViewCell else {
                return UITableViewCell()
            }
            cell.bind(review: review)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension MovieDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.trailersCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrailerCollectionViewCell.ID, for: indexPath) as? TrailerCollectionViewCell else {
                return UICollectionViewCell()
            }
            let movie = viewModel.movieDetails()
            cell.bind(image: movie.backdropPath)
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didTapTrailer(atIndex: indexPath.row)
    }
    
}
extension MovieDetailsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumCellSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: cellWidth, height: cellHieght)
    }
}
