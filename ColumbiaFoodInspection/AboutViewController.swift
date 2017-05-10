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
        view.backgroundColor = UIColor.gray
        
        infoPageTitle.text = "Information"
        info.text = "  Violation Color Description \n  *Red = 5 or more critical violations, total violations > 20 \n  *Orange = 2 -5 critical, non critical > 10 \n  *Yellow = 1-2 critical, 5-10 non critical \n  *Green  = 0-1 critical, non-critical < 5 \n  A Critical item is defined as a violation that is more likely than other violations to contribute to food contamination, illness, or environmental health hazard.\n\n  A Non Critical Item means a provision that, if in noncompliance, may lead to conditions favorable for food contamination, illness, or environmental health hazards. A non critical item includes violations related to general sanitation, operational controls, sanitation standard operating procedures, facilities or structures, equipment design, or general maintenance.\n\n A food establishment's permit shall be suspended if an inspection reveals violations which meet or exceed the folllowing: 10 critical violations, or 25 non-critical violations, or any combination totaling 30 violations or more"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
