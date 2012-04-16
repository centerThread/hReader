//
//  HRBloodPressueAppletTile.m
//  HReader
//
//  Created by Marshall Huss on 4/16/12.
//  Copyright (c) 2012 MITRE Corporation. All rights reserved.
//

#import "HRBloodPressureAppletTile.h"
#import "HRMEntry.h"
#import "HRSparkLineView.h"
#import "HRKeyValueTableViewController.h"

#import "NSDate+FormattedDate.h"
#import "NSArray+Collect.h"

@implementation HRBloodPressureAppletTile {
@private
    UIPopoverController * __strong __popoverController;
    NSArray * __strong __systolicDataPoints;
    NSArray * __strong __diastolicDataPoints;
}

@synthesize resultLabel     = __resultLabel;
@synthesize dateLabel       = __dateLabel;
@synthesize normalLabel     = __normalLabel;

@synthesize sparkLineView   = __sparkLineView;


- (void)tileDidLoad {
    [super tileDidLoad];
    
    __systolicDataPoints = [self.patient vitalSignsWithEntryType:@"systolic blood pressure"];
    __diastolicDataPoints = [self.patient vitalSignsWithEntryType:@"diastolic blood pressure"];

    
    HRMEntry *lastestSystolic = [__systolicDataPoints lastObject];
    HRMEntry *lastestDiastolic = [__diastolicDataPoints lastObject];
    
    // set labels
    self.resultLabel.adjustsFontSizeToFitWidth = YES;
    float lastestSystolicValue = [[lastestSystolic valueForKeyPath:@"value.scalar"] floatValue];
    float lastestDiastolicValue = [[lastestDiastolic valueForKeyPath:@"value.scalar"] floatValue];
    self.resultLabel.text = [NSString stringWithFormat:@"%.0f/%.0f", lastestSystolicValue, lastestDiastolicValue];
    self.dateLabel.text = [lastestSystolic.date shortStyleDate];
    self.dateLabel.adjustsFontSizeToFitWidth = YES;
    self.normalLabel.adjustsFontSizeToFitWidth = YES;
    
    // sparkline
    self.sparkLineView.dataValues = [self scalarValuesForEntries:__systolicDataPoints];
    
    // display normal value
    float val = [[lastestSystolic valueForKeyPath:@"value.scalar"] floatValue];
    if ([self isValueNormal:val]) {
        self.resultLabel.textColor = [UIColor blackColor];
    } else {
        self.resultLabel.textColor = [HRConfig redColor];
    }
    
}

- (void)didReceiveTap:(UIViewController *)sender inRect:(CGRect)rect {
    UITableViewController *controller = [[HRKeyValueTableViewController alloc] initWithDataPoints:[self dataPoints]];
    controller.title = @"BMI";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    if (__popoverController == nil) {
        __popoverController = [[UIPopoverController alloc] initWithContentViewController:navController];
    }
    else {
        __popoverController.contentViewController = navController;
    }
    [__popoverController
     presentPopoverFromRect:rect
     inView:sender.view
     permittedArrowDirections:UIPopoverArrowDirectionAny
     animated:YES];
}

#pragma mark - notifications

- (void)applicationDidEnterBackground {
    [__popoverController dismissPopoverAnimated:NO];
}


#pragma mark - private

- (NSArray *)dataPoints {
    NSMutableArray *points = [NSMutableArray arrayWithCapacity:[__systolicDataPoints count]];
    [__systolicDataPoints enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(HRMEntry *entry, NSUInteger index, BOOL *stop) {
        double value = [[entry.value objectForKey:@"scalar"] doubleValue];
        BOOL isNormal = [self isValueNormal:value];
        UIColor *color = isNormal ? [UIColor blackColor] : [HRConfig redColor];
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSString stringWithFormat:@"%0.1f", value], @"detail",
                                    [entry.date mediumStyleDate], @"title",
                                    color, @"detail_color",
                                    nil];
        [points addObject:dictionary];
    }];
    return [points copy];
}

- (NSArray *)scalarValuesForEntries:(NSArray *)entries {
    NSArray *scalarStrings = [__systolicDataPoints valueForKeyPath:@"value.scalar"];
    NSArray *scalars = [scalarStrings collect:^(id object, NSUInteger idx) {
        if ([object isKindOfClass:[NSString class]]) {
            float value = [object floatValue];
            return [NSNumber numberWithDouble:value];
        }
        else {
            return [NSNumber numberWithDouble:0.0];
        }
    }];
    return scalars;
}

- (double)normalLow {
    return 90.0;
}

- (double)normalHigh {
    return 119.0;
}

- (BOOL)isValueNormal:(double)value {
    double normalLow = [self normalLow];
    double normalHigh = [self normalHigh];
    if (normalLow == normalHigh) {
        return YES;
    }
    else {
        return !(value < normalLow || value > normalHigh);    
    }
}

@end
