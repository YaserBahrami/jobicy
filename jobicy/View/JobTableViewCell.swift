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
    
    private let cardView = UIView()
    
    private var isFavorite = false
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    private let companyNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    private let companyLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "empty_star_icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Callback closure for favorite button action
    var favoriteButtonTapped: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(companyNameLabel)
        cardView.addSubview(companyLogoImageView)
        cardView.addSubview(favoriteButton)
        
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 8
        cardView.layer.masksToBounds = true
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardView.layer.shadowRadius = 2
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.masksToBounds = false
        cardView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cardView.layer.cornerRadius).cgPath
        
        
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        
        companyLogoImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(companyLogoImageView.snp.trailing).offset(8)
            make.trailing.equalTo(favoriteButton.snp.leading).offset(-8)
        }
        
        companyNameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
    }
    
    private func setupActions() {
        favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Action
    
    @objc private func favoriteButtonAction() {
        favoriteButtonTapped?()
    }
    
    func updateFavoriteButtonImage(isFavorite: Bool) {
        let imageName = isFavorite ? "filled_star_icon" : "empty_star_icon"
        favoriteButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func configure(with job: Job) {
        titleLabel.text = job.jobTitle
        companyNameLabel.text = job.companyName
        
        if let imageUrl = URL(string: job.companyLogo) {
            companyLogoImageView.af.setImage(withURL: imageUrl)
        }
        
        let starImageName = job.isFavorite ?? false ? "filled_star_icon" : "empty_star_icon"
        self.isFavorite = job.isFavorite ?? false
        favoriteButton.setImage(UIImage(named: starImageName), for: .normal)

        
        
    }
    
}
