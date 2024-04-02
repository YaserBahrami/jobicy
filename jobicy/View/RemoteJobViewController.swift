//
//  RemoteJobViewController.swift
//  jobicy
//
//  Created by Yaser on 1.04.2024.
//

import UIKit

class RemoteJobViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NetworkService.shared.fetchJobs { result in
            print(result)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
