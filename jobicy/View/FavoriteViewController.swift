//
//  FavoriteViewController.swift
//  jobicy
//
//  Created by Yaser on 2.04.2024.
//

import UIKit

class FavoriteViewController: UIViewController {

    private let viewModel = RemoteJobViewModel()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.loadFavorites()
        self.tableView.reloadData()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(JobTableViewCell.self, forCellReuseIdentifier: "JobCell")
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isUserInteractionEnabled = true
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        self.tableView.reloadData()
        
        
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        print(viewModel.getFavoriteJobs().count)
        return viewModel.getFavoriteJobs().count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobTableViewCell
        let job = viewModel.getFavoriteJobs()[indexPath.row]
        cell.configure(with: job)
        
        // Handle favorite button tap
        cell.favoriteButtonTapped = { [weak self] in
            if job.isFavorite! {
                self?.viewModel.removeFromFavorites(job)
                cell.updateFavoriteButtonImage(isFavorite: false)
                self?.tableView.reloadData()
                
                
            } else {
                self?.viewModel.addToFavorites(job)
                cell.updateFavoriteButtonImage(isFavorite: true)
                self?.tableView.reloadData()
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.rowHeight = UITableView.automaticDimension
        return 120
    }
}
