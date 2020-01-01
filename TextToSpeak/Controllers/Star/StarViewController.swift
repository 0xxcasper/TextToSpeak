//
//  StarViewController.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import UIKit
import AVFoundation

class StarViewController: UIViewController {

    @IBOutlet weak var tbView: UITableView!
    private var data: [HistoryModel] = []
    let synthesizer = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    private func setupView() {
        tbView.delegate = self
        tbView.dataSource = self
        tbView.rowHeight = 60
        tbView.separatorStyle = .none
        tbView.registerXibFile(TextTableViewCell.self)
    }
    func reloadData() {
        getAllData()
        tbView.reloadData()
    }
    
    func getAllData() {
        data = Array(HistoryModel.getAll())
        data.reverse()
        data = data.filter { (item) -> Bool in
            return item.isStar == true
        }
    }
}


extension StarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeue(TextTableViewCell.self, for: indexPath)
        cell.delegate = self
        cell.lblTitle.text = data[indexPath.row].text
        cell.isSelectedStar = data[indexPath.row].isStar
        return cell
    }
    
}

extension StarViewController: TextTableViewCellDelegate {
    func didTapCell(_ index: Int) {
        let text = data[index].text
        let utterance = text.configAVSpeechUtterance()
        if(synthesizer.isSpeaking) {
            synthesizer.stopSpeaking(at: .immediate)
        }
        synthesizer.speak(utterance)
    }
    
    func didTapStarCell(_ index: Int) {
        self.data[index].edit()
        self.tbView.reloadData()
    }
}
