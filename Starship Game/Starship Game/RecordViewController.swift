//
//  RecordViewController.swift
//  Starship Game
//
//  Created by Демьян Горчаков on 08.08.2023.
//

import UIKit

class RecordViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let idRecordTableViewCell = "idRecordTableViewCell"
    var arrayOfScore = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        scoreTableView.register(RecordTableViewCell.self, forCellReuseIdentifier: idRecordTableViewCell)
        setDelegate()
    }
    
    private let scoreTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "return.left"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setViews() {
        view.backgroundColor = .black
        view.addSubview(closeButton)
        view.addSubview(scoreTableView)
    }
    
    private func setDelegate() {
        scoreTableView.delegate = self
        scoreTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scoreTableView.dequeueReusableCell(withIdentifier: idRecordTableViewCell, for: indexPath) as! RecordTableViewCell
        var game  = GameViewController()
        cell.textLabel?.text = game.timerLabel.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 7),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            scoreTableView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10),
            scoreTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scoreTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scoreTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }    
}
