//
//  XCTestLocalizationTests.m
//  XCTestLocalizationTests
//
//  Created by Ellen Shapiro on 3/21/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "XCTestCase+DNSiOSLocalization.h"

static NSString * const SPANISH = @"es";
static NSString * const ENGLISH = @"en";
static NSString * const FRENCH = @"fr";

@interface XCTestLocalizationTests : XCTestCase

@end

@implementation XCTestLocalizationTests

- (void)setUp
{
    [super setUp];
    NSString *passedInLanguageError =  [self dns_checkSimOrDeviceIsRunningPassedInLanguage];
    XCTAssertNil(passedInLanguageError, @"Error with sim: %@", passedInLanguageError);
}

- (void)testLocalizableDotStringsTranslationCheck
{
    NSString *language = [self dns_currentDeviceOrSimLanguage];
    
    NSArray *missingKeyErrors = [self dns_checkAllKeysInLocalizableStringsAreLocalizedWithDeveloperLanguageCode:nil
                                                                                           knownIdenticalValues:@[@"OK"]];
    
    if ([language isEqualToString:ENGLISH] || [language isEqualToString:SPANISH]) {
        XCTAssertNil(missingKeyErrors, @"There shouldn't be missing keys in english or spanish!");
    } else {
        XCTAssertNotNil(missingKeyErrors, @"There should be missing keys in french!");
    }
}

- (void)testFailingToPassIdenticalValuesBarfs
{
    NSString *language = [self dns_currentDeviceOrSimLanguage];
    NSArray *errors = [self dns_checkAllKeysInLocalizableStringsAreLocalizedWithDeveloperLanguageCode:nil knownIdenticalValues:nil];
    if ([language isEqualToString:ENGLISH]) {
        XCTAssertNil(errors, @"There should be no errors on the development language!");
    } else {
        XCTAssertNotNil(errors, @"There should be an error on OK!");
    }
}

- (void)testInfoPListDotStringsTranslationCheck
{
    NSString *language = [self dns_currentDeviceOrSimLanguage];
    
    NSString *bundleDisplayNameKey = @"CFBundleDisplayName";
    
    BOOL isTranslated = [self dns_isInfoPlistKeyValueLocalized:bundleDisplayNameKey];
    NSString *actual = [[NSBundle mainBundle] objectForInfoDictionaryKey:bundleDisplayNameKey];
    if ([language isEqualToString:FRENCH]) {
        XCTAssertTrue(isTranslated, @"Showing as not translated when it is!");
        XCTAssertTrue([actual isEqualToString:@"Français"], @"Translation didn't work");
    } else if ([language isEqualToString:SPANISH]) {
        XCTAssertFalse(isTranslated, @"Showing as translated when it isn't!");
        XCTAssertTrue([actual isEqualToString:@"Untranslated!"], @"Lack of translation worked!");
    } else if ([language isEqualToString:ENGLISH]) {
        XCTAssertTrue(isTranslated, @"Showing as not translated when it is!");
        XCTAssertTrue([actual isEqualToString:@"English"], @"Translation didn't work!");
    }
}

@end
