//
//  ListVoiceViewController.swift
//  TextToSpeak
//
//  Created by Sang on 12/30/19.
//  Copyright © 2019 SangNX. All rights reserved.
//

import UIKit

class ListVoiceViewController: BaseViewController {
    
    @IBOutlet weak var tbView: UITableView!
    private var dataShow: [SectionVoiceModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.getListVoices { (response) in
            self.dataShow = response
            self.tbView.delegate = self
            self.tbView.dataSource = self
        }
    }
    
    private func getListVoices(response: @escaping (([SectionVoiceModel]) -> Void)) {
        var arrListVoice: [SectionVoiceModel] = []
        listVoices.forEach { (item) in
            arrListVoice.append(SectionVoiceModel(fromDictionary: item))
        }
        response(arrListVoice)
    }
}

extension ListVoiceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataShow.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataShow[section].listVoices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = "Sangggg"
        return cell
    }
}
