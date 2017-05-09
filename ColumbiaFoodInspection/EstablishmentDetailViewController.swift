//
//  EstablishmentDetailViewController.swift
//  ColumbiaFoodInspection
//
//  Created by Shane Bishop on 5/5/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import UIKit

class EstablishmentDetailViewController: UIViewController {
    
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var numberViolations: UILabel!
    @IBOutlet weak var violationInfo: UILabel!

    var item: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
            restaurantName.text = item?.establishment?.name
            restaurantAddress.text = item?.establishment?.address
            restaurantAddress.sizeToFit()
        let x = item?.inspection?.results?.critical
         let criticalViolations = String(describing: x!)
        
        numberViolations.text = (("Critical Violations: ") + criticalViolations)
        
           violationInfo.text = item?.inspection?.comments

        // Do any additional setup after loading the view.
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
