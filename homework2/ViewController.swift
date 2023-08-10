//
//  ViewController.swift
//  homework2
//
//  Created by Alua Nurakhanova on 10.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var lableYearOfRelease: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    var movie = Movie()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = movie.name
        let yearOTheRelease = movie.yearOfRelease
        lableYearOfRelease.text = String(yearOTheRelease)
        imageView.image = UIImage(named: movie.imageName)
        labelDescription.text = movie.description
        
    }
    
    


}

