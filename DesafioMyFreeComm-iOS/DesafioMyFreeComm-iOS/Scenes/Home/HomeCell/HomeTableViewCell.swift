//
//  HomeTableViewCell.swift
//  DesafioMyFreeComm-iOS
//
//  Created by Hundily Cerqueira Silva on 28/04/19.
//  Copyright © 2019 Hundily Cerqueira Silva. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelNewRepository: UILabel!
    @IBOutlet weak var labelRepositoryDiscription: UILabel!
    @IBOutlet weak var labelNumberForks: UILabel!
    @IBOutlet weak var labelNumberStart: UILabel!
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelNameUser: UILabel!
    @IBOutlet weak var labelUserNameAndLastName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageAvatar.layer.cornerRadius = 40
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
