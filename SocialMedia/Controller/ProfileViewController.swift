//
//  ViewController.swift
//  SocialMedia
//
//  Created by Danis Bagautdinov on 25.02.2025.
//

import UIKit

class ProfileViewController: UIViewController {

    let userDanis: User = Danis
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createProfile(firstName: Danis.firstName, lastName: Danis.lastName, image: Danis.avatar)
    }


    //Creating Profile
    func createProfile(firstName: String, lastName: String, image: String) {
        let profStack = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .center
            stack.spacing = 10
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        
        let userImage = {
            let img = UIImageView()
            img.image = UIImage(named: image)
            img.contentMode = .scaleAspectFit
            img.clipsToBounds = true
            img.layer.cornerRadius = 60
            img.layer.borderWidth = 2
            img.layer.borderColor = UIColor(hex: "#3F51B5FF")?.cgColor
            img.translatesAutoresizingMaskIntoConstraints = false
            img.layer.shadowRadius = 8
            img.layer.shadowOpacity = 0.2
            img.widthAnchor.constraint(equalToConstant: 120).isActive = true
            img.heightAnchor.constraint(equalToConstant: 120).isActive = true
            return img
        }()
        
        let userName = {
            let label = UILabel()
            label.text = "\(firstName) \(lastName)"
            label.font = .systemFont(ofSize: 24, weight: .bold)
            label.textColor = UIColor(hex: "#212121FF")
            return label
        }()
        
        profStack.addArrangedSubview(userImage)
        profStack.addArrangedSubview(userName)
        
        view.addSubview(profStack)
        NSLayoutConstraint.activate([
            profStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            profStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}

