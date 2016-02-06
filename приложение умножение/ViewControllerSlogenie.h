//
//  ViewControllerSlogenie.h
//  приложение умножение
//
//  Created by TROLLER KRUTOU on 14.11.15.
//  Copyright © 2015 VOVA@CRAFTER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerSlogenie : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *oneNumber;
@property (weak, nonatomic) IBOutlet UILabel *twoNumber;
@property (weak, nonatomic) IBOutlet UILabel *znak;

@property (weak, nonatomic) IBOutlet UILabel *chet;
@property (weak, nonatomic) IBOutlet UITextField *rezultat;
@property (weak, nonatomic) IBOutlet UILabel *repet;

- (IBAction)pokazatOtvet:(id)sender;
- (IBAction)proverit:(id)sender;
- (IBAction)next:(id)sender;

@end
