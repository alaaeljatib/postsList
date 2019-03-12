//
//  PostTableViewCell.swift
//  PostsList
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-12.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    

    func configureCell(withPostId firstLabel: String, postName secondLabel: String) {
        self.firstLabel.text = firstLabel
        self.secondLabel.text = secondLabel
    }
    
}
