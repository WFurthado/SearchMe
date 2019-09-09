//
//  ProductInfoViewController.swift
//  SearchME
//
//  Created by Wilfred Furthado M on 05/09/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import UIKit

class ProductInfoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var searchString = ""
    
    var viewModel = ProductInfoViewModel()
    
    var apiCallInitiated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = searchString
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.rowHeight = 250
        
        hitAPIAndGetProductsDetails()
        
        apiCallInitiated = true
        
        self.activityIndicator.startAnimating()

    }
    
    func hitAPIAndGetProductsDetails() {
        viewModel.getProductDetails(searchString: searchString) { (responseObject) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.apiCallInitiated = false
                self.activityIndicator.stopAnimating()
                self.tableViewBottomConstraint.constant = 0.0
            }
        }
    }
}

extension ProductInfoViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DeviceInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductInfo", for: indexPath) as! DeviceInfoTableViewCell
        
        let product: Product = viewModel.productInfoArray[indexPath.row]
        cell.setUp(productDetails: product)
        
        return cell
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView == tableView {
            if (((scrollView.contentOffset.y + scrollView.frame.size.height) >= (scrollView.contentSize.height)) && !apiCallInitiated)
            {
                apiCallInitiated = true
                viewModel.pageNumber += 1
                hitAPIAndGetProductsDetails()
                self.activityIndicator.startAnimating()
                self.tableViewBottomConstraint.constant = 60.0
            }
        }
    }
}
