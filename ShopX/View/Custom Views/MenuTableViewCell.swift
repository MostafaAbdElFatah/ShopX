//
//  MenuTableViewCell.swift
//  ShopX
//
//  Created by Mostafa AbdEl Fatah on 12/30/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialActivityIndicator

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var storeBgImageView: RoundedImage!
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storePointsLabel: UILabel!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var giftImageView: CircleView!
    @IBOutlet weak var giftMessageLabel: UILabel!
    @IBOutlet weak var giftNameUnlockedLabel: UILabel!
    @IBOutlet weak var giftNameLabel: UILabel!
    @IBOutlet weak var redeemNowLabel: UILabel!
    @IBOutlet weak var verticalStack: UIStackView!
    var progressView:MDCActivityIndicator!
    
    override func awakeFromNib() {
        progressView = MDCActivityIndicator()
        progressView.sizeToFit()
        progressView.strokeWidth =  6.5
        progressView.indicatorMode = .indeterminate
        progressView.cycleColors = [#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)]
        self.verticalStack.addSubview(progressView)
        // To make the activity indicator appear:
        progressView.startAnimating()
    }
    
    func configCell(store:Store, gift:Gift) {
        // Configure the cell...
        if let imageData = try? Data(contentsOf: URL(string: store.image)! ){
            self.storeImageView.image = UIImage(data: imageData)
            
        }
        if let bgImageData = try? Data(contentsOf: URL(string: store.bgimage)!){
            self.storeBgImageView.image = UIImage(data: bgImageData)
        }
        self.storeNameLabel.text = store.name
        self.storePointsLabel.text = "\(store.points) points"
        if store.points >= gift.points {
            self.giftImageView.isHidden = false
            self.giftNameUnlockedLabel.isHidden = false
            self.redeemNowLabel.isHidden = false
            self.giftNameLabel.isHidden = true
            self.progressView.isHidden = true
            self.giftNameUnlockedLabel.text = gift.name
            self.giftMessageLabel.text = "You have unlocked"
            self.storeBgImageView.showBorder = true
        }else {
            self.giftImageView.isHidden = true
            self.giftNameUnlockedLabel.isHidden = true
            self.redeemNowLabel.isHidden = true
            self.giftNameLabel.isHidden = false
            self.progressView.isHidden = false
            self.giftNameLabel.text = gift.name
            self.giftMessageLabel.text = "next gift"
            self.storeBgImageView.showBorder = false
        }
    }
}
