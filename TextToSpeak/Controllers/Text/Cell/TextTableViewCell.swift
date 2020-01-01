//
//  TextTableViewCell.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import UIKit

protocol TextTableViewCellDelegate: class {
    func didTapCell(_ index: Int)
    func didTapStarCell(_ index: Int)
}

class TextTableViewCell: UITableViewCell {
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    
    weak var delegate: TextTableViewCellDelegate!
    var isSelectedStar: Bool = false {
        didSet {
            btnStar.setImage(UIImage(named: isSelectedStar ? "star.fill" : "star"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewBg.addShadowBottom()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTapCell(_ sender: UIButton) {
        if let indexP = indexPath {
            delegate.didTapCell(indexP.row)
        }
    }
    
    @IBAction func didTapStar(_ sender: UIButton) {
        if let indexP = indexPath {
            delegate.didTapStarCell(indexP.row)
        }
    }
}
