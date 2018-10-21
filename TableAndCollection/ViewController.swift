//
//  ViewController.swift
//  TableAndCollection
//
//  Created by ThisObey Studio on 21/10/18.
//  Copyright © 2018 ThisObey Studio. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    // Get ahold of some superheroes, for the table
    // This is an array of Superhero instances
    let allSuperheroes = Superhero.allSuperheroes
    
    // MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allSuperheroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuperheroCell")!
        let superhero = self.allSuperheroes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.text = superhero.name
        cell.imageView?.image = UIImage(named: superhero.imageName)
        
//        // If the cell has a detail label, we will put the evil scheme in.
//        if let detailTextLabel = cell.detailTextLabel {
//            detailTextLabel.text = "Scheme: \(superhero.evilScheme)"
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SuperheroDetailViewController") as! SuperheroDetailViewController
        detailController.superhero = self.allSuperheroes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
}

