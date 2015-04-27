//
//  IntervalsLibraryViewController.m
//  TestPage
//
//  Created by MAC Book on 4/21/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#import "IntervalsLibraryViewController.h"
@import AVFoundation;

@interface LibraryViewController ()

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
@synthesize fifthButton;
@synthesize minorSixthButton;
@synthesize majorSixthButton;
@synthesize minorSeventhButton;
@synthesize majorSeventhButton;
@synthesize octaveButton;

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
    
    NSLog(@"DONE");
    //AVAudioPlayer *player;
}

-(IBAction)touchUpInside:(UIButton*)sender {
    if(sender == backButton) {
        UIStoryboard *storyboard = self.storyboard;
        LibraryViewController *main = [storyboard instantiateViewControllerWithIdentifier:@"LibraryViewController"];
        [self presentViewController:main animated:YES completion:nil];
    }

}

@end
