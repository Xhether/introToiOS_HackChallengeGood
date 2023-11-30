//
//  SportCell.swift
//  Sportify
//
//  Created by Charles Liggins on 11/27/23.
//

import UIKit

class SportCell: UICollectionViewCell {
    private let sportTitle = UILabel()
    private let testtt = UILabel()
    
    
    //reuse
    static let reuse: String = "CreateSportCellReuse"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSportTitle(sportN: sportTitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(sport: SportRepresentation) {
        sportTitle.text = "\(sport.sport)"
    }
    
    func setupSportTitle(sportN: UILabel) {
        sportTitle.textColor = .label
        
        contentView.addSubview(sportTitle)
        sportTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 15
        NSLayoutConstraint.activate([
            sportTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            sportTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant:  120),
            sportTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            sportTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        ])
    }
}


