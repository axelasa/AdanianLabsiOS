//
//  PixaBayTableViewCell.swift
//  AdanianLabsTestiOS
//
//  Created by Axel Asa on 22/05/2022.
//

import UIKit

class PixaBayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var picsView: UIImageView!
    
    func configure(TagsLabels:String,UsersLabels:String,PicsView:UIImage){
        tagsLabel.text = TagsLabels
        userLabel.text = UsersLabels
        picsView.image = PicsView
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//    }

}
