//
//  ViewController.h
//  приложение умножение
//
//  Created by TROLLER KRUTOU on 03.11.15.
//  Copyright © 2015 VOVA@CRAFTER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *chet;
@property (weak, nonatomic) IBOutlet UILabel *oneNumber;
@property (weak, nonatomic) IBOutlet UILabel *twoNumber;
@property (weak, nonatomic) IBOutlet UILabel *znak;
@property (weak, nonatomic) IBOutlet UITextField *rezultat;
@property (weak, nonatomic) IBOutlet UILabel *repet;
@property (weak, nonatomic) IBOutlet UIImageView *smileImageView;

@property (weak, nonatomic) IBOutlet UILabel *recordPravilnihOtvetov;
@property (weak, nonatomic) IBOutlet UIView *otvetView;

@property (weak, nonatomic) IBOutlet UIView *proverit;

@property (weak, nonatomic) IBOutlet UIView *nextView;


- (IBAction)pokazatOtvet:(id)sender;
- (IBAction)proverit:(id)sender;
- (IBAction)next:(id)sender;




@end

