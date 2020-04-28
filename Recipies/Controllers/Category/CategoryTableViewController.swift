//
//  CategoryTableViewController.swift
//  Recipies
//
//  Created by Cristian Sedano Arenas on 25/04/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    let data = Recipes().recipe

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        cell.categoryLabel.text = data[indexPath.row].name
        
        return cell
    }
}
