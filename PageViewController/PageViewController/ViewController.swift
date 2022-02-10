//
//  ViewController.swift
//  PageViewController
//
//  Created by Juyeon on 2022/02/09.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  @IBOutlet weak var parentView: UIView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var stackView: UIStackView!
  
  fileprivate func setHeight() {
    var contentHeight = 0
    stackView.subviews.forEach {
      if !$0.isHidden {
        contentHeight += 50
      }
    }
    contentHeight -= 20
    if contentHeight > Int(parentView.frame.height) {
      self.stackView.snp.remakeConstraints {
        $0.leading.trailing.equalTo(self.scrollView.contentLayoutGuide)
        $0.top.bottom.equalTo(self.scrollView.contentLayoutGuide)
        $0.width.equalTo(self.scrollView.frameLayoutGuide)
        $0.height.equalTo(self.scrollView.contentLayoutGuide).priority(.low)
      }
    } else {
      self.stackView.snp.remakeConstraints {
        $0.leading.trailing.equalTo(self.parentView)
        $0.width.equalTo(self.parentView)
        $0.centerY.equalTo(self.parentView)
        $0.height.equalTo(contentHeight)
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setHeight()
  }
  @IBAction func onHidden(_ sender: UIButton) {
    sender.isSelected.toggle()
    if sender.isSelected {
      for i in 0 ..< 10 {
        let label = UILabel()
        label.text = "\(i)"
        self.stackView.addArrangedSubview(label)
        label.snp.makeConstraints {
          $0.height.equalTo(30)
        }
      }
    } else {
      for (index, view) in self.stackView.subviews.enumerated() {
        if index == 0 || index == 1 {
        } else {
          view.removeFromSuperview()
        }
      }
    }
    setHeight()
  }
}

