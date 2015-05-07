//
//  HighScoreController.h
//  TestPage
//
//  Created by Jeff Gong on 4/28/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#ifndef TestPage_HighScoreController_h
#define TestPage_HighScoreController_h
#import <UIKit/UIKit.h>
#import "MainMenuViewController.h"

@interface HighScoreController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *thisRound;
@property (strong, nonatomic) IBOutlet UILabel *highestRound;

@property (strong, nonatomic) IBOutlet UIButton *playAgainButton;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;

@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger highestScore;

-(void)saveScores;

@end

#endif