//
//  MovieCategoriesTableViewCell.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/20/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

protocol MovieCollectionViewDelegate: class {
    func didSelectCell(atIndex index: Int)
    func getItemIndex(atIndex index: Int)-> MovieModel?
    func itemsCount()-> Int
}
class MovieCategoriesTableViewCell: UITableViewCell {
    
    static let ID = "MovieCategoriesTableViewCell"
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    internal let minimumCellSpacing : CGFloat = 15
    internal let cellWidth: CGFloat = 70
    internal let cellHieght: CGFloat = 125
    weak var dataSource : MovieCollectionViewDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewSetup()
        self.contentView.localizeSubViews()
        //        dataSource.reload() = refresh()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionViewSetup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: MovieCollectionViewCell.ID, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.ID)
    }
    
    func refresh(){
        collectionView.reloadData()
    }
    
    func isExpanded(){
        arrowImageView.image = UIImage(named: "Arrow-1")?.rotate(radians: .pi)
    }
    func isCollapsed(){
        arrowImageView.image = UIImage(named: "Arrow-1")?.rotate(radians: 0.0)
    }
    
    func bind(category: CategoryTableViewCellModel){
        self.categoryLabel.text = category.title
    }
}

extension MovieCategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  dataSource.itemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let item = dataSource.getItemIndex(atIndex: indexPath.row){
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.ID, for: indexPath) as? MovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.bind(movie: item)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataSource.didSelectCell(atIndex: indexPath.row)
    }
}

extension MovieCategoriesTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumCellSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: cellWidth, height: cellHieght)
    }
}

