//
//  DeviceInfoTableViewCell.swift
//  SearchME
//
//  Created by Wilfred Furthado M on 05/09/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import UIKit

class DeviceInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: CustomImageView!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var modelPrice: UILabel!
    @IBOutlet weak var scrachedPrice: UILabel!
    
    @IBOutlet weak var oneStar: UIImageView!
    @IBOutlet weak var twoStar: UIImageView!
    @IBOutlet weak var threeStar: UIImageView!
    @IBOutlet weak var fourStar: UIImageView!
    @IBOutlet weak var fiveStar: UIImageView!
    
    @IBOutlet weak var numberOfReviewsLabel: UILabel!
    
    @IBOutlet weak var rpPrice: UILabel!
    @IBOutlet weak var otherOfferLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var distributorImage: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUp(productDetails: Product) {
        modelName.text = productDetails.name ?? "Samsung"
        modelPrice.text = productDetails.price?.priceDisplay ?? "Not-available"
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: productDetails.price?.strikeThroughPriceDisplay ?? "")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))

        scrachedPrice.attributedText = attributeString
        
        let discountPercent = String(productDetails.price?.discount ?? 0)
        
        discountLabel.text = (discountPercent != "0") ? (discountPercent + "% OFF") : ""
        
        rpPrice.text = String(productDetails.price?.minPrice ?? 0)
        
        switch productDetails.review?.rating {
        case 5:
            fiveStar.image = UIImage.init(named: "Star.png")
            fallthrough
        case 4:
            fourStar.image = UIImage.init(named: "Star.png")
            fallthrough
        case 3:
            threeStar.image = UIImage.init(named: "Star.png")
            fallthrough
        case 2:
            twoStar.image = UIImage.init(named: "Star.png")
            fallthrough
        case 1:
            oneStar.image = UIImage.init(named: "Star.png")
        default:
            oneStar.image = UIImage.init(named: "Star.png")
        }
        
        numberOfReviewsLabel.text = "(" + String(productDetails.review?.count ?? 0) + ")"
        
        productImage.loadImageUsingURLString(urlString: productDetails.images?[0] ?? "")
        
        distributorImage.loadImageUsingURLString(urlString: productDetails.images?[0] ?? "")
        
    }
    
    @IBAction func addAction(_ sender: Any) {
        print(self.indentationLevel)
    }
}
