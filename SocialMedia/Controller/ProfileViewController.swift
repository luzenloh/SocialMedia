//
//  ViewController.swift
//  SocialMedia
//
//  Created by Danis Bagautdinov on 25.02.2025.
//

import UIKit

class ProfileViewController: UIViewController {

    let users: [User] = [Danis]
    let posts: [Post] = demoPosts
    
    let profileView = UIView()
    var profStack = UIStackView()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createProfile(firstName: Danis.firstName, lastName: Danis.lastName, image: Danis.avatar)
        createPostsTable()
        createProfileView()
        
    }
    
    func createProfileView() {
        profileView.backgroundColor = UIColor(hex: "#E6E6FAFF")
        profileView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(profileView, at: 0)
        profileView.layer.cornerRadius = 30
        profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        profileView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        profileView.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
    }

    //Creating Profile
    func createProfile(firstName: String, lastName: String, image: String) {
        profStack = {
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
        
        let editButton = {
            let btn = UIButton()
            btn.setTitle("Edit", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.layer.cornerRadius = 12
            btn.backgroundColor = UIColor(hex: "#3F51B5FF")
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.widthAnchor.constraint(equalToConstant: 60).isActive = true
            btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
            return btn
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
        view.addSubview(editButton)
        NSLayoutConstraint.activate([
            profStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            profStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
    }
    
    func createPostsTable() {
        tableView = UITableView()
        tableView.register(PostCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundView = nil
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: profStack.bottomAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    
    
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PostCell {
            cell.setCell(ava: posts[indexPath.row].name, name: posts[indexPath.row].name, text: posts[indexPath.row].text)
            return cell
        }
        return UITableViewCell()
    }
    
    
}
