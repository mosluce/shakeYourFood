//
//  v1API.swift
//  shakeYourFood
//
//  Created by Daniel Lee on 2016/11/2.
//  Copyright © 2016年 sohoGroup. All rights reserved.
//

import Foundation

enum enjoy_status_action: Int {
    case tooFar         = 0
    case tooExpensive   = 1
    case dislike        = 2
    case go             = 4
}




class v1API: AnyObject {
    
    let uid = "minithon";
    let http = httpWork();
    
    //MARK: GET /v1/search
    /*
     
    call back full message from server responce dictionary for now,
    example :
     {
        "respCode": "SUCCESS",
        "message": "",
        "restaurant": {
            "place_id": "ChIJ79nqreMUaTQRlg7RZmOHmNY",
            "name": "肯德基KFC-台中沙鹿餐廳",
            "vicinity": "No. 127, Shatian Road, Shalu District",
            "location": {
                "lat": 24.235836,
                "lng": 120.559077
            }
        },
        "food": {
            "place_id" = "ChIJ79nqreMUaTQRlg7RZmOHmNY",
            "id": "f000001",
            "name": "雞腿飯",
            "price": 65,
            "url": "http://www.jengjong.tw/upload/food/20140311185704212.jpg"
        }
     }
     
     
    */
    func getNearbyRestaurant(Latitude lat:Float, Longitude lng:Float, callback : @escaping (_ resData : [String:AnyObject]?)->Void ) {
        
        http.httpRequestWithURLParam(withRoute: "/v1/search", HTTPMethod: "GET", parameters: ["uid":uid, "lat":"\(lat)", "lng":"\(lng)"], callback: {(data,res,err) in
            if err == nil{
                
                do{
                    
                    let responseData:[String:AnyObject] = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject];
                    
                    print("responseData:\(responseData)");
                    
                    callback(responseData);
                    
                    
                }catch{
                    
                    print("catch");
                    callback(nil);
                    
                }
                
            }else{
                
                print("error:\(err)");
                callback(nil);
                
            }

        })
    }
    
    
    //MARK: GET /v1/search/action
    /*
     Using this after user feedback their feelings about the restaurant, and callback full message in [] type for now.
     example:
     
     {
     "respCode": "SUCCESS",
     "message": "",
     "restaurant": {
     "place_id": "ChIJ79nqreMUaTQRlg7RZmOHmNY",
     "name": "肯德基KFC-台中沙鹿餐廳",
     "vicinity": "No. 127, Shatian Road, Shalu District",
     "location": {
     "lat": 24.235836,
     "lng": 120.559077
     }
     },
     "food": {
     "place_id" = "ChIJ79nqreMUaTQRlg7RZmOHmNY",
     "id": "f000001",
     "name": "雞腿飯",
     "price": 65,
     "url": "http://www.jengjong.tw/upload/food/20140311185704212.jpg"
     }
     }
     
     */
    func furtherAction(Latitude lat:Float, Longitude lng:Float, place_id pid:String, food_id fid:String, action:enjoy_status_action, callback : @escaping (_ resData : [String:AnyObject]?)->Void){
        
        http.httpRequestWithURLParam(withRoute: "/v1/search/action", HTTPMethod: "GET", parameters: ["uid":uid, "lat":"\(lat)", "lng":"\(lng)", "place_id":"\(pid)", "foodId":"\(fid)", "action":"\(action.rawValue)"], callback: {(data,res,err) in
            if err == nil{
                
                do{
                    
                    let responseData:[String:AnyObject] = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject];
                    
                    print("responseData:\(responseData)");
                    
                    callback(responseData);
                    
                    
                }catch{
                    
                    print("catch");
                    callback(nil);
                    
                }
                
            }else{
                
                print("error:\(err)");
                callback(nil);
                
            }
            
        })

    }
    
}
