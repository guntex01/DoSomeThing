//
//  CreationViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/28/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    let CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collectionView.backgroundColor = .clear
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = false
        return collectionView
    }()
    let datas = sectionData()
    var numberOfSectionCreation = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sáng tạo"
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
        CollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
    }
}
extension CreationViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.textLabel.text = datas[numberOfSectionCreation].contents[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/5)
    }
    
    
}
