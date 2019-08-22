//
//  VMoviesCategoriesViewController.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/20/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class MoviesCategoriesViewController: BaseViewController {
    
    static let ID = "MoviesCategoriesViewController"
    @IBOutlet weak var tableView: UITableView!
    var thereIsCellTapped = false
    var selectedRowIndex = -1
    var expandedCellHieght : CGFloat = 167
    var collapsedCellHieght : CGFloat = 40
    lazy var viewModel = MovieCategoriesViewModel()
    
    private func initVM(){
        viewModel.showLoader = { [weak self] in
            self?.startLoading()
        }
        viewModel.hideLoader = { [weak self] in
            self?.endLoading()
        }
        viewModel.refreshCollectionClosure = {
            [weak self] (indexPath) in
            let cell = self?.tableView.cellForRow(at: indexPath) as! MovieCategoriesTableViewCell
            cell.refresh()
            self?.tableView.reloadData()
        }
        viewModel.movieDetailsClosure = {
            [weak self] (movie) in
            let movieDetailsVC = MovieDetailsViewController.create()
            movieDetailsVC.viewModel = MovieDetailsViewModel(movie: movie)
            self?.navigationController?.pushViewController(movieDetailsVC, animated: true)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initVM()
        self.view.localizeSubViews()
        setupNavigationBar()
        tableviewSetup()
    }
    
    func tableviewSetup(){
        tableView.register(UINib(nibName: MovieCategoriesTableViewCell.ID, bundle: nil), forCellReuseIdentifier: MovieCategoriesTableViewCell.ID)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 155
        self.tableView.reloadData()
    }

    private func setupNavigationBar(){
        let changeLanguage = UIBarButtonItem(title: "changeLanguage".localized, style: .plain, target: self, action: #selector(changeLanguageAction))
        self.navigationItem.leftBarButtonItem = changeLanguage
        let favouriteIcon = UIImage(named: "Favourite")
        let favorite = UIBarButtonItem(image: favouriteIcon, style: .plain, target: self, action: #selector(favouriteAction))
        let settingsIcon = UIImage(named: "Settings")
        let arrange = UIBarButtonItem(image: settingsIcon, style: .plain, target: self, action: #selector(settingsAction))
        self.navigationItem.rightBarButtonItems = [favorite, arrange]
    }
    
    @objc func changeLanguageAction(){
        let changeLangVC = ChangeLanguageViewController.create()
        self.navigationController?.pushViewController(changeLangVC, animated: true)
    }
    
    @objc func favouriteAction(){
        
    }
    @objc func settingsAction(){
        
    }
}
