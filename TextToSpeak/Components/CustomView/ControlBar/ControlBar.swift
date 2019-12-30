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
    func didTapClearControlBar()
    func didTapMoreControlBar()
}

class ControlBar: BaseViewXib {
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    
    weak var delegate: ControlBarDelegate!
    
    @IBAction func didTapPlay(_ sender: UIButton) {
        delegate.didTapPlayControlBar()
    }
    
    @IBAction func didTapMore(_ sender: UIButton) {
        delegate.didTapMoreControlBar()
    }
    
    @IBAction func didTapClear(_ sender: UIButton) {
        delegate.didTapClearControlBar()
    }
}
