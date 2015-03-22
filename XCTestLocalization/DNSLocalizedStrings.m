//
//  DNSLocalizedStrings.m
//  XCTestLocalization
//
//  Created by Ellen Shapiro on 3/22/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import "DNSLocalizedStrings.h"

@implementation DNSLocalizedStrings

+ (NSString *)ok
{
   return NSLocalizedString(@"OK", @"Something the same in English, French and Spanish");
}

+ (NSString *)watchOut
{
    return NSLocalizedString(@"Watch Out!", @"Something Different in English, French And Spanish");
}

+ (NSString *)fish
{
    return NSLocalizedString(@"Fish", @"Something present in English and Spanish, and missing in French");
}

@end
