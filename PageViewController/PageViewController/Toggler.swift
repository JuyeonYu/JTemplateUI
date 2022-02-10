//
//  Toggler.swift
//  PageViewController
//
//  Created by Juyeon on 2022/02/09.
//

import Foundation
import UIKit

class Toggler: Togglable {
  var maxOnCount: Int = 1
  
  func toggle(item: UIButton) {
    items.forEach {
      if $0 == item {
        $0.isSelected = true
      } else {
        $0.isSelected = false
      }
    }
  }
  
  typealias Item = UIButton
  
  var items: [Item]
  
  init(items: [Item]) {
    self.items = items
  }
  
  
}

protocol Togglable {
  associatedtype Item
  var items: [Item] { get }
  var maxOnCount: Int { get }
  func toggle(item: Item)
}
