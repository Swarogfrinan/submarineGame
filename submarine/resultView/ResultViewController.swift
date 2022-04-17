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
    
    let strOut = UserDefaults.standard.string(forKey: "name")
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
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
}
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultViewController", for: indexPath) as? ResultViewController else { return UITableViewCell() }
            guard let results = results else { return UITableViewCell() }
            let result = results[indexPath.row]
            cell.configure(
                name: result.name,
                score: "\(result.score)",
                date: result.date
                )
            return cell
            
        }
    }
    
}
