//
//  DataViewController.h
//  TestPage
//
//  Created by MAC Book on 4/21/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibraryViewController.h"
#import "IntervalsViewController.h"

@interface MainMenuViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *chordsButton;
@property (strong, nonatomic) IBOutlet UIButton *libraryButton;
@property (strong, nonatomic) IBOutlet UIButton *intervalsButton;
@property (strong, nonatomic) IBOutlet UIButton *optionsButton;

@property (strong, nonatomic) id dataObject;

@end

