//
//  TextController.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/29.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit

class TextController: UIViewController {
    
    typealias DoneBtnOnClick = (string: String) -> Void
    var doneBtnOnClick:DoneBtnOnClick?
    
    let titleTextField = UITextField(frame: CGRect(x: 100, y: 200, width: 100, height: 44))
    
    
    init(doneBtnOnClick: DoneBtnOnClick?) {
        self.doneBtnOnClick = doneBtnOnClick
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init() {
        self.init(doneBtnOnClick: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 77, height: 44))
        titleTextField.placeholder = "fasdfasdfas"
        titleTextField.borderStyle = .RoundedRect
        doneBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        doneBtn.setTitle("完成", forState: .Normal)
        doneBtn.addTarget(self, action: #selector(self.doneBtnAction), forControlEvents: .TouchUpInside)
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(titleTextField)
        view.addSubview(doneBtn)
//        view.backgroundColor = UIColor.lightGrayColor()
        
        // Do any additional setup after loading the view.
    }
    
    func doneBtnAction() {
        view.endEditing(true)
        doneBtnOnClick?(string: titleTextField.text!)
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
