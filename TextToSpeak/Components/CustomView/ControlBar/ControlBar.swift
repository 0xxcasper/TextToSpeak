//
//  ControlBar.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import Foundation
import UIKit

protocol ControlBarDelegate: class {
    func didTapPlayControlBar()
    func didTapPauseControlBar()
    func didTapClearControlBar()
    func didTapStopControlBar()
    func didTapMoreControlBar()
}

class ControlBar: BaseViewXib {
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    
    weak var delegate: ControlBarDelegate!
    var isEnable: Bool = false {
        didSet {
            if isEnable == true {
                btnPlay.isEnabled = true
                btnPlay.setTitleColor(UIColor.black, for: .normal)
                
                btnClear.isEnabled = true
                btnClear.setTitleColor(UIColor.black, for: .normal)
                
                btnMore.isEnabled = true
                btnMore.setTitleColor(UIColor.black, for: .normal)
            } else {
                btnPlay.isEnabled = false
                btnPlay.setTitleColor(UIColor.gray, for: .normal)
                
                btnClear.isEnabled = false
                btnClear.setTitleColor(UIColor.gray, for: .normal)
                
                btnMore.isEnabled = false
                btnMore.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    var isPlay: Bool = true {
        didSet {
            btnPlay.setImage( UIImage(named: isPlay ? "play" : "pause"), for: UIControl.State.normal)
            self.isStop = true
        }
    }
    
    var isStop: Bool = false {
        didSet {
            btnClear.setTitle( isStop ? "Stop": "Clear", for: UIControl.State.normal)
        }
    }
    
    override func setUpViews() {
        super.setUpViews()
        self.isEnable = false
    }
    
    @IBAction func didTapPlay(_ sender: UIButton) {
        if isPlay {
            delegate.didTapPlayControlBar()
        } else {
            delegate.didTapPauseControlBar()
        }
    }
    
    @IBAction func didTapMore(_ sender: UIButton) {
        delegate.didTapMoreControlBar()
    }
    
    @IBAction func didTapClear(_ sender: UIButton) {
        if isStop {
            delegate.didTapStopControlBar()
        } else {
            delegate.didTapClearControlBar()
        }
    }
}
