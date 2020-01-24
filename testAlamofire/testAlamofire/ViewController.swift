//
//  ViewController.swift
//  testAlamofire
//
//  Created by Macx on 2020/1/23.
//  Copyright © 2020 Macx. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //get()
        //post()
        //getResult()
        yibuPost()
        
        
    }
    func yibuPost()  {
        let urlStr = "https://easy-mock.com/mock/5e1c7fc06a44945ea7bd2965/example/postTest"
        Alamofire.request(urlStr, method: .post, parameters: nil).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                print(json)
                let data:Data=response.data!
                if data==nil{
                    print("get 数据为空")
                }else{
                    let dic=try?JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    if dic==nil {
                        
                    }else{
                        print(dic!)
                        let str=String.init(data: data, encoding: .utf8)
                        DispatchQueue.main.async {
                            print(str!)
                            self.textView.text=str;
                        }
                    }
                }
                break
            case .failure(let error):
                print("error:\(error)")
                break
            }
        }
    }
    func getResult()  {
        Alamofire.request("https://httpbin.org/get")
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
            print(response.result)
            switch response.result {
            case .success:
                print("Validation Successful")
            case let .failure(error):
                print(error)
            }
        }
    }
    func get()  {
        //
        //let dic = ["key":"value"]
        var url = "https://www.raywenderlich.com/downloads/Flavors.plist"
        url="https://httpbin.org/get"
        url="http://www.weather.com.cn/data/sk/101010100.html"
        
        let httpHeaders=["head":"1"]
        let rep:DataRequest=Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: httpHeaders)
   
        rep.response{ response in
            let data:Data=response.data!
            if data==nil{
                print("get 数据为空")
            }else{
                let dic=try?JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                if dic==nil {
                    
                }else{
                    print(dic!)
                    let str=String.init(data: data, encoding: .utf8)
                    DispatchQueue.main.async {
                        print(str!)
                        self.textView.text=str;
                    }
                }
            }
            debugPrint(response)
        }
        
        
    }
    
    func post()  {
        
        let login = ["email":"test@test.test","password":"testPassword"]
        var url="https://httpbin.org/post"
        url="https://easy-mock.com/mock/5e1c7fc06a44945ea7bd2965/example/postTest"
        let httpHeaders=["head":"1"]
        Alamofire.request(url, method: .post, parameters: login, encoding: URLEncoding.default, headers: httpHeaders).response { response in
            debugPrint(response)
            let data:Data=response.data!
            if data==nil{
                print("post 数据为空")
            }else{
                let dic=try?JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                if dic==nil {
                    
                }else{
                    print(dic!)
                    let str=String.init(data: data, encoding: .utf8)
                    DispatchQueue.main.async {
                        print(str!)
                        self.textView.text=str;
                    }
                }
            }
        }
    }
}


