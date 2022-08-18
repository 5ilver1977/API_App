//
//  DetailViewViewController.swift
//  TableViewPersonalizado
//
//  Created by Alejandro Hernández López on 07/10/20.
//

import UIKit

class DetailViewViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var foto : Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idLabel.text = self.foto.title
        self.imageView.load(url: self.foto.getUrl()!)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
