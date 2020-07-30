//
//  ITViewController.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/28/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
struct CustomData {
    var text: String
}
class ITViewController: UIViewController {
    let data = [
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           CustomData(text: ""),
           
       ]
    let screenWidth = UIScreen.main.bounds.width
    let screeHeight = UIScreen.main.bounds.height
    let CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collectionView.backgroundColor = .clear
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "IT"
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
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/5)
    }
   
}

class CustomCell: UICollectionViewCell {
    var data: CustomData? {
        didSet {
            guard let datas = data else {return}
            textLabel.text = datas.text
        }
    }
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.color01()
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        containerView.addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        textLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        textLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
