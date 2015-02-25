//
//  TableViewController.m
//  MyApps
//
//  Created by Guilherme Ferreira de Souza on 2/25/15.
//  Copyright (c) 2015 Guilherme Ferreira de Souza. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "AppDetailViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _Nome = [[NSMutableArray alloc] initWithObjects: @"Contador", @"Quiz", @"Bricando com Fontes", @"MyApps", nil];
    _Categoria = [[NSMutableArray alloc] initWithObjects: @"Ferramentas", @"Entretenimento", @"Aprendizado", @"Business", nil];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f); //Abaixa cells
    
    _Imagem = [[NSMutableArray alloc]initWithObjects:@"contador", @"quiz", @"fonts", @"myapps", nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    
    //_imgFotoApp.image = [UIImage imageNamed:_appDetailModel[2]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _Nome.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppTableCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    long row = [indexPath row];
    
    cell.lblNome.text = _Nome[row];
    cell.lblCategoria.text = _Categoria[row];
    cell.imgView.image = [UIImage imageNamed:_Imagem[row]];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [_Nome removeObjectAtIndex:[indexPath row]];
        [_Categoria removeObjectAtIndex:[indexPath row]];
        [_Imagem removeObjectAtIndex:[indexPath row]];
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (IBAction)addApp:(id)sender {
    
    
    [self.tableView reloadData];
}
- (IBAction)editTable:(id)sender {
    [self.tableView setEditing: YES];
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {

    // É assim que faz pra mover by: noone
//    NSString *aux = [_Nome objectAtIndex:[fromIndexPath row]];
//    [_Nome removeObjectAtIndex:fromIndexPath.row];
//    [_Nome insertObject:aux atIndex:toIndexPath.row];
//    
    
    
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"ShowAppDetails"]) {
        
        AppDetailViewController *detailViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        long row = [myIndexPath row];
        
        detailViewController.appDetailModel = @[_Nome[row], _Categoria[row], _Imagem[row]];
    }

}


@end
