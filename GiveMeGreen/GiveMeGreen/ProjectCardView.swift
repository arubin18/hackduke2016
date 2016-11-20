//
//  ProjectCardView.swift
//  GiveMeGreen
//
//  Created by Joseph DeChicchis on 11/19/16.
//  Copyright © 2016 HackDuke 2016 Project. All rights reserved.
//

import UIKit

class ProjectCardView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 4.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        // Corner Radius
        layer.cornerRadius = 10.0;
        
        self.backgroundColor = UIColor.white
        
        let tblView =  UIView(frame: CGRect.zero)
        tableView.tableFooterView = tblView
        
        let nib1 = UINib(nibName: "ProjectCardTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "Cell")
        
        tableView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        
        tableView.layer.cornerRadius = 10.0
        tableView.clipsToBounds = true
        
        self.addSubview(tableView)
        
        self.tableView.reloadData()
        
        //NSLog("setup")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //NSLog("cellForRowAt")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProjectCardTableViewCell
        
        cell.selectionStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.frame.height - 10
    }
    

}
