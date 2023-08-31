//
//  MainViewController.swift
//  Starship Game
//
//  Created by Демьян Горчаков on 05.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setViews()
        setConstraints()
    }
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "STARSHIP"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.shadowColor = .orange
        label.shadowOffset = CGSize(width: 3, height: 3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var toStartButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.tintColor = .black
        button.layer.cornerRadius = 20
        button.addTarget(nil, action: #selector(toStartGameView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func toStartGameView() {
        let gameViewController = GameViewController()
        gameViewController.modalPresentationStyle = .fullScreen
        present(gameViewController, animated: true)
    }
    
    private let toRecordsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("RECORDS", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.tintColor = .black
        button.layer.cornerRadius = 20
        button.addTarget(nil, action: #selector(toRecordView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func toRecordView() {
        let recordViewController = RecordViewController()
        recordViewController.modalPresentationStyle = .fullScreen
        present(recordViewController, animated: true)
    }
    
    private let toSettingButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("SETTING", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.tintColor = .black
        button.layer.cornerRadius = 20
        button.addTarget(nil, action: #selector(toSettingView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    @objc func toSettingView() {
        let settingViewController = SettingViewController()
        settingViewController.modalPresentationStyle = .fullScreen
        present(settingViewController, animated: true)
    }
    
    private func setViews() {
        view.addSubview(titleLabel)
        view.addSubview(toStartButton)
        view.addSubview(toRecordsButton)
        view.addSubview(toSettingButton)
    }
    
    @objc private func startGameTap() {
        let gameViewController = GameViewController()
        present(gameViewController, animated: true)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            toStartButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            toStartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toStartButton.widthAnchor.constraint(equalToConstant: 170),
            toStartButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            toRecordsButton.topAnchor.constraint(equalTo: toStartButton.bottomAnchor, constant: 50),
            toRecordsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toRecordsButton.widthAnchor.constraint(equalToConstant: 170),
            toRecordsButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            toSettingButton.topAnchor.constraint(equalTo: toRecordsButton.bottomAnchor, constant: 50),
            toSettingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toSettingButton.widthAnchor.constraint(equalToConstant: 170),
            toSettingButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

}
