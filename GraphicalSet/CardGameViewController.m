//
//  CardGameViewController.m
//  GraphicalSet
//
//  Created by Norimasa Nabeta on 2013/02/16.
//  Copyright (c) 2013年 CS193p. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "PlayingCardCollectionViewCell.h"
#import "PlayingCard.h"

@interface CardGameViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;

@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation CardGameViewController

@synthesize game=_game;
//
//
//
- (void) setCardCollectionView:(UICollectionView *)cardCollectionView
{
    _cardCollectionView = cardCollectionView;
    _cardCollectionView.dataSource = self;
    _cardCollectionView.delegate = self;
    
}

- (Deck *) createDeck
{
    return nil;
}

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCount
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}
- (void) setGame:(CardMatchingGame *)game
{
    if (_game != game) {
        _game = game;
    }
}

- (void) updateUI
{
    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]) {
        NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
        Card *card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell usingCard:card];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount=flipCount;
    self.flipLabel.text=[NSString stringWithFormat:@"Flip: %d", self.flipCount];
    NSLog(@"flips updated to %d", self.flipCount);
}


- (IBAction)flipCard:(UITapGestureRecognizer *) gesture
{
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if( indexPath ){
        [self.game flipCardAtIndex:indexPath.item];
        self.flipCount++;
        [self updateUI];
        // self.gameResult.score = self.game.score;
    }
}

- (IBAction)redealCard:(id)sender {
   [self setGame:nil];
    // self.gameResult=nil;
    self.flipCount=0;
    [self updateUI];

}

-(void) updateCell:(UICollectionViewCell *)cell usingCard: (Card* )card
{
    
}


- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *) collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12; //[myDataModel count];
}
- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.cardCollectionView dequeueReusableCellWithReuseIdentifier:@"Card" forIndexPath:indexPath];
    [self updateCell:cell usingCard:[self.game cardAtIndex:indexPath.item]];
    
//    if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
//        PlayingCardCollectionViewCell *pccvc = (PlayingCardCollectionViewCell *)cell;
//        PlayingCard *card = (PlayingCard*) [self.game cardAtIndex:indexPath.row];
//        pccvc.playingCard.rank = card.rank;
//        pccvc.playingCard.suit = card.suit;
//    }
    return cell;
    
    
}

@end
