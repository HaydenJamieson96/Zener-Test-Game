//
//  ViewController.swift
//  Zener-Test-Game
//
//  Created by Hayden Jamieson on 03/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    var allCards = [CardViewController]()

    @IBOutlet weak var cardContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCards()
    }

    @objc
    func loadCards() {
        for card in allCards {
            card.view.removeFromSuperview()
            card.removeFromParentViewController()
        }
        
        allCards.removeAll(keepingCapacity: true)
        
        let positions = [
            CGPoint(x: 75, y: 85),
            CGPoint(x: 185, y: 85),
            CGPoint(x: 295, y: 85),
            CGPoint(x: 405, y: 85),
            CGPoint(x: 75, y: 235),
            CGPoint(x: 185, y: 235),
            CGPoint(x: 295, y: 235),
            CGPoint(x: 405, y: 235)
        ]
        
        let circle = UIImage(named: "cardCircle")!
        let cross = UIImage(named: "cardCross")!
        let lines = UIImage(named: "cardLines")!
        let square = UIImage(named: "cardSquare")!
        let star = UIImage(named: "cardStar")!
        
        var images = [circle, circle, cross, cross, lines, lines, square, star]
        images = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: images) as! [UIImage]
        
        for (index, position) in positions.enumerated() {
            // loop over each card pos and create new card view controller
            let card = CardViewController()
            card.delegate = self
            
            // use view controller containment and add cards view to our cardContainer view
            addChildViewController(card)
            cardContainer.addSubview(card.view)
            card.didMove(toParentViewController: self)
            
            // position card appropriately and give it image from array
            card.view.center = position
            card.front.image = images[index]
            
            // if we just gave the new card the star image, mark as correct answer
            if card.front.image == star {
                card.isCorrect = true
            }
            
            // add new card vc to array for easier tracking
            allCards.append(card)
        }
        view.isUserInteractionEnabled = true
    }
    
    func cardTapped(_ tapped: CardViewController) {
        guard view.isUserInteractionEnabled == true else {return}
        view.isUserInteractionEnabled = false
        
        for card in allCards {
            if card == tapped {
                card.wasTapped()
                card.perform(#selector(card.wasntTapped), with: nil, afterDelay: 1)
            } else {
                card.wasntTapped()
            }
        }
        
        perform(#selector(loadCards), with: nil, afterDelay: 2)
    }
    
   

}

