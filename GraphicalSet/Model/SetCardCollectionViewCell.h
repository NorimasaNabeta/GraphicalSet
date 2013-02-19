//
//  SetCardCollectionViewCell.h
//  GraphicalSet
//
//  Created by Norimasa Nabeta on 2013/02/19.
//  Copyright (c) 2013年 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCardView.h"

@interface SetCardCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet SetCardView *setCard;

@end
