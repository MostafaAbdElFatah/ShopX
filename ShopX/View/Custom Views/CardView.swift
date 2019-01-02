//
//  CardView.swift
//  ShopX
//
//  Created by Mostafa AbdEl Fatah on 12/30/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) 
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
    }

}
