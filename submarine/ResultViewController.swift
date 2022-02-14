//
//  ResultViewController.swift
//  submarine
//
//  Created by Ilya Vasilev on 14.02.2022.
//

import UIKit



class ResultViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var dateLabelOne: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //загрузка времени забега
        if let strOut = UserDefaults.standard.string(forKey: "name") {
            print(strOut)
            dateLabelOne.text = strOut
        }
        
//загрузка результатов забега
guard let quantity = UserDefaults.standard.value(forKey: "quantity") as? String else  {return}
resultLabel.text = "Твой счёт последний счёт \(quantity)"
    }
    let data = Data()
    
}
