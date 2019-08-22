//
//  MoviesCategoriesViewcontroller + CollectionViewDelegation.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/22/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation
import UIKit

extension MoviesCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categoriesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let category = viewModel.getCategory(atIndex: indexPath.row){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCategoriesTableViewCell.ID, for: indexPath) as? MovieCategoriesTableViewCell else {
                return UITableViewCell()
            }
            cell.dataSource = self
            cell.bind(category: category)
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
