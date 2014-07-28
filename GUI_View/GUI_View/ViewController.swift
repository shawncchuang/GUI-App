//
//  ViewController.swift
//  GUI_View
//
//  Created by ShawnCCHuang on 2014-07-27.
//  Copyright (c) 2014 ShawnCCHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView:UIImageView=UIImageView()
    var backgroundDict:Dictionary<String,String>=Dictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let width:CGFloat=320
        let height:CGFloat=568
        backgroundDict=["Background1":"background1","Background2":"background2"]
        
        var buttonTitles=["Backgorund 1","Background 2"]
        
        var view:UIView=UIView(frame: CGRectMake(0, 0, width,height))
        
        self.view.addSubview(view);
        
        var backgroundImage:UIImage=UIImage(named:backgroundDict["Background1"])
        
        imageView=UIImageView(frame: view.frame)
        
        imageView.image=backgroundImage
        
        view.addSubview(imageView)
        
        for i in 0 ... buttonTitles.count-1{
            
            var btn:UIButton=UIButton.buttonWithType(UIButtonType.System) as UIButton
            btn.frame=CGRectMake(0, 0, 200, 20)
            btn.center=CGPointMake(view.center.x,CGFloat(i*50+100))
            btn.setTitle(buttonTitles[i], forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            
            btn.addTarget(self, action: "buttonCliked:", forControlEvents: UIControlEvents.TouchUpInside)
            btn.tag=i+1
            
            view.addSubview(btn)
            
            
            
        }
        
        
    }
    func buttonCliked(sender:UIButton){
    
    //println("Button Clicked")
        var btn:UIButton=sender
        var imgSelector:String="Background\(btn.tag)"
        
        UIView.animateWithDuration(0.4, animations:{self.imageView.alpha=0}, completion:
        {
            _ in self.imageView.image = UIImage(named:self.backgroundDict[imgSelector])
            UIView.animateWithDuration(0.4, animations:{self.imageView.alpha=1})
       })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

