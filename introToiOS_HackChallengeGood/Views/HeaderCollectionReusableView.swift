//
//  HeaderCollectionReusableView.swift
//  SportifyApp
//
//  Created by Charles Liggins on 11/29/23.
//

import UIKit
import SwiftUI

class HeaderCollectionReusableView: UICollectionReusableView {
    private let head: UILabel = {
        let head = UILabel()
        head.text = "Current Events"
        head.font = UIFont.systemFont(ofSize: 27, weight: UIFont.Weight(6))
        head.contentMode = .scaleAspectFill
        head.clipsToBounds = true
      //  head.translatesAutoresizingMaskIntoConstraints = false
        return head
    }()
    
    static let reuse = "HeaderCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(head)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        head.frame = bounds
    }
    
    func setupHead() {
        
    }
    
}
