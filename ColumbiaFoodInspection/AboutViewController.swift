//
//  AboutViewController.swift
//  ColumbiaFoodInspection
//
//  Created by Lukas Heading on 5/9/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController{
    
    @IBOutlet weak var infoPageTitle: UILabel!
    @IBOutlet weak var info: UILabel!
    override func viewDidLoad() {
        
        infoPageTitle.backgroundColor = UIColor.init(red: 0.09, green: 0.38, blue: 0.62, alpha: 1.0)
        info.backgroundColor = UIColor.init(red: 0.46, green: 0.45, blue: 0.45, alpha: 1.0)
        
        infoPageTitle.text = "Information"
        info.text = "Violation Color Description \n*Red = 5 or more critical violations, total violations > 20 \n*Orange = 2 -5 critical, non critical > 10 \n*Yellow = 1-2 critical, 5-10 non critical \n*Green  = 0-1 critical, non-critical < 5 \n\nGroup: \nShane Bishop, Colin Iglehart, Lukas Heading, Matthew Pokoik, Trevor Beshear, Kaylyn Sneathen"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
