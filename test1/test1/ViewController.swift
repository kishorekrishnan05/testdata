//
//  ViewController.swift
//  test1
//
//  Created by Kishore on 09/08/21.
//

import UIKit

class ViewController: UIViewController {

    var number = [1,3,4,5,6,7]
    let vals = [1, 4, 2, 2, 6, 24, 15, 2, 60, 15, 6]
    override func viewDidLoad() {
        super.viewDidLoad()
       /* comple {
            print("com")
        }*/
        /*passingData{(teask) in
            for i in teask {
                print(i)
            }
         }*/
        
            /*task(array: ["Daily Swift","Making List","The Dreammer"]) { teat in
                print(teat)
                
            }*/
        //print(Set(vals).sorted().reversed())
        let celsius = [-5.0, 10.0, 21.0, 33.0, 50.0]
        let fahrenheit = celsius.map { $0 + 1 }
        print(fahrenheit)
        let values = [3, 4, 5]
        let sum = values.reduce(0, +)
        print(sum)
       // let values = [11, 13, 14, 6, 17, 21, 33, 22]
        let even = values.filter { $0.isMultiple(of: 2) }
        print(even)
        task(array: ["Daily Swift","Making List","The Dreammer"]){ _ in
            
        }
        celsius.map(($0) -> bool){
            
        }
        // Do any additional setup after loading the view.
    }
    func comple(finished: () -> Void)
    {
        print("doing somtheing")
        finished()
    }
    func passingData(Compleationhandler:([String])->Void) {
        for i in 1..<5 {
            print(i)
        }
        Compleationhandler(["Daily Swift","Making List","The Dreammer"])
    }
    func task(array:[String],callback:([String])-> Void) {
        for _ in 0...10 {
            print("downloading file ")
            
        }
        callback(array)
    }
}

