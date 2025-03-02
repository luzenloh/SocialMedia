//
//  FriendsViewController.swift
//  SocialMedia
//
//  Created by Danis Bagautdinov on 25.02.2025.
//

import UIKit

class FriendsViewController: UIViewController{


    var tableView = UITableView()
    
    var friends: [Friend] = Friends
    var filteredFriens = [Friend]()
    let searchController = UISearchController(searchResultsController: nil)
    var isSearching: Bool {
        return searchController.isActive && !(searchController.searchBar.text?.isEmpty ?? true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchController()
        createFriendsTable()
        
    }
    
    
    func createFriendsTable() {
        tableView.register(FriendCell.self, forCellReuseIdentifier: "friendCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundView = nil
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.separatorStyle = .singleLine
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."
        navigationItem.searchController = searchController
        navigationItem.title = "Friends"
        }

}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredFriens.count : friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as? FriendCell {
            let data = isSearching ? filteredFriens[indexPath.row] : friends[indexPath.row]
            cell.setCell(avatar: data.avatar, name: data.name)
            return cell
        }
        return UITableViewCell()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        
        if searchText.isEmpty {
            filteredFriens = friends
        } else {
            filteredFriens = friends.filter { $0.name.lowercased().contains(searchText) }
        }
        tableView.reloadData()
    }
}
