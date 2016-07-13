//
//  IBBSBaseViewController.swift
//  ChinaDream
//
//  Created by 刘隆昌 on 16/7/10.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import UIKit
import SnapKit
import GearRefreshControl
import SwiftyJSON



class IBBSBaseViewController: UITableViewController {
    
    
    var gearRefreshControl: GearRefreshControl!
    
    var cornerActionButton: UIButton!
    var page: Int = 1
    
    var datasource: [JSON]! {
        didSet{
            tableView.reloadData()
        }
    }
    
    private var nodeId: Int!
    
    
    private func gearRefreshManager(){
        
        gearRefreshControl = GearRefreshControl(frame: view.bounds)
        gearRefreshControl.gearTintColor = CUSTOM_THEME_COLOR.lighterColor(0.7)
        gearRefreshControl.addTarget(self, action: #selector(IBBSBaseViewController.refreshData), forControlEvents: .ValueChanged)
        refreshControl = gearRefreshControl
        
    }
    
    private func configureCornerActionButton(){
        
        cornerActionButton = UIButton()
        cornerActionButton.layer.cornerRadius = 20.0
        cornerActionButton.clipsToBounds = true
        cornerActionButton.setImage(UIImage(named: "plus_button"), forState: .Normal)
        cornerActionButton.addTarget(self, action: #selector(IBBSBaseViewController.cornerActionButtonDidTap), forControlEvents: .TouchUpInside)
        
        guard let topView = UIApplication.topMostViewController?.view else { return }
        
        topView.addSubview(cornerActionButton)
        cornerActionButton.snp_makeConstraints { (make) in
            
            make.width.height.equalTo(40)
            make.right.equalTo(-16)
            make.bottom.equalTo(-70)
            
        }
        
        
    }
    
    func cornerActionButtonDidTap(){}
    
    
    
    internal func updateTheme(){
        
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : CUSTOM_THEME_COLOR]
        cornerActionButton.backgroundColor = CUSTOM_THEME_COLOR.lighterColor(0.85)
        
        
        gearRefreshControl.endRefreshing()
        gearRefreshControl.removeFromSuperview()
        gearRefreshManager()
        
    }
    
    func hideCornerActionButton(){
        cornerActionButton.hidden = true
    }
    func showCornerActionButton(){
        cornerActionButton.hidden = false
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gearRefreshManager()
        configureCornerActionButton()
        
        navigationController?.navigationBar.hidden = SHOULD_HIDE_NAVIGATIONBAR
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:CUSTOM_THEME_COLOR]
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(IBBSBaseViewController.updateTheme), name: kThemeDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(IBBSBaseViewController.updateTheme), name: hideCornerActionButton(), object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(IBBSBaseViewController.showCornerActionButton), name: kShouldShowCornerActionButton, object: nil)
        
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    
    
    func automaticPullingDownToRefresh(){
        NSTimer.scheduledTimerWithTimeInterval(0.6, target: self, selector: #selector(IBBSBaseViewController.automaticContentOffset), userInfo: nil, repeats: false)
        
        
        
    }
    
    func automaticContentOffset(){
        
        gearRefreshControl.beginRefreshing()
        tableView.setContentOffset(CGPointMake(0, -125.0), animated: true)
        executeAfterDelay(0.5) {
            self.gearRefreshControl.endRefreshing()
        }
        
    }
    
    
  
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        cornerActionButton.hidden = false
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        cornerActionButton.hidden = false
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(IBBSBaseViewController), name: kShouldShowCornerActionButton, object: nil)
        
        
        #if DEBUG
        
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.window?.bringSubviewToFront(appDelegate.fps)
        
        
        #endif
        
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



extension IBBSBaseViewController{
    
    
    func performPostNewArticleSegue(segueIdentifier segueID:String, nodeId: Int? = nil){
    
        self.nodeId = nodeId
        let key = IBBSLoginKey()
        if key.isValid {
            
            performSegueWithIdentifier(segueID, sender: self)
            
        }else{
            
            IBBSContext()
            
            
        }
        
        
    
    
    }
    
    
    func refreshData(){}
    func reloadDataAfterPosting(){
        
        DEBUGLog("reloading")
        if page == 1 {
            
            performSelector(#selector(IBBSBaseViewController.refreshData))
            automaticPullingDownToRefresh()
            
        }
        
    }
    
    
}








