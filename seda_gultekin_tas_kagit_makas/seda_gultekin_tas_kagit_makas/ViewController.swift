//
//  ViewController.swift
//  seda_gultekin_tas_kagit_makas
//
//  Created by Seda Gültekin on 7.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tas_button2: UIButton!
    @IBOutlet weak var kagit_button2: UIButton!
    @IBOutlet weak var makas_button2: UIButton!
    @IBOutlet weak var yourScore: UILabel!
    
    @IBOutlet weak var computerScore: UILabel!
    var yourScoreInt : Int = 0
    var computerScoreInt :Int = 0
    var sayi = 0
    var tas_button_num = 0
    var kagit_button_num = 0
    var makas_button_num = 0
    var bilgisayarSecimi = Int(UserDefaults.standard.string(forKey: "bilgisayarSecimi") ?? "tas_image")
    let imageArray = [UIImage(named: "tas_image"), UIImage(named: "kagit_image"), UIImage(named: "makas_image")]
    @IBOutlet weak var Imlec: UIActivityIndicatorView!
    override func viewDidLoad() {
       
        super.viewDidLoad()
      
       
       
      
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
            if let destinationVC = segue.destination as? game_skor_viewController {
            
                destinationVC.bilgisayarinSecimiView?.image = imageView.image
                
            
        }
    }


    
    @IBAction func ActivityIndicator(){
        if sayi == 0 {
            Imlec.startAnimating()
            sayi=1
        }
        else
        {
            Imlec.stopAnimating()
            sayi=0
        }
        
    }
    @IBAction func tas_button(_ sender: Any) {
        ActivityIndicator()
        kagit_button_num = 1
        kagit_button2.isEnabled = false
        makas_button2.isEnabled = false
        kagit_button2.layer.shadowColor = UIColor.black.cgColor
        tas_button2.layer.shadowOpacity = 0.5
        tas_button2.layer.shadowRadius = 4
        self.showRandomImage()
        if bilgisayarSecimi == 0 {
            tas_button2.isEnabled = true
            kagit_button2.isEnabled = true
            makas_button2.isEnabled = true
            tas_button2.layer.shadowOpacity = 0.0
            tas_button2.layer.shadowRadius = 0
        }
        else if bilgisayarSecimi == 1{
            computerScoreInt += 1
            computerScore.text = String(computerScoreInt)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.performSegue(withIdentifier: "game_skore_segue", sender: self)
                
            }
                
                
        }
        else if bilgisayarSecimi == 2{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                self.yourScoreInt += 1
                self.yourScore.text = String(self.yourScoreInt)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.performSegue(withIdentifier: "game_skore_segue", sender: self)
            }
        }
        
    }
    
    @IBAction func kagit_button(_ sender: Any) {
        ActivityIndicator()
        kagit_button_num = 1
        tas_button2.isEnabled = false
        makas_button2.isEnabled = false
        kagit_button2.layer.shadowColor = UIColor.black.cgColor
        kagit_button2.layer.shadowOpacity = 0.5
        kagit_button2.layer.shadowRadius = 4
            
            self.showRandomImage()
    
        if bilgisayarSecimi == 1 {
            tas_button2.isEnabled = true
            kagit_button2.isEnabled = true
            makas_button2.isEnabled = true
            kagit_button2.layer.shadowOpacity = 0.0
            kagit_button2.layer.shadowRadius = 0
        }
        else if bilgisayarSecimi == 0{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){ [self] in
                self.yourScoreInt += 1
                self.yourScore.text=String(yourScoreInt)
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.performSegue(withIdentifier: "game_skore_segue", sender: self)
                
            }
                
                
        }
        else if bilgisayarSecimi == 2{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){ [self] in
                self.computerScoreInt += 1
                self.computerScore.text = String(computerScoreInt)}
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.performSegue(withIdentifier: "game_skore_segue", sender: self)
            }
        }
        
        }
        
        
        
   
    @IBAction func makas_button(_ sender: Any) {
        ActivityIndicator()
        makas_button_num = 1
        kagit_button2.isEnabled = false
        tas_button2.isEnabled = false
        makas_button2.layer.shadowColor = UIColor.black.cgColor
        
        makas_button2.layer.shadowOffset = CGSize(width: 0, height: 2)
        makas_button2.layer.shadowOpacity = 0.5
        makas_button2.layer.shadowRadius = 4
        self.showRandomImage()
        if bilgisayarSecimi == 2 {
            tas_button2.isEnabled = true
            kagit_button2.isEnabled = true
            makas_button2.isEnabled = true
            makas_button2.layer.shadowOpacity = 0.0
            makas_button2.layer.shadowRadius = 0
        }
        else if bilgisayarSecimi == 0{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                self.computerScoreInt += 1
                self.computerScore.text=String(self.computerScoreInt)}
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.performSegue(withIdentifier: "game_skore_segue", sender: self)
                
            }
                
                
        }
        else if bilgisayarSecimi == 1{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                self.yourScoreInt += 1
                self.yourScore.text = String(self.yourScoreInt)}
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.performSegue(withIdentifier: "game_skore_segue", sender: self)
            }
        }
        
        
    }
    
  
    func showRandomImage() {
        
        // Rastgele bir resim seç
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let randomIndex = Int(arc4random_uniform(UInt32(self.imageArray.count)))
            UserDefaults.standard.set(randomIndex, forKey: "bilgisayarSecimi")
            
            let randomImage = self.imageArray[randomIndex]
            self.imageView.image = randomImage
            
            
        }
      }
    override func viewWillDisappear(_ animated: Bool) {
        tas_button2.isEnabled = true
        makas_button2.isEnabled = true
        kagit_button2.isEnabled = true
        
        kagit_button2.layer.shadowOpacity = 0.0
        kagit_button2.layer.shadowRadius = 0
        tas_button2.layer.shadowOpacity = 0.0
        tas_button2.layer.shadowRadius = 0
        makas_button2.layer.shadowOpacity = 0.0
        makas_button2.layer.shadowRadius = 0
        
        imageView.image = nil
    }
    @IBAction func delete_button(_ sender: Any) {
        yourScore.text = " "
        computerScore.text = " "
    }


}
  
    



