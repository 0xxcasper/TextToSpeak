//
//  ControlTableViewCell.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import UIKit
import AVFoundation

enum ControlType {
    case rate
    case pitch
}

protocol ControlTableViewCellDelegate: class {
    func onChangeSLider()
}

class ControlTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var bgView: UIView!
    
    weak var delegate: ControlTableViewCellDelegate?
    
    var type: ControlType! = .rate {
        didSet {
            lblTitle.text = type == .rate ? "Rate" : "Pitch"
            slider.minimumValue = type == .rate ? AVSpeechUtteranceMinimumSpeechRate : 0.5
            slider.maximumValue = type == .rate ? AVSpeechUtteranceMaximumSpeechRate : 2
            
            slider.value = type == .rate ? (UserDefaultHelper.shared.rate ?? AVSpeechUtteranceDefaultSpeechRate)
                                         : (UserDefaultHelper.shared.pitch ?? 1)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.addShadowBottom()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didSlider(_ sender: UISlider) {
        if type == .rate {
            UserDefaultHelper.shared.rate = sender.value
        } else {
            UserDefaultHelper.shared.pitch = sender.value
        }
        
        delegate?.onChangeSLider()
    }
}
