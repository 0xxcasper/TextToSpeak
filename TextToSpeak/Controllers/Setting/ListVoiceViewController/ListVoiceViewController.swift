//
//  ListVoiceViewController.swift
//  TextToSpeak
//
//  Created by Sang on 12/30/19.
//  Copyright © 2019 SangNX. All rights reserved.
//

import UIKit
import AVFoundation

class ListVoiceViewController: BaseViewController {
    @IBOutlet weak var tbView: UITableView!

    private let synthesizer = AVSpeechSynthesizer()
    private var dataShow: [SectionVoiceModel] = []
    private var previousIndex: IndexPath?
    private var currentIndex: IndexPath?
    var mContext: SettingViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        synthesizer.delegate = self
        self.tbView.delegate = self
        self.tbView.dataSource = self
        self.tbView.registerXibFile(ListVoiceCell.self)
        self.getListVoices { (response) in
            self.dataShow = response
            self.tbView.reloadData()
        }
    }
    
    private func getListVoices(response: @escaping (([SectionVoiceModel]) -> Void)) {
        var arrListVoice: [SectionVoiceModel] = []
        listVoices.forEach { (item) in
            arrListVoice.append(SectionVoiceModel(fromDictionary: item))
        }
        response(arrListVoice)
    }
    
    //Helper function
    private func makeSpeak(_ index: IndexPath) {
        guard let list_voice = self.dataShow[index.section].listVoices, let indentify = list_voice[index.row].voice else {
            return
        }
        self.makeSound(indentify: indentify, text: self.dataShow[index.section].hello + list_voice[index.row].name)
    }
    
    private func makeSound(indentify: String, text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(identifier: indentify)
        utterance.rate = 0.4
        if(synthesizer.isSpeaking && previousIndex != nil) {
            guard let cell = tbView.cellForRow(at: previousIndex!) as? ListVoiceCell else { return }
            cell.isPlay = false
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        }
        synthesizer.speak(utterance)
    }
    
    private func stopSpeak() {
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        previousIndex = nil
    }
}

//MARK: -UITableViewDelegate's Method

extension ListVoiceViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataShow.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataShow[section].listVoices.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataShow[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ListVoiceCell.self, for: indexPath)
        cell.setupCell(index: indexPath, item: dataShow[indexPath.section].listVoices[indexPath.row])
        cell.delegate = self
        return cell
    }
    
}

//MARK: -ListVoiceCellDelegate's Method
extension ListVoiceViewController: ListVoiceCellDelegate {
    func selectedCell(index: IndexPath) {
        let voiceCode = dataShow[index.section].listVoices[index.row].voice
        let nameVoice = dataShow[index.section].listVoices[index.row].name + " - " + dataShow[index.section].title

        self.dismiss(animated: true) {
            UserDefaultHelper.shared.voiceCode = voiceCode
            UserDefaultHelper.shared.nameVoice = nameVoice
            self.mContext?.reloadData()
        }
    }
    
    func didSelectedVoiceCell(index: IndexPath, isPlay: Bool) {
        previousIndex = synthesizer.isSpeaking ? currentIndex : nil
        currentIndex = index
        isPlay ? (makeSpeak(index)) : (stopSpeak())
    }
}

//MARK: -AVSpeechSynthesizerDelegate's Method
extension ListVoiceViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        if(previousIndex == nil && currentIndex != nil) {
            guard let cell = tbView.cellForRow(at: currentIndex!) as? ListVoiceCell else { return }
            cell.isPlay = false
        }
        previousIndex = nil
    }
}
