//
//  NatinfTableViewController.m
//  NatinfList
//
//  Created by Pascal on 18/07/14.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import "NatinfTableViewController.h"
#import "NatinfClass.h"
#import "CustomeCell.h"
#import "NatinfDetailViewController.h"

@interface NatinfTableViewController ()

@end

@implementation NatinfTableViewController {
    
    NSArray *natinfRawArray;
    NSArray *searchResults;
    NSMutableArray *natinfArray;
    
}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];

    NSUserDefaults *prefs;
    prefs = [NSUserDefaults standardUserDefaults];
    _valueSwitch = [prefs boolForKey:@"modeRecherche"];
    NSLog(@"mode recherche %hhd", _valueSwitch);
    
    if (_valueSwitch == true) {
        self.searchDisplayController.searchBar.placeholder = @"Saisir une ou plusieurs lettres";
        self.searchDisplayController.searchBar.keyboardType = UIKeyboardTypeDefault;
    } else {
    
     self.searchDisplayController.searchBar.placeholder = @"Saisir un ou plusieurs chiffres";
     self.searchDisplayController.searchBar.keyboardType = UIKeyboardTypeNumberPad; }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Set this in every view controller so that the back button displays back instead of the root view controller name
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

    natinfRawArray = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"natinfdb" ofType:@"plist"]];
    natinfArray = [[NSMutableArray alloc]initWithCapacity:900];
    
    for (NSDictionary *natinfsList in natinfRawArray) {
        NatinfClass *natinfClass = [[NatinfClass alloc]initWithDictionnary:natinfsList];
        [natinfArray addObject:natinfClass];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView ==self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    }
    else {
        return [natinfArray count];
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *cellIdentifier = @"cellCustome";
   CustomeCell *cell = (CustomeCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[CustomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NatinfClass *natinfClass = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        natinfClass = [searchResults objectAtIndex:indexPath.row];
        
    } else {
        natinfClass = [natinfArray objectAtIndex:indexPath.row];
    }
   
    cell.libelleInfraction.text = natinfClass.libelleInfractionClass;
    cell.natinfInfraction.text = [NSString stringWithFormat:@"%@", natinfClass.natinfInfractionClass];
    cell.categorieInfraction.text = natinfClass.categorieInfractionClass;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    if (_valueSwitch == true) {
        NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"self.libelleInfractionClass contains[cd] %@", searchText];
        searchResults = [natinfArray filteredArrayUsingPredicate:resultPredicate];
        
    } else {
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"self.natinfInfractionClass == %d", [searchText intValue]];
    searchResults = [natinfArray filteredArrayUsingPredicate:resultPredicate];
        
       
     NSLog(@"valeur de prompt %@", self.searchDisplayController.searchBar.prompt);
    }
   
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
    if ([segue.identifier isEqualToString:@"detailVue"]) {
             
        NSIndexPath *indexPath = nil;
        NatinfClass *natinfClass = nil;
        
        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            natinfClass = [searchResults objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            natinfClass = [natinfArray objectAtIndex:indexPath.row];
        }
        
        NatinfDetailViewController *destViewController = segue.destinationViewController;
        destViewController.natinf = natinfClass;

        
    }
}

@end
