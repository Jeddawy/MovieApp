//
//  MovieDetailsViewController + TableViewDelegation.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/22/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation
import UIKit

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
