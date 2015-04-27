//
//  IntervalsViewController.m
//  TestPage
//
//  Created by MAC Book on 4/21/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#import "IntervalsViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface IntervalsViewController () {
    AVAudioPlayer *_audioPlayer;
}

@end

@implementation IntervalsViewController

@synthesize score;
@synthesize problemNumber;

@synthesize correctAnswer;

@synthesize problemNumberLabel;
@synthesize scoreLabel;

@synthesize backButton;
@synthesize playButton;

@synthesize minorSecondButton;
@synthesize majorSecondButton;
@synthesize minorThirdButton;
@synthesize majorThirdButton;
@synthesize fourthButton;
@synthesize fifthButton;
@synthesize minorSixthButton;
@synthesize majorSixthButton;
@synthesize minorSeventhButton;
@synthesize majorSeventhButton;
@synthesize octaveButton;

@synthesize hasScoreAlreadyBeenSet;
@synthesize hasNumberAlreadyBeenSet;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [NSString stringWithFormat:@"%@/aMajorScale.mp3", [[NSBundle mainBundle] resourcePath] ];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if(!hasScoreAlreadyBeenSet) {
        score = 1000;
        self.scoreLabel.text = @"1000";
    }
    else {
        self.scoreLabel.text = [NSString stringWithFormat:@"%ld", score];
    }
    if(!hasNumberAlreadyBeenSet) {
        problemNumber = 0;
        self.problemNumberLabel.text = @"0/10";
    }
    else {
        self.problemNumberLabel.text = [NSString stringWithFormat:@"%ld/10", problemNumber];
    }
    
    //randomly select base note
    //randomly select interval from base note
    correctAnswer = @"MinorSecond";
    
    

    //AVAudioPlayer *player;
}

-(IBAction)playSound:(id)sender {
    [_audioPlayer play];
    NSTimer *scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(aTime) userInfo:nil repeats: YES];
}

-(void)aTime {
    if(score == 0) {
        return;
    }
    score -= 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld", score];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"NextProblemSegue"]){
        [_audioPlayer stop];
        if(problemNumber == 10) {
            MainMenuViewController *controller = (MainMenuViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MainMenuViewController"];
        }
        else {
            IntervalsViewController *controller = (IntervalsViewController *)segue.destinationViewController;
            controller.score = score;
            controller.hasScoreAlreadyBeenSet = YES;
            controller.problemNumber = problemNumber + 1;
            controller.hasNumberAlreadyBeenSet = YES;
        }
    }
    else if([segue.identifier isEqualToString:@"BackToMainMenuSegue"]) {
        [_audioPlayer stop];
        MainMenuViewController *controller = (MainMenuViewController *)segue.destinationViewController;
        
    }
}

-(void)choseCorrectly:(UIButton*) button {
    NSTimer *nextProblemTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(loadNextProblem) userInfo:nil repeats: NO];
}
-(void)choseWrongly:(UIButton*) button {
    score = 0;
    self.scoreLabel.text = @"0";
    NSTimer *nextProblemTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(loadNextProblem) userInfo:nil repeats: NO];

}

-(void)loadNextProblem {
    UIStoryboard *storyboard = self.storyboard;
    IntervalsViewController *main = [storyboard instantiateViewControllerWithIdentifier:@"IntervalsViewController"];
    [self presentViewController:main animated:YES completion:nil];
}

@end
