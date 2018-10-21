//
//  SuperheroDetailViewController.swift
//  TableAndCollection
//
//  Created by ThisObey Studio on 21/10/18.
//  Copyright © 2018 ThisObey Studio. All rights reserved.
//

import UIKit

// MARK: - SuperheroDetailViewController: UIViewController

class SuperheroDetailViewController: UIViewController {

    // MARK: Properties
    
    var superhero: Superhero!
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = self.superhero.name

        self.tabBarController?.tabBar.isHidden = true
        
        self.imageView!.image = UIImage(named: superhero.imageName)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
