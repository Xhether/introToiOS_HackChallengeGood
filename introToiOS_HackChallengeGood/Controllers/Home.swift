//
//  Home.swift
//  Sportify
//
//  Created by Charles Liggins on 11/27/23.
//

import UIKit
import SDWebImage

class Home: UIViewController{
    
    let dummyGames = [
        GameRepresentation(sportName: "Men's Tennis", homeTeam: "Cornell", awayTeam: "Columbia", homeScore: 7, awayScore: 1, location: "Ithaca, NY", schoolLogoURL: "https://gocolumbialions.com/images/2006/6/29/OUOOZIMNDSPNBAZ.20060630004034.gif?width=1920quality=80&format=gif", sportLogo: "PLACEHOLDER:Do we need this?", date: "Jan 30"),
        GameRepresentation(sportName: "Women's Basketball", homeTeam: "Cornell", awayTeam: "Dartmouth", homeScore: 123, awayScore: 94, location: "Ithaca, NY", schoolLogoURL: "https://1000logos.net/wp-content/uploads/2022/01/Dartmouth-Big-Green-logo.png", sportLogo: "PLACEHOLDER:Do we need this?", date: "Jan 23")
    ]
    
    let dummySports = [
        SportRepresentation(sport: "Tennis", roster: "PLACEHOLDER"),
        SportRepresentation(sport: "Basketball", roster: "PLACEHOLDER")
    ]
    
    private var collectionView1: UICollectionView!
    private var collectionView2: UICollectionView!
    private var appName = UILabel()
    private var CULogo = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      // title = "Cornell"

        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.orange
          
        setupCollectionViews()
    }
        
   
    
    // MARK: - Set Up Views
    
    private func setupCollectionViews() {
    
 //       let padding: CGFloat = 24
        
        // TODO: Set Up CollectionView
        let layout1 = UICollectionViewFlowLayout()
            layout1.scrollDirection = .vertical
            layout1.minimumLineSpacing = 16
            layout1.minimumInteritemSpacing = 16
        
        collectionView1 = UICollectionView(frame: .zero, collectionViewLayout: layout1)
        //collectionView1.register(SportCell.self, forCellWithReuseIdentifier: SportCell.reuse)
        collectionView1.register(HeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind:
                                    UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderCollectionReusableView.reuse)
        collectionView1.register(GameCell.self, forCellWithReuseIdentifier: GameCell.reuse) // 5
        collectionView1.delegate = self // 6
        collectionView1.dataSource = self // 7
             
        view.addSubview(collectionView1) // 3
        collectionView1.translatesAutoresizingMaskIntoConstraints = false // 4
        
        collectionView1.backgroundColor = UIColor.white
            NSLayoutConstraint.activate([
                collectionView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView1.topAnchor.constraint(equalTo: view.topAnchor),
                collectionView1.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    
//        // Horizontal Collection View
        let layout2 = UICollectionViewFlowLayout()
            layout2.scrollDirection = .horizontal
            layout2.minimumLineSpacing = 4
            layout2.minimumInteritemSpacing = 4
        
        collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        collectionView2.register(SportCell.self, forCellWithReuseIdentifier: SportCell.reuse)
        collectionView2.delegate = self // 6
        collectionView2.dataSource = self // 7
        collectionView2.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7.0)
        collectionView2.backgroundColor = UIColor.white
            NSLayoutConstraint.activate([
//                collectionView2.leadingAnchor.constraint(equalTo: collectionView1.leadingAnchor),
//                collectionView2.trailingAnchor.constraint(equalTo: collectionView1.trailingAnchor),
                ])
//
        //set up logo
        let dimension: CGFloat = 0.8/7
        //   let padding: CGFloat = 16
        CULogo.sd_setImage(with: URL(string: "https://logowik.com/content/uploads/images/cornell-university-c6291.logowik.com.webp"))
        view.addSubview(CULogo)
        CULogo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            CULogo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CULogo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            CULogo.topAnchor.constraint(equalTo: view.topAnchor,constant: 56),
            CULogo.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24),
            CULogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: dimension * 2 ),
            CULogo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: dimension * 2 )
            /*CULogo.bottomAnchor.constraint(equalTo: view.bottomAnchor)*/])
        
        //set up title
        appName.text = "Cornell Sportify"
        appName.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight(9))
        view.addSubview(appName)
        appName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appName.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appName.topAnchor.constraint(equalTo: view.topAnchor,constant: 84),
            appName.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 120)
            /*appName.bottomAnchor.constraint(equalTo: view.bottomAnchor)*/])

            
        
    }
}

// MARK: - UICollectionViewDelegate

extension Home: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension Home: UICollectionViewDataSource {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == collectionView1 {
                return dummyGames.count
            }
            return dummySports.count
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionView1{
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.reuse, for: indexPath) as?
                    GameCell{
                        let game = dummyGames[indexPath.item]
                        cell.configure(game: game)
                        return cell
                }
            return UICollectionViewCell()
        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportCell.reuse, for: indexPath) as? SportCell{
                          let sport = dummySports[indexPath.item]
                          cell.configure(sport: sport)
                          return cell
                      }
        return UICollectionViewCell()
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            //to change
            if collectionView == collectionView1 {
                return 1
            }
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            
            return UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        }
    }

    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    extension Home: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          
            let size = collectionView.frame.size
            return CGSize(width: size.width - 24,height: 86)
            
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            if collectionView == collectionView1 {
                if section == 0 {
                    return CGSize(width: view.frame.size.width,height: view.frame.size.width/8)
                }
            }
            return CGSize()
        }
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
                return collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderCollectionReusableView.reuse,
                    for: indexPath
                )}
    }



