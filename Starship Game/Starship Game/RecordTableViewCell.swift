//
//  RecordsTableViewCell.swift
//  Starship Game
//
//  Created by Демьян Горчаков on 08.08.2023.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let backgoundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(backgoundCell)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgoundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgoundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgoundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgoundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
