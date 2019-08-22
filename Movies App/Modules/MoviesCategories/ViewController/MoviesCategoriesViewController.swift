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
//            let cell = self?.tableView.cellForRow(at: IndexPath) as! MovieCategoriesTableViewCell
//            self?.tableView.reloadData()
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
//        viewModel.setup()
        tableviewSetup()
    }
    
    func tableviewSetup(){
        tableView.register(UINib(nibName: MovieCategoriesTableViewCell.ID, bundle: nil), forCellReuseIdentifier: MovieCategoriesTableViewCell.ID)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 155
        self.tableView.reloadData()
    }

}

extension MoviesCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let category = viewModel.getCategory(atIndex: indexPath.row){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCategoriesTableViewCell.ID, for: indexPath) as? MovieCategoriesTableViewCell else {
                return UITableViewCell()
            }
            cell.dataSource = self
            cell.bind(category: category)
            //        cell.bindMealPlansCell(image: meal?.image ?? "" , trainingStage: meal?.name ?? "", trainingType: meal?.target ?? "", subscriptionsCount: "\(meal?.noOfMeals ?? -1)")
            //        cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == selectedRowIndex && thereIsCellTapped {
            return self.expandedCellHieght
        }
        return collapsedCellHieght
    }
    
    //ExpandedCell Configuration
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.beginUpdates()
        
        let expandableCell = self.tableView.cellForRow(at: indexPath) as! MovieCategoriesTableViewCell
        
        if(self.selectedRowIndex > -1){
            let x = IndexPath(row: self.selectedRowIndex, section: 0)
            let expandableCell2 = self.tableView.cellForRow(at: x) as! MovieCategoriesTableViewCell
            expandableCell2.isCollapsed()
        }
        
        if selectedRowIndex != indexPath.row {
            self.thereIsCellTapped = true
            expandableCell.isExpanded()
            self.selectedRowIndex = indexPath.row
        } else {
            // there is no cell selected anymore
            self.thereIsCellTapped = false
            expandableCell.isCollapsed()
            self.selectedRowIndex = -1
        }
        viewModel.didTapCategoryCell(atIndex: indexPath.row, indexPath: indexPath)
        self.tableView.endUpdates()
        
    }
}

//CollectionViewDelgate

extension MoviesCategoriesViewController: MovieCollectionViewDelegate {
    func reload() {
        //
    }
    
    func getItemIndex(atIndex index: Int) -> MovieModel? {
        if let movie = viewModel.getMovie(atIndex: index){
            return movie
        }
        return nil
    }
    
    func didSelectCell(atIndex index: Int) {
        //
        viewModel.didTapMovieCell(atIndex: index)
    }
    
    func itemsCount() -> Int {
        return viewModel.moviesCount
    }
    
    
    
    
    
}
