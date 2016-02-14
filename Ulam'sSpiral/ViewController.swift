//
//  ViewController.swift
//  Ulam'sSpiral
//
//  Created by Takk on 2016/02/14.
//  Copyright © 2016年 Takuma Ogura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var arr : [UIView] = []
    var arr_num = 0
    var cnt = 1
    
    var turn = 0
    var view_num = 1
    var check = 0
    var nx = 0
    var ny = 0
    
    var x = Int()
    var y = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        x = Int(self.view.frame.width / 2)
        y = Int(self.view.frame.height / 2)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(
            0.1,
            target: self,
            selector: "draw_ulam_spiral:",
            userInfo: nil,
            repeats: true
        )
    }
    
    func isPrime(n : Int) -> Bool {
        if n < 2 { return false }
        let square_root = Int(sqrt(Double(n)))
        if square_root * square_root == n { return false }
        
        for i in 2..<Int(ceil(Double(n))) {
            if n % i == 0 { return false }
        }
        
        return true
    }
    
    func draw_ulam_spiral(timer : NSTimer) {
        
        for _ in 1...view_num {
            if isPrime(cnt) == true {
                let view : UIView = UIView()
                view.frame = CGRectMake(CGFloat(x), CGFloat(y), 1, 1)
                view.backgroundColor = UIColor.blackColor()
                arr.append(view)
                self.view.addSubview(arr[arr_num])
                arr_num++
                direction()
            }else {
                direction()
            }
            cnt++
        }
        
        turn = (turn + 1) % 4
        check++
        
        if check == 2 {
            view_num++
            check = 0
        }
    }
    
    func direction() {
        switch turn {
        case 0:
            nx = 1
            ny = 0
        case 1:
            nx = 0
            ny = -1
        case 2:
            nx = -1
            ny = 0
        case 3:
            nx = 0
            ny = 1
        default:
            break
        }
        
        x += nx
        y += ny
        
        if y <= -1  {
            timer.invalidate()
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

