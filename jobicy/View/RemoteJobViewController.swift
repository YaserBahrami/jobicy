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
    
    private var jobs: [Job] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Start")
        setupTableView()
        fetchJobs()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(JobTableViewCell.self, forCellReuseIdentifier: "JobCell")
        tableView.tableFooterView = UIView()
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Enable automatic row height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200 // Adjust the estimated row height as needed
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func fetchJobs() {
        
        viewModel.fetchJobs { [weak self] in
            self?.tableView.reloadData()
        }
        
    }
}

extension RemoteJobViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        print(viewModel.numberOfJobs)
        return viewModel.numberOfJobs
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobTableViewCell
            let job = viewModel.job(at: indexPath.row)
            print(job)
            cell.configure(with: job)
            return cell
        }
}
