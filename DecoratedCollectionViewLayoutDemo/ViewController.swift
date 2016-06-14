//
//  ViewController.swift
//  DecoratedCollectionViewLayoutDemo
//
//  Created by Alexander Kolov on 14/6/16.
//  Copyright © 2016 Alexander Kolov. All rights reserved.
//

import UIKit

final class ViewController: UICollectionViewController {

  enum Sections: Int {
    case Header, Content
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    currentCollectionViewLayout.estimatedItemSize = CGSize(width: collectionView!.bounds.width, height: 100)
  }

  // MARK: Properties

  var currentCollectionViewLayout: SeparatorCollectionViewFlowLayout {
    return collectionView!.collectionViewLayout as! SeparatorCollectionViewFlowLayout
  }
  
}

// MARK: UICollectionViewDataSource

extension ViewController {

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return section == 0 ? 1 : 100
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let section = Sections(rawValue: indexPath.section) else {
      return super.collectionView(collectionView, cellForItemAt: indexPath)
    }

    switch section {
    case .Header:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
      let dataAsset = NSDataAsset(name: "Text Sample")
      if let data = dataAsset?.data {
        cell.textView.text = String(data: data, encoding: String.Encoding.utf8)
      }
      return cell

    case .Content:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RegularCell", for: indexPath)
      let hue = CGFloat(arc4random_uniform(256)) / 256.0
      let saturation = (CGFloat(arc4random_uniform(256)) / 256.0) + 0.5
      let brightness = (CGFloat(arc4random_uniform(256)) / 256.0) + 0.5
      cell.backgroundColor = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
      return cell
    }
  }

}

// MARK: UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {



}

// MARK: SeparatorCollectionViewFlowLayoutDelegate

extension ViewController: SeparatorCollectionViewFlowLayoutDelegate {

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    shouldDisplayDecorationViewOfKind kind: String,
    at indexPath: IndexPath
  ) -> Bool {
    return kind == SeparatorCollectionViewFlowLayout.bottomSeparatorKind
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForDecorationViewOfKind kind: String,
    at indexPath: IndexPath
  ) -> UIEdgeInsets {
    return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
  }

}
