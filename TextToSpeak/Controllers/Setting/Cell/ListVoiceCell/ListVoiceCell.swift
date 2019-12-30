//
//  ListVoiceCell.swift
//  TextToSpeak
//
//  Created by Sang on 12/30/19.
//  Copyright © 2019 SangNX. All rights reserved.
//

import UIKit

protocol ListVoiceCellDelegate: class {
    func didSelectedVoiceCell(index: IndexPath)
}

class ListVoiceCell: UITableViewCell {

    
    @IBOutlet weak var imvPlaySound: UIImageView!
    @IBOutlet weak var lbl_Title: UILabel!
    
    weak var delegate: ListVoiceCellDelegate?
    private var index: IndexPath?
    private var item: VoiceModel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(index: IndexPath, item: VoiceModel) {
        self.index = index
        self.item = item
        lbl_Title.text = item.name
    }
    
    private func setupView() {
        
    }
}
