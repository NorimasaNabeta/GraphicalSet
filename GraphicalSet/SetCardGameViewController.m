//
//  SetCardGameViewController.m
//  GraphicalSet
//
//  Created by Norimasa Nabeta on 2013/02/19.
//  Copyright (c) 2013年 CS193p. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "SetCardCollectionViewCell.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

- (Deck *) createDeck
{
    return [[SetCardDeck alloc] init];
}

- (NSInteger) startingCount
{
    return 20;
}

-(void) updateCell:(UICollectionViewCell *)cell usingCard: (Card* )card
{
    if ([cell isKindOfClass:[SetCardCollectionViewCell class]]) {
        SetCardView *setCardView = ((SetCardCollectionViewCell *)cell).setCard;
        if ([card isKindOfClass:[SetCard class]]) {
            SetCard *setCard = (SetCard *)card;
            setCardView.rank = setCard.rank;
            setCardView.suit = setCard.suit;
            setCardView.faceUp = setCard.faceUp;
            setCardView.alpha = setCard.isUnplayable? 0.3: 1.0;
        }
    }
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.cardCollectionView dequeueReusableCellWithReuseIdentifier:@"SetCard" forIndexPath:indexPath];
    [self updateCell:cell usingCard:[self.game cardAtIndex:indexPath.item]];
    
    return cell;
    
}

@end
