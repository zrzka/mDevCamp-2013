//
//  MALMasterViewController.m
//  Auto Layout Demo
//
//  Created by Robert Vojta on 24.05.13.
//  Copyright (c) 2013 Tapmates, Inc. All rights reserved.
//

#import "MALMasterViewController.h"
#import "MALDetailViewController.h"
#import "MALSampleView.h"

@interface MALMasterViewController()

@property (nonatomic,strong) NSArray *sampleViewClasses;

@end

@implementation MALMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if ( !self ) {
    return nil;
  }
  
  self.title = NSLocalizedString(@"Samples", @"Samples");
  self.clearsSelectionOnViewWillAppear = NO;
  self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
  
  return self;
}
							
- (void)viewDidLoad {
  [super viewDidLoad];

  NSMutableArray *samples = [@[] mutableCopy];
  for ( NSInteger i = 0 ; i < 100 ; i++ ) {
    Class sampleClass = NSClassFromString( [NSString stringWithFormat:@"MALSampleView%d", i] );
    if ( !sampleClass ) {
      continue;
    }
    [samples addObject:sampleClass];
  }

  self.sampleViewClasses = samples;
  [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.sampleViewClasses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"SampleViewCell";
    
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if ( !cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }

  Class sampleViewClass = self.sampleViewClasses[ indexPath.row ];
  cell.textLabel.text = [sampleViewClass sampleName];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Class sampleViewClass = self.sampleViewClasses[ indexPath.row ];
  self.detailViewController.sampleView = [[sampleViewClass alloc] initWithFrame:CGRectZero];
}

@end
