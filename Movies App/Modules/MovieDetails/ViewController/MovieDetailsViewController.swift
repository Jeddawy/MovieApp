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
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    @IBOutlet weak var reviewsTableView: UITableView!
    
    var viewModel: MovieDetailsViewModel!
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
        self.view.localizeSubViews()
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


