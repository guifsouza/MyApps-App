//
//  TableViewCell.h
//  MyApps
//
//  Created by Guilherme Ferreira de Souza on 2/25/15.
//  Copyright (c) 2015 Guilherme Ferreira de Souza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblNome;
@property (weak, nonatomic) IBOutlet UILabel *lblCategoria;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
