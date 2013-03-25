//
//  MasterViewController.m
//  ParseJsonDemo
//
//  Created by wu liang on 3/25/13.
//  Copyright (c) 2013 wu liang. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "ClientApi.h"
#import "HUD.h"
#import "Loan.h"

@interface MasterViewController () {
    NSMutableArray<Loan>* _loans;
}
@end

@implementation MasterViewController
ClientApi* clientApi;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *reloadButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadLoans:)];
    self.navigationItem.rightBarButtonItem = reloadButton;
    
    //show loader view
    [HUD showUIBlockingIndicatorWithText:@"Fetching JSON"];
    clientApi = [ClientApi getInstance];
    
    _loans = [NSMutableArray arrayWithArray:clientApi.fetchFeed.loans];
    
    //fetch the feed
//    while (_loans == nil || _loans.count == 0)
//    {
//        [NSThread sleepForTimeInterval:1.0f];
//        [self reloadLoansFormApi];
//        NSLog(@"sleep ");
//    }
    [self performSelector:@selector(checkLoad) withObject:self afterDelay:1.0f];
    
    
    //json fetched
    NSLog(@"loans: %@", _loans);
    
    
}

-(void) checkLoad
{
    [self reloadLoansFormApi];
    if (_loans == nil || _loans.count == 0)
    {
        [self performSelector:@selector(checkLoad) withObject:self afterDelay:1.0f];
    } else
    {
        NSLog(@"size %d", _loans.count);
        [self.tableView reloadData];
        //hide the loader view
        [HUD hideUIBlockingIndicator];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadLoansFormApi
{
    _loans = [NSMutableArray arrayWithArray:clientApi.kivaFeed.loans];
}

- (void)reloadLoans:(id)sender
{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//
    [HUD showUIBlockingIndicatorWithText:@"Fetching JSON"];
    [self reloadLoansFormApi];
    [self.tableView reloadData];
    [HUD hideUIBlockingIndicator];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return _objects.count;
    return _loans.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    //NSDate *object = _objects[indexPath.row];
    //cell.textLabel.text = [object description];
    Loan* loan = _loans[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%d %@ from %@", indexPath.row,
                           loan.name, loan.location.country
                           ];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_loans removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Loan *object = _loans[indexPath.row];
        NSLog(@"Loan at %d, %@", indexPath.row, object);
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
