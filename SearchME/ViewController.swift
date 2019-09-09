//
//  ViewController.swift
//  SearchME
//
//  Created by Wilfred Furthado M on 05/09/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchMeTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController:ProductInfoViewController = storyBoard.instantiateViewController(withIdentifier: "ProductInfoViewController") as! ProductInfoViewController
        nextViewController.searchString = searchBar.text ?? "samsung"
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}

