//
//  ViewController.swift
//  shakeYourFood
//
//  Created by Daniel Lee on 2016/11/1.
//  Copyright © 2016年 sohoGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let API = v1API();
    
    override func viewDidLoad() {
        super.viewDidLoad()
/* 
 
    examples
        // GET /v1/search
        API.getNearbyRestaurant(Latitude: 25.0037154, Longitude: 121.5145271, callback: {(resDic) in
            print("resDic : \(resDic)");
        })

        
        
       // GET /v1/search/action
        API.furtherAction(Latitude: 25.0521953, Longitude: 121.5295933, place_id: "ChIJe3D4HM-rQjQRuATzrGPLVD8", food_id: "ChIJe3D4HM-rQjQRuATzrGPLVD8", action: enjoy_status_action.dislike, callback: {(resDic) in
            print("resDic : \(resDic)");
        })
   
 
*/
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

