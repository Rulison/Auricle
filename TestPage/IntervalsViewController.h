//
//  IntervalsViewController.h
//  TestPage
//
//  Created by MAC Book on 4/25/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#ifndef TestPage_IntervalsViewController_h
#define TestPage_IntervalsViewController_h
#import <UIKit/UIKit.h>
#import "MainMenuViewController.h"

@interface IntervalsViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UILabel *problemNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;

@property (strong, nonatomic) IBOutlet UIButton *minorSecondButton;
@property (strong, nonatomic) IBOutlet UIButton *majorSecondButton;
@property (strong, nonatomic) IBOutlet UIButton *minorThirdButton;
@property (strong, nonatomic) IBOutlet UIButton *majorThirdButton;
@property (strong, nonatomic) IBOutlet UIButton *fourthButton;
@property (strong, nonatomic) IBOutlet UIButton *fifthButton;
@property (strong, nonatomic) IBOutlet UIButton *minorSixthButton;
@property (strong, nonatomic) IBOutlet UIButton *majorSixthButton;
@property (strong, nonatomic) IBOutlet UIButton *minorSeventhButton;
@property (strong, nonatomic) IBOutlet UIButton *majorSeventhButton;
@property (strong, nonatomic) IBOutlet UIButton *octaveButton;

@property (strong, nonatomic) id dataObject;

@property (nonatomic, assign) NSInteger score;

@property (nonatomic, assign) NSString* correctAnswer;

@property (nonatomic, assign) bool hasScoreAlreadyBeenSet;

@end

#endif
