//
//  ViewController.m
//  XCTestLocalization
//
//  Created by Ellen Shapiro on 3/21/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import "ViewController.h"
#import "DNSLocalizedStrings.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSLog(@"Watch out: %@\nOK: %@\nFish: %@",
          [DNSLocalizedStrings watchOut],
          [DNSLocalizedStrings ok],
          [DNSLocalizedStrings fish]);
}

@end
