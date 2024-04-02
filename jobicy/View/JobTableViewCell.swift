//
//  JobTableViewCell.swift
//  jobicy
//
//  Created by Yaser on 2.04.2024.
//

import UIKit
import SnapKit
import AlamofireImage

class JobTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0

        return label
    }()
    private let companyNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0

        return label
    }()
    private let companyLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(companyNameLabel)
        addSubview(companyLogoImageView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalTo(companyLogoImageView.snp.leading).offset(-8)
        }
                
        companyNameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalTo(companyLogoImageView.snp.leading).offset(-8)
            make.bottom.equalToSuperview().offset(-8)
        }
                
        companyLogoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(with job: job) {
        titleLabel.text = job.jobTitle
        companyNameLabel.text = job.companyName
        
        if let imageUrl = URL(string: job.companyLogo) {
            companyLogoImageView.af.setImage(withURL: imageUrl)
        }
        
    }

}
