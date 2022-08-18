//
//  TableViewCell.swift
//  API_App
//
//  Created by usuario on 17/8/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var imagen: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.card.clipsToBounds = true
        self.card.layer.cornerRadius = 15
        self.card.backgroundColor = UIColor.darkGray
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
