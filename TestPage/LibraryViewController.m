//
//  LibraryViewController.m
//  TestPage
//
//  Created by MAC Book on 4/21/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#import "LibraryViewController.h"
@import AVFoundation;

@interface LibraryViewController ()

@end

@implementation LibraryViewController

@synthesize titleLabel;
@synthesize backButton;
@synthesize intervalsButton;


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
        /*UIStoryboard *storyboard = self.storyboard;
        LibraryViewController *main = [storyboard instantiateViewControllerWithIdentifier:@"MainMenuViewController"];
        [self presentViewController:main animated:YES completion:nil];*/
    }
    else if(sender == intervalsButton ) {
        UIStoryboard *storyboard = self.storyboard;
        IntervalsLibraryViewController *main = [storyboard instantiateViewControllerWithIdentifier:@"IntervalsLibraryViewController"];
        [self presentViewController:main animated:YES completion:nil];
    }
}

@end
