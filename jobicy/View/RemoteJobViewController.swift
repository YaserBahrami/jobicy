//
//  RemoteJobViewController.swift
//  jobicy
//
//  Created by Yaser on 1.04.2024.
//

import UIKit

class RemoteJobViewController: UIViewController {
    
    private let viewModel = RemoteJobViewModel()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchJobs()
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
        
        
    }
    
    private func fetchJobs() {
        
        viewModel.fetchJobs { [weak self] in
            self?.tableView.reloadData()
        }
        
    }
}

extension RemoteJobViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.numberOfJobs
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobTableViewCell
        let job = viewModel.job(at: indexPath.row)
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
