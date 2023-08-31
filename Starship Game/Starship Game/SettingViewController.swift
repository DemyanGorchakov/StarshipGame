//
//  SettingViewController.swift
//  Starship Game
//
//  Created by Демьян Горчаков on 08.08.2023.
//

import UIKit

class SettingViewController: UIViewController {
    
//    let userDefault = UserDefaults.standard
    let arrayComplixity = ["Легко","Нормально","Сложно"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }
    
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
    
    let choiceShipLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберете корабль"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var starshipGray: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "StarShip2")
        image.contentMode = .scaleAspectFit
        image.isHidden = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let starShipOrange: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "StarShip")
        image.contentMode = .scaleAspectFit
        image.isHidden = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let choiceStarshipButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Изменить", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(gray: 1, alpha: 0.5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(choiceStarShip), for: .touchDown)
        return button
    }()
    
    @objc func choiceStarShip() {
        UIView.animate(withDuration: 1) {
            if self.starShipOrange.isHidden {
                self.starShipOrange.isHidden = false
                self.starshipGray.isHidden = true
            } else {
                self.starShipOrange.isHidden = true
                self.starshipGray.isHidden = false
            }
        }
    }
    
    let choiceComplexityLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберете сложность"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let complexityLabel: UILabel = {
        let label = UILabel()
        label.text = "Легко"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let choiceComplexityButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Изменить", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(gray: 1, alpha: 0.5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(choiceComplexity), for: .touchDown)
        return button
    }()
    
    @objc func choiceComplexity() {
        if self.complexityLabel.text == self.arrayComplixity[0] {
            self.complexityLabel.text = self.arrayComplixity[1]
        } else {
            self.complexityLabel.text = self.arrayComplixity[2]
        }
    }
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("СОХРАНИТЬ", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(gray: 1, alpha: 0.5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveTap), for: .touchDown)
        return button
    }()
    
    @objc func saveTap() {
        let settingViewController = SettingViewController()
        self.dismiss(animated: true, completion: nil)
//        userDefault.set(starshipGray, forKey: "starshipGray")
//        userDefault.set(starshipGray, forKey: "starshipGray")
//        userDefault.set(complexityLabel, forKey: "complexityLabel")
    }
    
    private func setViews() {
        view.addSubview(choiceShipLabel)
        view.addSubview(closeButton)
        view.addSubview(starshipGray)
        view.addSubview(starShipOrange)
        view.addSubview(choiceStarshipButton)
        view.addSubview(choiceComplexityLabel)
        view.addSubview(complexityLabel)
        view.addSubview(choiceComplexityButton)
        view.addSubview(saveButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 7),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            choiceShipLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            choiceShipLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            starshipGray.topAnchor.constraint(equalTo: choiceShipLabel.bottomAnchor, constant: 30),
            starshipGray.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            starshipGray.heightAnchor.constraint(equalToConstant: 100),
            starshipGray.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            starShipOrange.topAnchor.constraint(equalTo: choiceShipLabel.bottomAnchor, constant: 30),
            starShipOrange.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            starShipOrange.heightAnchor.constraint(equalToConstant: 100),
            starShipOrange.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            choiceStarshipButton.topAnchor.constraint(equalTo: choiceShipLabel.bottomAnchor, constant: 150),
            choiceStarshipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choiceStarshipButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            choiceComplexityLabel.topAnchor.constraint(equalTo: choiceStarshipButton.bottomAnchor, constant: 50),
            choiceComplexityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            complexityLabel.topAnchor.constraint(equalTo: choiceComplexityLabel.bottomAnchor, constant: 30),
            complexityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            choiceComplexityButton.topAnchor.constraint(equalTo: complexityLabel.bottomAnchor, constant: 30),
            choiceComplexityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choiceComplexityButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: choiceComplexityButton.bottomAnchor, constant: 70),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
