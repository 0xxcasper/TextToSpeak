//
//  UITableView+Extention.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        self.register(T.self, forCellReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func registerXibFile<T: UITableViewCell>(_ type: T.Type) {
        self.register(UINib(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
    }
    
    func register(header: UITableViewHeaderFooterView.Type) {
        self.register(header.self, forHeaderFooterViewReuseIdentifier: String(describing: header.self))
    }
    
    func registerHeaderFooterView(header: UITableViewHeaderFooterView.Type, fromNib: Bool = true) {
        if fromNib {
            self.register(UINib(nibName: header.className, bundle: nil), forHeaderFooterViewReuseIdentifier: header.identifier)
        } else {
            self.register(header.self, forHeaderFooterViewReuseIdentifier: header.identifier)
        }
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self),
                                             for: indexPath) as? T
            else { fatalError("Could not deque cell with type \(T.self)") }
        return cell
    }
    
    func dequeueCell(reuseIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    func dequeue<T: UITableViewHeaderFooterView>(header: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as! T
    }
}

extension UITableViewHeaderFooterView {
    static var className: String {
        return String(describing: self)
    }
}

extension UIResponder {
    
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
}

extension UITableViewCell {
    
    var tableView: UITableView? {
        return next(UITableView.self)
    }
    
    var indexPath: IndexPath? {
        return tableView?.indexPath(for: self)
    }
}
