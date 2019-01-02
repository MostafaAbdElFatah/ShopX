//
//  RoundedImage.swift
//  ShopX
//
//  Created by Mostafa AbdEl Fatah on 1/1/19.
//  Copyright © 2019 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {

    var showBorder:Bool = true {
        didSet{
            if self.showBorder {
                self.layer.borderWidth = CGFloat(3)
            }else{
                self.layer.borderWidth = CGFloat(0)
            }
        }
    }
    
    override func awakeFromNib() {
        
        
        self.layer.borderColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        // config shadow
        self.layer.cornerRadius = CGFloat(10)
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = true
    }

}
