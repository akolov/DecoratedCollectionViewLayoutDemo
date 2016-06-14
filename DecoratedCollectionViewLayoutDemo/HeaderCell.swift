//
//  HeaderCell.swift
//  DecoratedCollectionViewLayoutDemo
//
//  Created by Alexander Kolov on 14/6/16.
//  Copyright © 2016 Alexander Kolov. All rights reserved.
//

import UIKit

final class HeaderCell: UICollectionViewCell {

  override func awakeFromNib() {
    super.awakeFromNib()
    contentView.translatesAutoresizingMaskIntoConstraints = false
  }

  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
    attributes.size = systemLayoutSizeFitting(UILayoutFittingCompressedSize)
    return attributes
  }

  // MARK: Outlets

  @IBOutlet weak var textView: UITextView!

}
