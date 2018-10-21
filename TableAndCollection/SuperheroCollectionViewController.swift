//
//  SuperheroCollectionViewController.swift
//  TableAndCollection
//
//  Created by ThisObey Studio on 21/10/18.
//  Copyright © 2018 ThisObey Studio. All rights reserved.
//

import Foundation
import UIKit

// MARK: - SuperheroCollectionViewController: UICollectionViewController

class SuperheroCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: Properties
    
    // Get ahold of some superheroes, for the table
    // This is an array of Superhero instances
    let allSuperheroes = Superhero.allSuperheroes
    
    let imageRatio: CGFloat = 215 / 267
    
    var width: CGFloat = 215
    var height: CGFloat = 267
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false

        updateMaxItemsPerRow(size: self.collectionView.frame.size)
    }
    
    func updateMaxItemsPerRow(size: CGSize) {
        
        var maxItemsPerRow: CGFloat = 2
        if size.width > size.height {
            maxItemsPerRow = 6
            print("landscape")
        } else {
            maxItemsPerRow = 3
            print("portrait")
        }
        self.width = (size.width / maxItemsPerRow) - 12
        self.height = self.width / imageRatio
        
        self.collectionView.reloadData()
    }
    
    // MARK: Collection View Data Source

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateMaxItemsPerRow(size: size)
    }
    
    // MARK: Collection View Data Source
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.width, height: self.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allSuperheroes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuperheroCollectionViewCell", for: indexPath) as! SuperheroCollectionViewCell
        let superhero = self.allSuperheroes[(indexPath as NSIndexPath).row]

        // Set the image
        cell.superheroImageView?.image = UIImage(named: superhero.imageName)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SuperheroDetailViewController") as! SuperheroDetailViewController
        detailController.superhero = self.allSuperheroes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }

}
