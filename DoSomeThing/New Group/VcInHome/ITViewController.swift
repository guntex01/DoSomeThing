//
//  ITViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/28/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class ITViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    let CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collectionView.backgroundColor = .clear
        collectionView.register(ITCollectionViewCell.self, forCellWithReuseIdentifier: "ITCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = false
        return collectionView
    }()
    var cellDatas = fakeDatas()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        
    }
    func setupLayout(){
        view.addSubview(CollectionView)
        CollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1/10 * screeHeight).isActive = true
        CollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        CollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        CollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 1/11 * screeHeight).isActive = true
        
    }
}
extension ITViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ITCollectionViewCell", for: indexPath) as! ITCollectionViewCell
        cell.gallery = cellDatas[indexPath.section].motoImages[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = ((collectionView.frame.size.width/2))
        return CGSize(width: size, height: size)
    }
   
}
