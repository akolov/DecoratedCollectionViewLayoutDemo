//
//  RegularCell.swift
//  DecoratedCollectionViewLayoutDemo
//
//  Created by Alexander Kolov on 14/6/16.
//  Copyright © 2016 Alexander Kolov. All rights reserved.
//

import UIKit

final class RegularCell: UICollectionViewCell {

  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
    attributes.size.height = 100
    return attributes
  }

}
