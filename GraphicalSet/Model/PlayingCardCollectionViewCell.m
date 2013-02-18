//
//  PlayingCardCollectionViewCell.m
//  GraphicalSet
//
//  Created by Norimasa Nabeta on 2013/02/18.
//  Copyright (c) 2013年 CS193p. All rights reserved.
//

#import "PlayingCardCollectionViewCell.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface PlayingCardCollectionViewCell ()
//@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@property (strong, nonatomic) PlayingCardDeck *deck;
@end

@implementation PlayingCardCollectionViewCell

-(Deck *)deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void)setPlayingCard:(PlayingCardView *)playingCard
{
    _playingCard = playingCard;
    [self drawRandomPlayingCard];
//    [playingCard addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:playingCard action:@selector(pinch:)]];
    
}
-(void)drawRandomPlayingCard
{
    Card *card = [self.deck drawRandomCard];
    if ([card isKindOfClass:[PlayingCard class]]) {
        PlayingCard *playingCard = (PlayingCard *)card;
        self.playingCard.rank = playingCard.rank;
        self.playingCard.suit = playingCard.suit;
    }
}

/*
- (IBAction)swipe:(UISwipeGestureRecognizer *)sender
{
    [UIView transitionWithView:self.playingCard
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        if (!self.playingCard.faceUp) [self drawRandomPlayingCard];
                        self.playingCard.faceUp = !self.playingCard.faceUp;
                    }
                    completion:NULL];
}
*/


@end
