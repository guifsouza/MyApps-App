//
//  TableViewController.h
//  MyApps
//
//  Created by Guilherme Ferreira de Souza on 2/25/15.
//  Copyright (c) 2015 Guilherme Ferreira de Souza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

//@property NSMutableArray *Nome;
//@property NSMutableArray *Categoria;
//@property NSMutableArray *Imagem;

@property NSMutableArray *apps;

- (void)slideWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer;
- (void)slideRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer;

@end
