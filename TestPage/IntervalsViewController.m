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
    AVQueuePlayer *_audioPlayer;
    NSUInteger _correctNumHalfSteps;
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
@synthesize augmentedFourthButton;
@synthesize fifthButton;
@synthesize minorSixthButton;
@synthesize majorSixthButton;
@synthesize minorSeventhButton;
@synthesize majorSeventhButton;
@synthesize octaveButton;

@synthesize hasScoreAlreadyBeenSet;
@synthesize hasNumberAlreadyBeenSet;

@synthesize lowSoundUrl;
@synthesize highSoundUrl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *lowNotes = [NSArray arrayWithObjects: @"A", @"Bb", @"B", @"C", @"Db", @"D", @"Eb", @"E", @"F", @"Gb", @"G", @"Ab", nil];
    NSUInteger randomIndex = arc4random() % [lowNotes count];
    NSLog(@"%lu",(unsigned long)randomIndex);
    NSString *bottomNote = lowNotes[randomIndex];
    NSUInteger randomNumSteps = arc4random() % 12 + 1;
    
    NSUInteger unwrappedTopIndex = randomIndex + randomNumSteps;
    NSUInteger topIndex = (randomIndex + randomNumSteps) % 12;
    _correctNumHalfSteps = randomNumSteps;
    NSLog(@"%lu",(unsigned long)topIndex);
    NSString *highNote = lowNotes[topIndex];
    NSString *lowPath = [NSString stringWithFormat:@"%@/low%@.mp3", [[NSBundle mainBundle] resourcePath], bottomNote ];
    NSString *highPath;
    if(unwrappedTopIndex == topIndex) {
        highPath = [NSString stringWithFormat:@"%@/low%@.mp3", [[NSBundle mainBundle] resourcePath], highNote ];
    }
    else {
        highPath = [NSString stringWithFormat:@"%@/high%@.mp3", [[NSBundle mainBundle] resourcePath], highNote ];
    }
    lowSoundUrl = [NSURL fileURLWithPath:lowPath];
    highSoundUrl = [NSURL fileURLWithPath:highPath];
    NSArray *possibleAnswers = [NSArray arrayWithObjects: @"minorSecond", @"majorSecond", @"minorThird", @"majorThird", @"fourth",@"augmentedFourth", @"fifth", @"minorSixth", @"majorSixth", @"minorSeventh", @"majorSeventh", @"octave", nil];
    NSLog(@"%lu", (unsigned long)randomNumSteps);
    correctAnswer = possibleAnswers[randomNumSteps-1];
    NSLog(correctAnswer);

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

    

}
-(void)stop {
    [_audioPlayer pause];
}

-(IBAction)playSound:(id)sender {

    AVPlayerItem *lowItem = [AVPlayerItem playerItemWithURL: lowSoundUrl];
    AVPlayerItem *highItem = [AVPlayerItem playerItemWithURL: highSoundUrl];
    NSArray *notes = [NSArray arrayWithObjects:lowItem, highItem, nil];
    _audioPlayer = [AVQueuePlayer queuePlayerWithItems: notes];
    [_audioPlayer play];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(stop) userInfo:nil repeats: NO];
    NSTimer *scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(aTime) userInfo:nil repeats: YES];
    [_audioPlayer play];
    [_audioPlayer seekToTime:CMTimeMakeWithSeconds(0, 1)];
    //[_audioPlayer pause];
}

-(void)aTime {
    if(score == 0) {
        return;
    }
    score -= 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld", score];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"BackToMainMenuSegue"]) {
        [_audioPlayer pause];
        MainMenuViewController *controller = (MainMenuViewController *)segue.destinationViewController;
        
    }
    else {
        [_audioPlayer pause];
            IntervalsViewController *controller = (IntervalsViewController *)segue.destinationViewController;
            controller.score = score;
            controller.hasScoreAlreadyBeenSet = YES;
            controller.problemNumber = problemNumber + 1;
            controller.hasNumberAlreadyBeenSet = YES;
        
    }
    
}

-(IBAction)showAnswer:(UIButton*)button {
    NSLog(correctAnswer);
    NSLog(button.currentTitle);
    if([correctAnswer isEqualToString:@"minorSecond"] && button == minorSecondButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"majorSecond"] && button == majorSecondButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"minorThird"] && button == minorThirdButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"majorThird"] && button == majorThirdButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"perfectFourth"] && button == fourthButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"augmentedFourth"] && button == augmentedFourthButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"perfectFifth"] && button == fifthButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"minorSixth"] && button == minorSixthButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"majorSixth"] && button == majorSixthButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"minorSeventh"] && button == minorSeventhButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"majorSeventh"] && button == majorSeventhButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else if([correctAnswer isEqualToString:@"octave"] && button == octaveButton) {
        [button setBackgroundColor:[UIColor greenColor]];
    }
    else {
        [button setBackgroundColor:[UIColor redColor]];
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
