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
#import "App.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //_Nome = [[NSMutableArray alloc] initWithObjects: @"Contador", @"Quiz", @"Bricando com Fontes", @"MyApps", nil];
    //_Categoria = [[NSMutableArray alloc] initWithObjects: @"Ferramentas", @"Entretenimento", @"Aprendizado", @"Business", nil];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f); //Abaixa cells
    
    //_Imagem = [[NSMutableArray alloc]initWithObjects:@"contador", @"quiz", @"fonts", @"myapps", nil];
    
    
    App *app1 = [[App alloc] initWithNome:@"Contador" andCateg:@"Ferramentas" andImg:@"contador"];
    App *app2 = [[App alloc] initWithNome:@"Quiz" andCateg:@"Entretenimento" andImg:@"quiz"];
    App *app3 = [[App alloc] initWithNome:@"Bricando com Fontes" andCateg:@"Aprendizado" andImg:@"fonts"];
    App *app4 = [[App alloc] initWithNome:@"MyApps" andCateg:@"Business" andImg:@"myapps"];
    
    _apps = [[NSMutableArray alloc] initWithObjects:app1, app2, app3, app4, nil];
    
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideWithGestureRecognizer:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;      //To right
    [self.view addGestureRecognizer:swipe];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    
    //_imgFotoApp.image = [UIImage imageNamed:_appDetailModel[2]];
}

- (void)slideWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{   //Ativa edicao com swipe
    self.editing = YES;
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
    return _apps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppTableCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    long row = [indexPath row];
    
    cell.lblNome.text = [_apps[row] nome];
    cell.lblCategoria.text = [_apps[row] categoria];
    cell.imgView.image = [UIImage imageNamed:[_apps[row] imagem] ];
    
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
        
        [_apps removeObjectAtIndex:[indexPath row]];
        
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
    if (self.tableView.editing == YES){
        [self.tableView setEditing: NO];
    }
    else {
        [self.tableView setEditing: YES];
    }

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
        
        detailViewController.appDetailModel = @[ [_apps[row] nome], [_apps[row] categoria], [_apps[row] imagem] ];
    }

}


@end
