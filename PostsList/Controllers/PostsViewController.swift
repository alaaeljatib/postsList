//
//  ViewController.swift
//  PostsList
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-12.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private let refreshControl = UIRefreshControl()
    
    private var posts : [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView(self.tableView)
    }
    
    private func setupTableView(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        
        // register Nibs
        let nib = UINib(nibName: postTableViewCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: postTableViewCellIdentifier)
        
        // refresh Control
        self.refreshControl.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
      
        if #available(iOS 10, *) {
            tableView.refreshControl = self.refreshControl
        } else {
            tableView.addSubview(self.refreshControl)
        }
    }
    
    @objc private func refreshControlAction() {
        ItemService.instance.getItems { [weak self] (success, item, error) in
            if success {
                self?.posts = item!.posts
                DispatchQueue.main.sync {
                self?.tableView.reloadData()
                self?.label.text = "Posts Updated"
                }
            } else {
                self?.label.text = error?.localizedDescription
            }
            DispatchQueue.main.sync {
            self?.refreshControl.endRefreshing()
            }
        }
    }
}

extension PostsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: postTableViewCellIdentifier) as? PostTableViewCell else {
        return UITableViewCell()
        }
        
        let post = posts[indexPath.row]
        
        cell.configureCell(withPostId: "\(post.id)", postName: post.title)
        
        return cell
    }
}

