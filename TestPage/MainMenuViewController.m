//
//  DataViewController.m
//  TestPage
//
//  Created by MAC Book on 4/21/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#import "MainMenuViewController.h"
@import AVFoundation;

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize titleLabel;
@synthesize chordsButton;
@synthesize libraryButton;
@synthesize intervalsButton;
@synthesize optionsButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //self.dataLabel.text = [self.dataObject description];
    self.titleLabel.text = @"AURICLE";
    [self.chordsButton setTitle:@"Chords" forState: UIControlStateNormal];
    [self.libraryButton setTitle:@"Library" forState: UIControlStateNormal];
    [self.intervalsButton setTitle:@"Intervals" forState: UIControlStateNormal];
    [self.optionsButton setTitle:@"Options" forState: UIControlStateNormal];
    NSLog(@"DONE");
    //AVAudioPlayer *player;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"IntervalsSegue"]){
        IntervalsViewController *controller = (IntervalsViewController *)segue.destinationViewController;
        controller.score = 1000;
        controller.problemNumber = 1;
        controller.hasScoreAlreadyBeenSet = YES;
        controller.hasNumberAlreadyBeenSet = YES;
    }
}

-(IBAction)touchUpInside:(UIButton*)sender {
    if(sender == chordsButton) {
        NSLog(@"Chords");
    }
    /*else if (sender == intervalsButton) {
        NSLog(@"Intervals");
        UIStoryboard *storyboard = self.storyboard;
        IntervalsViewController *lib = [storyboard instantiateViewControllerWithIdentifier:@"IntervalsViewController"];
        [self presentViewController:lib animated:YES completion:nil];

    }*/
    else if (sender == optionsButton) {
        NSLog(@"Options");
    }
    else if (sender == libraryButton) {
        NSLog(@"Library");
        /*UIStoryboard *storyboard = self.storyboard;
        LibraryViewController *lib = [storyboard instantiateViewControllerWithIdentifier:@"LibraryViewController"];
        [self presentViewController:lib animated:YES completion:nil];*/
    }
}

@end
