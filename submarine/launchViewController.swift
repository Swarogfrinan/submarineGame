//
//  launchViewController.swift
//  submarine
//
//  Created by Ilya Vasilev on 26.01.2022.
//

import UIKit
import CoreMedia
var launchTimer = Timer()
var timerFishTimer = Timer()
var fishOneTimer = Timer()
var fishSecondTimer = Timer()
let button = UIButton()
class launchViewController: UIViewController {
//
//    func shouldAutorotate() -> Bool {
//            return true
//        }
//
//    func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
//            if shouldAutorotate {
//                return .portrait
//            } else {
//                return .all
//            }
//    }
    
    @IBOutlet weak var imageSubmarineView: UIImageView!
    @IBOutlet weak var boatImage: UIImageView!
    @IBOutlet weak var fishImage: UIImageView!
    @IBOutlet weak var fishSecondImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var fishOneImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerSubmarine()
        fishBigLaunch()
        imageSubmarineView.dropShadow()
//        fishSecondImage.dropShadow()
        playButton.dropShadow()
        fishSecondLaunch()
fishLaunchYellow()
        imageSubmarineView.isHidden = false
        chobluat()
//MARK: Let var
        
    }
    func chobluat() {
        var anotherSubmarineimg = UIImage(named: "meduza")
        self.imageSubmarineView.image = anotherSubmarineimg
    }
//   var imageSubmarineView = UIImage(named: "image")
    
    func timerSubmarine() {
//let imageSubmarine = UIImage(named: "image")
//        do {
        guard let imageSubmarine = UserDefaults.standard.value(forKey: "image") as? String else  {return}
        if let image = SettingsViewController.loadImage(fileName: imageSubmarine) {
            imageSubmarineView.image = image
        }
            
//            let imageFishTwoLaunch = UIImage(named: "FishTwo")
//            self.fishImage.image = imageFishTwoLaunch
//    }
//        }


//    self.imageSubmarineView.image = imageSubmarine
//        imageSubmarine.image = image

    launchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
        guard let imageSubmarine = UserDefaults.standard.value(forKey: "image") as? String else  {return}
        if let image = SettingsViewController.loadImage(fileName: imageSubmarine) {
            self.imageSubmarineView.image = image
            
UIView.animate(withDuration: 0.4) {
           self.imageSubmarineView.frame.origin.y -= 10
               UIView.animate(withDuration: 0.4) {
                   self.imageSubmarineView.frame.origin.x -= 10

               } completion: {_ in
                   UIView.animate(withDuration: 0.4) {
                       self.imageSubmarineView.frame.origin.y += 10
                       self.imageSubmarineView.frame.origin.x += 10 }
               }
               }
           }
    }
                                 )}
    func fishBigLaunch() {
    let imageFishTwoLaunch = UIImage(named: "FishTwo")
    self.fishImage.image = imageFishTwoLaunch
        launchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
UIView.animate(withDuration: 0.4) {
           self.fishImage.frame.origin.y -= 10
               UIView.animate(withDuration: 0.4) {
                   self.fishImage.frame.origin.x -= 10
                   
               } completion: {_ in
                   UIView.animate(withDuration: 0.4) {
                       self.fishImage.frame.origin.y += 10
                       self.fishImage.frame.origin.x += 10
                   }
                   
}
}
}
)}

    func fishSecondLaunch() {
    let imageSecond = UIImage(named: "FishSecond")
    self.fishSecondImage.image = imageSecond
        launchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
UIView.animate(withDuration: 0.4) {
           self.fishSecondImage.frame.origin.y -= 5
               UIView.animate(withDuration: 0.4) {
                   self.fishSecondImage.frame.origin.x -= 5

               } completion: {_ in
                   UIView.animate(withDuration: 0.4) {
                       self.fishSecondImage.frame.origin.y += 5
                       self.fishSecondImage.frame.origin.x += 5 }

}
}
}
)}

    func fishLaunchYellow() {
    let oneLaunch = UIImage(named: "fishOne")
    self.fishOneImage.image = oneLaunch
        launchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
UIView.animate(withDuration: 0.4) {
           self.fishOneImage.frame.origin.y -= 5
               UIView.animate(withDuration: 0.4) {
                   self.fishOneImage.frame.origin.x -= 5

} completion: {_ in
                   UIView.animate(withDuration: 0.4) {
                       self.fishOneImage.frame.origin.y += 5
                       self.fishOneImage.frame.origin.x += 5 }

}
}
}
 )}
    
    var counter : Int = 0
    @IBAction func playButtonPressed(_ sender: UIButton) {
        counter+=1
        switch counter % 2 {
        case 1 :
        UIView.animate(withDuration: 2) {
            self.imageSubmarineView.frame.origin.x += 300
            
        } completion: {_ in
            UIView.animate(withDuration: 1) {
            self.imageSubmarineView.isHidden = true
            self.imageSubmarineView.frame.origin.x -= 300
                self.imageSubmarineView.isHidden = false
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
          
        guard let controler = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {
            return
        
        }
                controler.modalTransitionStyle = .flipHorizontal
                controler.modalPresentationStyle = .fullScreen
           
                self.present (controler, animated: true, completion: nil)
        
            
    }
        default :
            break
    }
}
    @IBAction func menuButtonPressed(_ sender: UIButton) {
        guard let controler = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {
            return
        
        }
        controler.modalTransitionStyle = .crossDissolve
                controler.modalPresentationStyle = .fullScreen
           
                self.present (controler, animated: true, completion: nil)
    }

}
