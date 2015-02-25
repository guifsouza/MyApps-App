//
//  AppDetailViewController.h
//  MyApps
//
//  Created by Guilherme Ferreira de Souza on 2/25/15.
//  Copyright (c) 2015 Guilherme Ferreira de Souza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblNomeApp;
@property (weak, nonatomic) IBOutlet UILabel *lblCategoria;
@property (weak, nonatomic) IBOutlet UIImageView *imgFotoApp;

@property (strong, nonatomic) NSArray *appDetailModel;

- (void)slideToDownWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer;

@end
