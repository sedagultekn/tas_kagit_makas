//
//  game_skor_viewController.swift
//  seda_gultekin_tas_kagit_makas
//
//  Created by Seda Gültekin on 9.07.2023.
//

import UIKit

class game_skor_viewController: UIViewController {
    @IBOutlet weak var seninSeciminView: UIImageView!
    @IBOutlet weak var bilgisayarinSecimiView: UIImageView!
    var imageArray = [UIImage(named: "tas_image"), UIImage(named: "kagit_image"), UIImage(named: "makas_image")]
    override func viewDidLoad() {
       
        super.viewDidLoad()
      
        bilgisayarinSecimiView.image = bilgisayarinSecimiView.image
       
      
    }

}
