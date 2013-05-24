//
//  MALDetailViewController.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALDetailViewController.h"
#import "MALSampleView.h"

@interface MALDetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (nonatomic, strong) NSMutableArray *sampleViewConstraints;

@end

@implementation MALDetailViewController

#pragma mark - Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if ( !self ) {
    return nil;
  }
  
  _sampleViewConstraints = [@[] mutableCopy];
  
  return self;
}

- (void)setSampleView:(MALSampleView *)sampleView {
  if ( _sampleView != sampleView ) {
    if ( self.sampleViewConstraints.count ) {
      [self.view removeConstraints:self.sampleViewConstraints];
      [self.sampleViewConstraints removeAllObjects];
    }
    [_sampleView removeFromSuperview];
    _sampleView = sampleView;
    [self configureSampleView];
  }
  
  [self.masterPopoverController dismissPopoverAnimated:YES];
}

- (void)configureSampleView {
  if ( self.sampleView && !self.sampleView.superview ) {
    [self.view addSubview:self.sampleView];
    TMALVariableBindingsAMNO( _sampleView );
    TMAL_ADDA_VISUAL( self.sampleViewConstraints, @"H:|[_sampleView]|" );
    TMAL_ADDA_VISUAL( self.sampleViewConstraints, @"V:|[_sampleView]|" );
    [self.view addConstraints:self.sampleViewConstraints];
    
    self.navigationItem.rightBarButtonItems = self.sampleView.rightButtonItems;
    self.navigationItem.title = [[self.sampleView class] sampleName];
    
    [self.sampleView didDisplaySampleView];
  }
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self configureSampleView];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
  [self.sampleView willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
  [self.sampleView didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController {
  barButtonItem.title = NSLocalizedString(@"Samples", nil);
  [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
  self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
  [self.navigationItem setLeftBarButtonItem:nil animated:YES];
  self.masterPopoverController = nil;
}

@end
