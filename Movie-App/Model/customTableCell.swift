//
//  customCellView.swift
//  Movie-App
//
//  Created by Youssef Ahab on 11/09/2022.
//

import UIKit

class customTableCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var favourite: UIButton!
    @IBOutlet weak var cellView: customTableCellView!
}
