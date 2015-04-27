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

-(IBAction)touchUpInside:(UIButton*)sender {
    if(sender == backButton) {
        UIStoryboard *storyboard = self.storyboard;
        MainMenuViewController *main = [storyboard instantiateViewControllerWithIdentifier:@"MainMenuViewController"];
        [self presentViewController:main animated:YES completion:nil];
        //[self dismissModalViewControllerAnimated:YES];
    }
    else if(sender == playButton) {
        //play audio
        
        //start lowering score
    }
    else if(sender == minorSecondButton) {
        if([correctAnswer  isEqual: @"MinorSecond"]) {
            [self choseCorrectly:minorSecondButton];
        }
        else {
            [self choseWrongly:minorSecondButton];
        }
    }
    else if(sender == majorSecondButton) {
        /*if([correctAnswer  isEqual: @"MajorSecond"]) {
            [self choseCorrectly:majorSecondButton];
        }
        else {
            [self choseWrongly:majorSecondButton];
        }*/
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"NextProblemSegue"]){
        [_audioPlayer stop];
        IntervalsViewController *controller = (IntervalsViewController *)segue.destinationViewController;
        controller.score = score;
        controller.hasScoreAlreadyBeenSet = YES;
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
