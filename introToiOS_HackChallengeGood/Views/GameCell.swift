//
//  GameCell.swift
//  Sportify
//
//  Created by Charles Liggins on 11/27/23.
//

import UIKit
import SDWebImage

class GameCell: UICollectionViewCell {
    
    private let homeTitle = UILabel()
    private let awayTitle = UILabel()
    private let gameLogo = UIImageView()
    
    
    //reuse
    static let reuse: String = "CreatePostCollectionViewCellReuse"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupGameTitle(game: homeTitle)
        setupAwayTitle(away: awayTitle)
        setGameImage(image: gameLogo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(game: GameRepresentation) {
    //    backgroundColor = UIColor.gray
        homeTitle.text = "\(game.sportName) vs. "
        awayTitle.text = "\(game.awayTeam)"
        gameLogo.sd_setImage(with: URL(string: game.schoolLogoURL))
    }
    func setGameImage(image: UIImageView){
        gameLogo.layer.cornerRadius = 10
        gameLogo.layer.masksToBounds = true
        gameLogo.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(gameLogo)
        
        let dimension: CGFloat = 0.8/7
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            gameLogo.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: dimension * 2 ),
            gameLogo.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: dimension * 2 ),
            gameLogo.topAnchor.constraint(equalTo: contentView.topAnchor,constant: padding),
            gameLogo.rightAnchor.constraint(equalTo: homeTitle.leftAnchor, constant: padding),
            gameLogo.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding)
        ])
    }
    
    
    func setupGameTitle(game: UILabel) {
        homeTitle.textColor = .label
        
        contentView.addSubview(homeTitle)
        homeTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 16
        NSLayoutConstraint.activate([
            homeTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            homeTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant:  120),
            homeTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            homeTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        ])
    }
    
    func setupAwayTitle(away: UILabel) {
        awayTitle.textColor = .label
        
        contentView.addSubview(awayTitle)
        awayTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 16
        NSLayoutConstraint.activate([
            awayTitle.topAnchor.constraint(equalTo: homeTitle.topAnchor, constant: padding),
            awayTitle.leftAnchor.constraint(equalTo: homeTitle.leftAnchor,constant:  0),
            awayTitle.trailingAnchor.constraint(equalTo: homeTitle.trailingAnchor, constant: -padding),
            awayTitle.leadingAnchor.constraint(equalTo: homeTitle.leadingAnchor, constant: padding)
        ])
    }
}

