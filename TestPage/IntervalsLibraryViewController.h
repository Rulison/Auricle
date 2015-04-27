//
//  LibraryViewController.h
//  TestPage
//
//  Created by MAC Book on 4/25/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#ifndef TestPage_IntervalsLibraryViewController_h
#define TestPage_IntervalsLibraryViewController_h

#import <UIKit/UIKit.h>
#import "MainMenuViewController.h"

@interface IntervalsLibraryViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UIButton *backButton;

@property (strong, nonatomic) IBOutlet UIButton *aButton;
@property (strong, nonatomic) IBOutlet UIButton *aSharpButton;
@property (strong, nonatomic) IBOutlet UIButton *bButton;
@property (strong, nonatomic) IBOutlet UIButton *cButton;
@property (strong, nonatomic) IBOutlet UIButton *cSharpButton;
@property (strong, nonatomic) IBOutlet UIButton *dButton;
@property (strong, nonatomic) IBOutlet UIButton *dSharpButton;
@property (strong, nonatomic) IBOutlet UIButton *eButton;
@property (strong, nonatomic) IBOutlet UIButton *fButton;
@property (strong, nonatomic) IBOutlet UIButton *fSharpButton;
@property (strong, nonatomic) IBOutlet UIButton *gButton;
@property (strong, nonatomic) IBOutlet UIButton *gSharpButton;

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

@end

#endif
