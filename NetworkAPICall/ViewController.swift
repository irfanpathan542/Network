//
//  ViewController.swift
//  NetworkAPICall
//
//  Created by iFlame on 5/11/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        requestAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    //http://ip.jsontest.com/
//    
//    func requestAPI_Deprecated(){
//        
//        let url = URL(string: "http://ip.jsontest.com/")!
//        let request = URLRequest(url: url)
//        
//        do{
//            
//          let data  = try NSURLConnection.sendSynchronousRequest(request, returning: nil)
//            
//            let responseString = String.init(data: data, encoding: String.Encoding.utf8)
//            
//            
//            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
//                
//                print(jsonObject)
//
//            }
//            else {
//                print("Some error while parsing JsonString ==>> \(responseString ?? "No Data")")
//            }
//            
//        }catch {
//            print("Exception ==>> \(error)")
//        }
//        
//        
//    }
    
    func requestAPI(){
       //1.
        let url = URL(string: "http://ip.jsontest.com/")!
        let request = URLRequest(url: url)
        
        //2.
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            print("response ==>>", (response as! HTTPURLResponse).statusCode)
            
            //3. handle response
            if error != nil{
                
            }else if response != nil && data != nil {
                
                do{
                    
                    if let jsonObject = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
                        print(jsonObject)
                    }
                    else {
                        let responseString = String.init(data: data!, encoding: String.Encoding.utf8)
                        print("Some error while parsing JsonString ==>> \(responseString ?? "No Data")")
                    }
                    
                    DispatchQueue.main.async {
                        //Update User-interface
                    }
                    
                }catch {
                    print("Exception ==>> \(error)")
                }
            }
            else{
                print("Something went wrong!")
            }
            
        })//4. resume
        task.resume()
    }
}

