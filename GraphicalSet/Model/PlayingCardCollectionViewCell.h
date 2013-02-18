//
//  PlayingCardCollectionViewCell.h
//  GraphicalSet
//
//  Created by Norimasa Nabeta on 2013/02/18.
//  Copyright (c) 2013年 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardView.h"

@interface PlayingCardCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCard;

@end
