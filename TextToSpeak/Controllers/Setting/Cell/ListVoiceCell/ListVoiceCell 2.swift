//
//  ListVoiceCell.swift
//  TextToSpeak
//
//  Created by Sang on 12/30/19.
//  Copyright © 2019 SangNX. All rights reserved.
//

import UIKit

protocol ListVoiceCellDelegate: class {
    func didSelectedVoiceCell(index: IndexPath, isPlay: Bool)
}

class ListVoiceCell: UITableViewCell {

    @IBOutlet weak var imvPlaySound: UIImageView!
    @IBOutlet weak var lbl_Title: UILabel!
    
    var isPlay: Bool! = false {
        didSet {
            imvPlaySound.image = isPlay ? #imageLiteral(resourceName: "pause") : #imageLiteral(resourceName: "play")
        }
    }
    
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
        isPlay = item.isPlaying
    }
    
    private func setupView() {
        
    }
    @IBAction func onTapPlaySound(_ sender: Any) {
        self.isPlay = !self.isPlay
        delegate?.didSelectedVoiceCell(index: self.index!, isPlay: self.isPlay)
    }
}
