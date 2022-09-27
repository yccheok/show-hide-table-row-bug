//
//  TableViewController.swift
//  xxx
//
//  Created by Yan Cheng Cheok on 27/09/2022.
//

import UIKit

class TableViewController: UITableViewController {

    private var hiddenIndexPaths : Set<IndexPath> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func toggle(_ sender: UISwitch) {
        if sender.isOn {
            show(1)
            show(2)
        } else {
            hide(1)
            hide(2)
        }
    
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    private func isHidden(_ indexPath: IndexPath) -> Bool {
        hiddenIndexPaths.contains(indexPath)
    }
    
    private func hide(_ item: Int) {
        hiddenIndexPaths.insert(IndexPath(item: item, section: 0))
    }
    
    private func show(_ item: Int) {
        hiddenIndexPaths.remove(IndexPath(item: item, section: 0))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isHidden(indexPath) {
            return 0.0
        }
        
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
