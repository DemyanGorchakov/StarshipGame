//
//  GameViewController.swift
//  Starship Game
//
//  Created by Демьян Горчаков on 05.08.2023.
//

import UIKit

class GameViewController: UIViewController {
    
//    let userDefault = UserDefaults.standard
    var timer: Timer?
    var isGameOver = false
    var gameTimer: Timer?
    var seconds = 0
    var timeIntervalGame = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        applySetting()
        setViews()
        setConstraint()
        attackEnemy()
        goTimer()
        gameTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(attackEnemy), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: timeIntervalGame, target: self, selector: #selector(goTimer), userInfo: nil, repeats: true)
    }
    
//    func applySetting() {
//        starShip.image = userDefault.object(forKey: "starshipGray") as? UIImage
//        starShip.image = userDefault.object(forKey: "starshipGray") as? UIImage
//    }
    
    @objc func attackEnemy() {
        UIView.animateKeyframes(withDuration: 5, delay: 0.0, options: .repeat) {
            self.enemy.frame = CGRect(x: Int.random(in: 50...300), y: -150, width: 90, height: 90)
            self.enemy.frame.origin.y = self.view.bounds.height
        }
    }
    
    private let backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Space")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let enemy: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: Int.random(in: 50...300), y: 0, width: 90, height: 90)
        image.image = UIImage(named: "Enemy")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "return.left"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    let timerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func goTimer() {
        seconds += 1
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }

    var starShip: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 170, y: 720, width: 50, height: 50)
        image.image = UIImage(named: "StarShip")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let toLeftButtom: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("LEFT", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveLeft), for: .touchDown)
        return button
    }()
    
    @objc private func moveLeft() {
        UIView.animate(withDuration: 0.3) {
            self.starShip.frame.origin.x -= 30
        }
    }
        
    private let toRightButtom: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("RIGHT", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveRight), for: .touchDown)
        return button
    }()
    
    @objc private func moveRight() {
        UIView.animate(withDuration: 0.3) {
            self.starShip.frame.origin.x += 30
        }
    }
        
    private func setViews() {
        view.addSubview(backgroundView)
        view.addSubview(closeButton)
        view.addSubview(timerLabel)
        view.addSubview(starShip)
        view.addSubview(toLeftButtom)
        view.addSubview(toRightButtom)
        view.addSubview(enemy)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 7),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            timerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            timerLabel.heightAnchor.constraint(equalToConstant: 30),
            timerLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            toLeftButtom.topAnchor.constraint(equalTo: starShip.bottomAnchor, constant: 0),
            toLeftButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toLeftButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            toLeftButtom.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            toRightButtom.topAnchor.constraint(equalTo: starShip.bottomAnchor, constant: 0),
            toRightButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            toRightButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            toRightButtom.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}
