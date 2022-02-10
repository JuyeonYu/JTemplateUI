//
//  HViewController.swift
//  PageViewController
//
//  Created by Juyeon on 2022/02/09.
//

import UIKit

class HViewController: UIViewController {

  @IBOutlet weak var menus: UIStackView!
  override func viewDidLoad() {
    super.viewDidLoad()
    menus.subviews.forEach {
      guard let button = $0 as? UIButton else { return }
      button.setTitleColor(.blue, for: .normal)
      button.setTitleColor(.black, for: .selected)
      button.addTarget(self, action: #selector(onMenu(sender:)), for: .touchUpInside)
    }
    
        // Do any additional setup after loading the view.
    }
  @objc func onMenu(sender: UIButton) {
    let toggler = Toggler(items: menus.subviews.map { $0 as! UIButton })
    toggler.toggle(item: sender)
  }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//      if segue == "H" {
//        segue.destination =
//      }
    }

}
