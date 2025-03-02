//
//  FriendTableViewCell.swift
//  SocialMedia
//
//  Created by Danis Bagautdinov on 27.02.2025.
//

import UIKit
import Kingfisher

class FriendCell: UITableViewCell {

    let friendImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 30
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let friendName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor(hex: "#212121FF")
        return label
    }()
    
    let textButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Написать", for: .normal)
        btn.backgroundColor = UIColor(hex: "#3F51B5FF")
        btn.layer.cornerRadius = 12
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let helpStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()
    
    let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setupViews() {
        
        helpStack.addArrangedSubview(friendImageView)
        helpStack.addArrangedSubview(friendName)
        mainStack.addArrangedSubview(helpStack)
        mainStack.addArrangedSubview(textButton)
        contentView.addSubview(mainStack)
        
        NSLayoutConstraint.activate([

            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            textButton.widthAnchor.constraint(equalToConstant: 100),
            textButton.heightAnchor.constraint(equalToConstant: 40),
            friendImageView.widthAnchor.constraint(equalToConstant: 60),
            friendImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setCell(avatar: String, name: String) {
        friendImageView.kf.setImage(
                with: URL(string: avatar),
                completionHandler: { result in
                    switch result {
                    case .success: return
                    case .failure: self.friendImageView.image = UIImage(systemName: "person.circle")
                    }
                }
            )
        friendName.text = name
    }
}
