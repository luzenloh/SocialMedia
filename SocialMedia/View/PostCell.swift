//
//  PostCell.swift
//  SocialMedia
//
//  Created by Danis Bagautdinov on 26.02.2025.
//

import UIKit
class PostCell: UITableViewCell {
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.cornerRadius = 30
        view.layer.shadowRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
//        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let postImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let postName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor(hex: "#212121FF")
        return label
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
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: "#757575FF")
        return label
    }()
    
    let postTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16, weight: .medium
        )
        textView.backgroundColor = .white
        textView.textColor = UIColor(hex: "#212121FF")
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.textAlignment = .natural
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        helpStack.addArrangedSubview(postImageView)
        helpStack.addArrangedSubview(postName)
        hStack.addArrangedSubview(helpStack)
        hStack.addArrangedSubview(dateLabel)
        mainStack.addArrangedSubview(hStack)
        mainStack.addArrangedSubview(postTextView)
        cellView.addSubview(mainStack)
        contentView.addSubview(cellView)
        
        
        
        NSLayoutConstraint.activate([
            // Констрейнты для cellView
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // КоmainStackнстрейнты для hStack
            mainStack.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 16),
            mainStack.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 8),
            mainStack.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -8),
            mainStack.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -16),
            
            hStack.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            postTextView.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            postTextView.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            
            
            // Констрейнты для изображения
            postImageView.widthAnchor.constraint(equalToConstant: 40),
            postImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setCell(ava: String, name: String, text: String) {
        postImageView.image = UIImage(named: ava) ?? UIImage(systemName: "person.circle")
        dateLabel.text = configDate()
        postName.text = name
        postTextView.text = text
    }
    
    private func configDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        return formatter.string(from: Date())
    }
}
