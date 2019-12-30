//
//  BaseViewXib.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import Foundation
import UIKit

class BaseViewXib: UIView {
    
    var view: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }

    func loadViewFromNib() {
        let nibName     = String(describing: type(of: self))
        let nib         = UINib(nibName: nibName, bundle: nil)
        guard let view        = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame      = bounds
        addSubview(view)
        view.fillVerticalSuperview()
        view.fillHorizontalSuperview()
        self.view = view
        setUpViews()
    }

    func setUpViews() {
        
    }
}
