//
//  DogListViewController.swift
//  appkonfio
//
//  Created by Jorge on 11/11/19.
//  Copyright (c) 2019 pagatodo. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import Kingfisher

final class DogListViewController: UIViewController {
    
    // MARK: - Public properties -
    
    var presenter: DogListPresenterInterface!
    var sourceDogsList: [DogsObject] = []
    
    // MARK: - IBOutlets -
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorColor = .clear
        self.presenter.getDogList()
    }
    
}

// MARK: - Extensions -

extension DogListViewController: DogListViewInterface {
    func setSourceDogsList(_ dogsList: [DogsObject]){
        sourceDogsList = dogsList
        tableView.reloadData()
    }
}


extension DogListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceDogsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! DogViewCell
        
        let item = self.sourceDogsList[indexPath.item]
        if let url = URL(string: sourceDogsList[indexPath.row].url){
            let resource = ImageResource(downloadURL: url, cacheKey: "dog\(sourceDogsList[indexPath.row].url)")
            cell.dogImage.kf.indicatorType = .activity
            cell.dogImage.kf.indicator?.startAnimatingView()
            cell.dogImage.kf.setImage(with: resource, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cache, url) in
                if(error == nil){
                    cell.dogImage.kf.indicator?.stopAnimatingView()
                }
            }
        }
        cell.dogNameLabel.text = item.dogName
        cell.descriptionLabel.text = item.description
        cell.ageLabel.text = "Almost \(item.age) years"
        
        return cell
    }
}

extension DogListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}
