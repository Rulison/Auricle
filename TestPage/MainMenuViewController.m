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
    //AVAudioPlayer *player;
}

@end