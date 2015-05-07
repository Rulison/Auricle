//
//  IntervalsLibraryViewController.m
//  TestPage
//
//  Created by MAC Book on 4/21/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#import "IntervalsLibraryViewController.h"
@import AVFoundation;

@interface IntervalsLibraryViewController () {
    NSArray *_buttons;
    NSArray *_intervals;
    AVQueuePlayer *_audioPlayer;
}

@end

@implementation IntervalsLibraryViewController

@synthesize titleLabel;
@synthesize backButton;

@synthesize aButton;
@synthesize aSharpButton;
@synthesize bButton;
@synthesize cButton;
@synthesize cSharpButton;
@synthesize dButton;
@synthesize dSharpButton;
@synthesize eButton;
@synthesize fButton;
@synthesize fSharpButton;
@synthesize gButton;
@synthesize gSharpButton;

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

@synthesize selectedButton;

@synthesize notes;
@synthesize possibleAnswers;

- (void)viewDidLoad {
    [super viewDidLoad];
    _buttons = [NSArray arrayWithObjects:aButton, aSharpButton, bButton, cButton, cSharpButton, dButton, dSharpButton, eButton, fButton, fSharpButton, gButton, gSharpButton, nil];
    _intervals = [NSArray arrayWithObjects:minorSecondButton, majorSecondButton, minorThirdButton, majorThirdButton, fourthButton, augmentedFourthButton, fifthButton, minorSixthButton, majorSixthButton, minorSeventhButton, majorSeventhButton, octaveButton, nil];
    notes = [NSArray arrayWithObjects: @"A", @"Bb", @"B", @"C", @"Db", @"D", @"Eb", @"E", @"F", @"Gb", @"G", @"Ab", nil];
    possibleAnswers = [NSArray arrayWithObjects: @"Minor 2nd", @"Major 2nd", @"Minor 3rd", @"Major 3rd", @"Perfect 4th",@"Augmented 4th", @"Perfect 5th", @"Minor 6th", @"Major 6th", @"Minor 7th", @"Major 7th", @"Octave", nil];
    for (id object in _intervals) {
        UIButton *button = (UIButton *) object;
        button.enabled = NO;
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

-(IBAction)selectRootNote:(UIButton*)button {
    for (id object in _intervals) {
        UIButton *button = (UIButton *) object;
        button.enabled = YES;
    }
    for (id object in _buttons) {
        [object setBackgroundColor: nil];
    }
    [button setBackgroundColor:[UIColor redColor]];
    selectedButton = button;
    NSLog(@"root %@", button.currentTitle);
}
-(IBAction)chooseInterval:(UIButton*)button {
    for (id object in _intervals) {
        [object setBackgroundColor: nil];
    }
    [button setBackgroundColor:[UIColor redColor]];
    //playNote(selectedButton.currentTitle, @"low");
    NSString *noteName = selectedButton.currentTitle;
    if([selectedButton.currentTitle isEqualToString:@"A#/Bb"]) {
        noteName = @"Bb";
    }
    else if([selectedButton.currentTitle isEqualToString:@"C#/Db"]) {
        noteName = @"Db";
    }
    else if([selectedButton.currentTitle isEqualToString:@"D#/Eb"]) {
        noteName = @"Eb";
    }
    else if([selectedButton.currentTitle isEqualToString:@"F#/Gb"]) {
        noteName = @"Gb";
    }
    else if([selectedButton.currentTitle isEqualToString:@"G#/Ab"]) {
        noteName = @"Ab";
    }
    NSString *lowString = [NSString stringWithFormat:@"%@/low%@.mp3", [[NSBundle mainBundle] resourcePath], noteName];
    NSLog(@"%@/low%@.mp3",[[NSBundle mainBundle] resourcePath],selectedButton.currentTitle);
    NSURL *lowURL = [NSURL fileURLWithPath:lowString];

    AVPlayerItem *lowItem = [AVPlayerItem playerItemWithURL:lowURL];
    int rootIndex = 0;
    int numHalfSteps = 0;
    for (int i=0;i<[notes count];i++) {
        if([notes[i] isEqualToString:noteName]) {
            rootIndex = i;
        }
    }
    for (int i=0;i<[possibleAnswers count];i++) {
        if([possibleAnswers[i] isEqualToString:button.currentTitle]) {
            numHalfSteps = i+1;
        }
    }
    int unwrappedTopIndex = rootIndex + numHalfSteps;
    int topIndex = (rootIndex + numHalfSteps) % 12;
    NSString *topNote = notes[topIndex];
    
    NSString *highString;
    if(topIndex == unwrappedTopIndex) {
        //playNote(notes[topIndex], true);
        highString = [NSString stringWithFormat:@"%@/low%@.mp3", [[NSBundle mainBundle] resourcePath], topNote];
    }
    else {
        //playNote(notes[topIndex], false);
        highString = [NSString stringWithFormat:@"%@/high%@.mp3", [[NSBundle mainBundle] resourcePath], topNote];
    }
    NSURL *highURL = [NSURL fileURLWithPath:highString];
    AVPlayerItem *highItem = [AVPlayerItem playerItemWithURL:highURL];
    _audioPlayer = [AVQueuePlayer queuePlayerWithItems:[NSArray arrayWithObjects:lowItem, highItem, nil]];
    [_audioPlayer play];
    NSLog(@"Interval %@", button.currentTitle);
    
}

@end
