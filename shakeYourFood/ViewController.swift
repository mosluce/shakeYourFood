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
        // GET /v1/search
        API.getNearbyRestaurant(Latitude: 25.0037154,
                                Longitude: 121.5145271,
                                callback:
            {(res,foo)->Void in
                print("res, name:\(res?.name), local:(\(res?.location?.longitude),\(res?.location?.latitude)), placeid:\(res?.place_id), vicinty:\(res?.vicinity) \n");
                print("food, id:\(foo?.id), name:\(foo?.name), placeid:\(foo?.place_id), price:\(foo?.price), url:\(foo?.url) \n");
        });
        
        // GET /v1/search/action
        API.furtherAction(Latitude: 25.023696,
                          Longitude: 121.5252311,
                          place_id: "ChIJN5RMH5CpQjQRAoN8D1LuNeM",
                          food_id: "f000003",
                          action: enjoy_status_action.dislike,
                          callback:
            {(res,foo)->Void in
                print("res, name:\(res?.name), local:(\(res?.location?.longitude),\(res?.location?.latitude)), placeid:\(res?.place_id), vicinty:\(res?.vicinity) \n");
                print("food, id:\(foo?.id), name:\(foo?.name), placeid:\(foo?.place_id), price:\(foo?.price), url:\(foo?.url) \n");
        });
        */
        
        
        
        // GET /v1/reataurant
        API.getNearbyRestaurantList(Latitude: 25.0037154, Longitude: 121.5145271, callback: {(resList)->Void in
            for res in resList!
            {
                print("res, name:\(res.name), local:(\(res.location?.longitude),\(res.location?.latitude)), placeid:\(res.place_id), vicinty:\(res.vicinity) \n");
            }
        })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

