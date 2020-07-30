//
//  HomeTableViewCell.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/17/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import Stevia
class HomeTableViewCell: UITableViewCell {
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let CollectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
           layout.scrollDirection = .vertical
           collectionView.backgroundColor = .clear
           collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
           collectionView.showsHorizontalScrollIndicator = false
           collectionView.showsVerticalScrollIndicator = false
           collectionView.bounces = false
           return collectionView
       }()
    func setupLayout() {
        self.layout(
        0,
        |-0-containerView-0-|,
        0
        )
        containerView.layout(
        0,
        |-10-CollectionView-10-|,
        0
        )
    }

    var cellDatas = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.sv(containerView)
        containerView.sv(CollectionView)
        setupLayout()
        self.CollectionView.dataSource = self
        self.CollectionView.delegate = self
        
        if let flowLayout = CollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            
        }
    }

}
extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.textLabel.text = cellDatas[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.height)
    }
    
}
