gst
//
//  HRDoctorsViewController.m
//  HReader
//
//  Created by Marshall Huss on 12/2/11.
//  Copyright (c) 2011 MITRE Corporation. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "HRDoctorsViewController.h"
#import "HRPatientSwipeControl.h"
#import "HRMPatient.h"
#import "HRProviderView.h"
#import "HRImageAppletTile.h"
#import "HRPeoplePickerViewController.h"

#import "NSArray+Collect.h"

#import "SVPanelViewController.h"

@interface HRDoctorsViewController ()
- (void)reloadData;
- (void)reloadDataAnimated;
@end

@implementation HRDoctorsViewController {
    NSArray * __strong __providerViews;
}

@synthesize nameLabel       = __nameLabel;
@synthesize gridTableView   = __gridTableView;
@synthesize patientImageView = __patientImageView;

#pragma mark - object methods

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.title = @"Providers";
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(patientDidChange:)
         name:HRPatientDidChangeNotification
         object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:HRPatientDidChangeNotification
     object:nil];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // load patient swipe
//    HRPatientSwipeControl *swipe = [HRPatientSwipeControl
//                                    controlWithOwner:self
//                                    options:nil 
//                                    target:self
//                                    action:@selector(patientChanged:)];
//    [self.view addSubview:swipe];
    
    CALayer *layer = self.patientImageView.layer;
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowOpacity = 0.35;
    layer.shadowOffset = CGSizeMake(0.0, 1.0);
    layer.shadowRadius = 5.0;
    layer.shouldRasterize = YES;
    layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
    // reload
    [self reloadData];
    
    // swipe gesture
    {
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didReceiveRightSwipe:)];
        swipeGesture.numberOfTouchesRequired = 1;
        swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
        [self.patientImageView addGestureRecognizer:swipeGesture];
    }
    {
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didReceiveLeftSwipe:)];
        swipeGesture.numberOfTouchesRequired = 1;
        swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        [self.patientImageView addGestureRecognizer:swipeGesture];
    }
    
}

- (void)viewDidUnload {
    self.nameLabel = nil;
    self.gridTableView = nil;
    self.patientImageView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#pragma mark - NSNotificationCenter

- (void)patientDidChange:(NSNotification *)sender {
    [self reloadDataAnimated];
}

#pragma mark - grid table view delegate

- (NSInteger)numberOfViewsInGridView:(HRGridTableView *)gridView {
    return [__providerViews count];
}

- (NSArray *)gridView:(HRGridTableView *)gridView viewsInRange:(NSRange)range {
    return [__providerViews subarrayWithRange:range];
}

- (void)gridView:(HRGridTableView *)gridView didSelectViewAtIndex:(NSInteger)index {
    HRAppletTile *tile = [__providerViews objectAtIndex:index];
    CGRect rect = [self.view convertRect:tile.bounds fromView:tile];
    [tile didReceiveTap:self inRect:rect];
}

#pragma mark - private methods

- (void)reloadDataAnimated {
    [UIView animateWithDuration:0.4 animations:^{
        self.nameLabel.alpha = 0.0;
        self.gridTableView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self reloadData];
        [UIView animateWithDuration:0.4 animations:^{
            self.nameLabel.alpha = 1.0;
            self.gridTableView.alpha = 1.0;
        }];
    }];       
}

- (void)reloadData {
    
    // initial setup
    HRMPatient *patient = [(id)self.panelViewController.leftAccessoryViewController selectedPatient];
//    NSArray *providers = [[HRMPatient selectedPatient] valueForKeyPath:@"syntheticInfo.providers"];
//    NSMutableArray *views = [[NSMutableArray alloc] initWithCapacity:[providers count]];
//    UINib *nib = [UINib nibWithNibName:@"HRProviderView" bundle:nil];
    self.nameLabel.text = [[patient compositeName] uppercaseString];
    self.patientImageView.image = [patient patientImage];
    
    // configure views
    
    // health gateway
    // Loading mockups by file name convention
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (int i = 0; i < 6; i++) {
        NSString *imagePrefix = [NSString stringWithFormat:@"%@-%d", [patient initials], i];
        NSDictionary *userInfo = 
        [NSDictionary dictionaryWithObjectsAndKeys:
         [NSString stringWithFormat:@"%@-tile", imagePrefix], @"tile_image", 
         [NSString stringWithFormat:@"%@-overview", imagePrefix], @"fullscreen_image",
         nil];
        HRImageAppletTile *tile = [HRImageAppletTile tileWithPatient:patient userInfo:userInfo];
        [views addObject:tile];
    }

    /*
    NSArray *imagePrefixes = [NSArray arrayWithObjects:@"dentist", @"insurance", @"pharmacy", nil];
    NSMutableArray *imageApplets = [[NSMutableArray alloc] initWithCapacity:[imagePrefixes count]];
    [imagePrefixes enumerateObjectsUsingBlock:^(NSString *imagePrefix, NSUInteger idx, BOOL *stop) {
        NSDictionary *userInfo = 
        [NSDictionary dictionaryWithObjectsAndKeys:
         [NSString stringWithFormat:@"%@-summary", imagePrefix], @"tile_image", 
         [NSString stringWithFormat:@"%@-overview", imagePrefix], @"fullscreen_image",
         nil];
        HRImageAppletTile *tile = [HRImageAppletTile tileWithPatient:patient userInfo:userInfo];
        [imageApplets addObject:tile];
    }];
     */

    
    // providers
    /*
    [providers enumerateObjectsUsingBlock:^(NSDictionary *provider, NSUInteger idx, BOOL *stop) {
        HRProviderView *view = [[nib instantiateWithOwner:self options:nil] lastObject];
        view.specialityLabel.text = [provider objectForKey:@"speciality"];
        view.nameLabel.text = [NSString stringWithFormat:@"%@ %@ %@",
                               [provider objectForKey:@"title"],
                               [provider objectForKey:@"first_name"],
                               [provider objectForKey:@"last_name"]];
        view.organizationLabel.text = [provider objectForKey:@"organization"];
        view.phoneNumberLabel.text = [provider objectForKey:@"phone_number"];
        view.addressLabel.text = [NSString stringWithFormat:@"%@\n%@ %@",
                                  [provider objectForKey:@"street"],
                                  [provider objectForKey:@"city"],
//                                  [provider objectForKey:@"state"],
                                  [provider objectForKey:@"zip"]];
        [views addObject:view];
    }];
     */
    
    // save and reload
    __providerViews = views;
    [self.gridTableView reloadData];
    
}

#pragma mark - gestures

- (void)didReceiveLeftSwipe:(UISwipeGestureRecognizer *)swipe {
    if (swipe.state == UIGestureRecognizerStateRecognized) {
        [(id)self.panelViewController.leftAccessoryViewController selectNextPatient];
    }
}
- (void)didReceiveRightSwipe:(UISwipeGestureRecognizer *)swipe {
    if (swipe.state == UIGestureRecognizerStateRecognized) {
        [(id)self.panelViewController.leftAccessoryViewController selectPreviousPatient];
    }
}

@end
