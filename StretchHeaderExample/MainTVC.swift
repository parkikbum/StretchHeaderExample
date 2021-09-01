//
//  MainTVC.swift
//  StretchHeaderExample
//
//  Created by 박익범 on 2021/08/29.
//

import UIKit

class MainTVC: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    static let identifier: String = "MainTVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.backgroundColor = UIColor.black
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
