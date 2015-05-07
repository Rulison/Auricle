//
//  HighScoreController.m
//  TestPage
//
//  Created by Jeff Gong on 4/28/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#import "HighScoreController.h"
#import <Foundation/Foundation.h>
@import AVFoundation;

@interface HighScoreController () {
}

@end

@implementation HighScoreController

@synthesize thisRound;
@synthesize highestRound;
@synthesize playAgainButton;
@synthesize resetButton;
@synthesize score;
@synthesize highestScore;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *intermediate = [defaults objectForKey:@"myKey"];
    highestScore = [intermediate intValue];
    
    self.thisRound.text = [NSString stringWithFormat:@"%ld", score];
    self.highestRound.text = [NSString stringWithFormat:@"%ld", highestScore];
    
    [self saveScores];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (IBAction)resetScores:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithInt:0] forKey:@"myKey"];
    [defaults synchronize];
    self.highestRound.text = [NSString stringWithFormat:@"%d", 0];
}

- (void) saveScores {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (score > highestScore) {
        NSLog(@"Got here!");
        [defaults setObject:[NSNumber numberWithInteger:score] forKey:@"myKey"];
        [defaults synchronize];
        self.highestRound.text = [NSString stringWithFormat:@"%ld", score];
    }
}

@end