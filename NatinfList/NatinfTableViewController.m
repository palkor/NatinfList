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
    NSArray *natinfArray;
    NSMutableArray *natinfArrayAll;
    int numberSwitch;
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadPrefUser
{
    NSUserDefaults *prefs;
    prefs = [NSUserDefaults standardUserDefaults];
    _valueSwitch = [prefs boolForKey:@"modeRecherche"];
    _valueSwitchVitesse = [prefs boolForKey:@"vitesse"];
     NSLog(@"valeur prefs vitesse %i", _valueSwitchVitesse);
    _valueSwitchStationnement = [prefs boolForKey:@"stationnement"];
    _valueSwitchAutres = [prefs boolForKey:@"autres"];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self loadPrefUser];
    
    
    if (_valueSwitch == true) {
        self.searchDisplayController.searchBar.placeholder = @"Saisir une ou plusieurs lettres";
        self.searchDisplayController.searchBar.keyboardType = UIKeyboardTypeDefault;
    } else {
    
     self.searchDisplayController.searchBar.placeholder = @"Saisir un ou plusieurs chiffres";
     self.searchDisplayController.searchBar.keyboardType = UIKeyboardTypeNumberPad; }
    
    numberSwitch = 0;
    
    if (_valueSwitchVitesse == true) {
        numberSwitch = 1;
    }
    
    if (_valueSwitchStationnement == true) {
        numberSwitch = 2;

    }
    if (_valueSwitchAutres == true) {
        numberSwitch =3;
      
    }
    NSLog(@"valeur numbSwitch, %i",numberSwitch);
    [self stateSwitch:numberSwitch];
    
}

-(void)stateSwitch:(int)nmrSwitch
{
    switch (numberSwitch) {
        case 1:{
            NSPredicate *vitessePredicate = [NSPredicate predicateWithFormat:@"self.categorieInfractionClass == 'Vitesse'"];
            natinfArray = [natinfArrayAll filteredArrayUsingPredicate:vitessePredicate];
            NSLog(@"valeur de natinfArray cas 1 %lu", (unsigned long)[natinfArray count]);
        }

            break;
        case 2:{
            NSPredicate *vitessePredicate = [NSPredicate predicateWithFormat:@"self.categorieInfractionClass == 'Stationnement'"];
            natinfArray = [natinfArrayAll filteredArrayUsingPredicate:vitessePredicate];
             NSLog(@"valeur de natinfArray cas 2 %lu", (unsigned long)[natinfArray count]);
        }
            
            break;
            
        case 3:{
            NSPredicate *vitessePredicate = [NSPredicate predicateWithFormat:@"self.categorieInfractionClass == 'Autre'"];
            natinfArray = [natinfArrayAll filteredArrayUsingPredicate:vitessePredicate];
             NSLog(@"valeur de natinfArray cas 3 %lu", (unsigned long)[natinfArray count]);
        }
            break;
        default:
            natinfArray = natinfArrayAll;
             NSLog(@"valeur de natinfArray cas defaut %lu", (unsigned long)[natinfArray count]);
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadPrefUser];
    
   
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = YES;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Retour" style:UIBarButtonItemStylePlain target:nil action:nil];

    natinfRawArray = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"natinfdb" ofType:@"plist"]];
    natinfArrayAll = [[NSMutableArray alloc]initWithCapacity:900];
    
    for (NSDictionary *natinfsList in natinfRawArray) {
        NatinfClass *natinfClass = [[NatinfClass alloc]initWithDictionnary:natinfsList];
        [natinfArrayAll addObject:natinfClass];
           }
    
       /*
    if (_valueSwitchVitesse == true) {
        NSPredicate *vitessePredicate = [NSPredicate predicateWithFormat:@"self.categorieInfractionClass == 'Vitesse'"];
        natinfArray = [natinfArrayAll filteredArrayUsingPredicate:vitessePredicate];
        
    }
    */

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
