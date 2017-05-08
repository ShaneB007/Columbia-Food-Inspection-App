//
//  ButtonChange.swift
//  ColumbiaFoodInspection
//
//  Created by Kaylyn Sneathen on 5/5/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import UIKit

class ButtonChange: UIViewController {

    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var favoriteButton2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        //Create New Button
       
        //set image for Button
        favoriteButton.setImage(UIImage?( #imageLiteral(resourceName: "Star-50")), for: .normal)
        favoriteButton.setImage(UIImage?(#imageLiteral(resourceName: "Star Filled-50")), for: .selected)
        
        favoriteButton2.setImage(UIImage?( #imageLiteral(resourceName: "Star-50")), for: .normal)
        favoriteButton2.setImage(UIImage?(#imageLiteral(resourceName: "Star Filled-50")), for: .selected)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
