//
//  ViewControllerVichitanie.m
//  приложение умножение
//
//  Created by TROLLER KRUTOU on 14.11.15.
//  Copyright © 2015 VOVA@CRAFTER. All rights reserved.
//

#import "ViewControllerVichitanie.h"

@interface ViewControllerVichitanie ()

@property (assign, nonatomic) NSInteger oneChislo;
@property (assign, nonatomic) NSInteger twoChislo;
@property (assign, nonatomic) NSInteger rezultatIgroka;
@property (assign, nonatomic) NSInteger chet123;

@end

@implementation ViewControllerVichitanie

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.rezultat becomeFirstResponder];
    [self randomNumbers];
}

- (void)randomNumbers {
    self.oneChislo = arc4random() % 100 + 1;
    self.twoChislo = arc4random() % self.oneChislo;
    
    self.oneNumber.text = [NSString stringWithFormat:@"%ld", (long)self.oneChislo];
    self.twoNumber.text = [NSString stringWithFormat:@"%ld",(long)self.twoChislo];
}

- (IBAction)pokazatOtvet:(id)sender {
    self.rezultat.text = [NSString stringWithFormat:@"%ld",(long)self.oneChislo - self.twoChislo];
}

- (IBAction)proverit:(id)sender {
    self.rezultatIgroka = [self.rezultat.text intValue] ;
    if (self.rezultatIgroka == self.oneChislo - self.twoChislo) {
        self.repet.text = @"верно молодец!";
        self.chet123++;
        self.chet.text = [NSString stringWithFormat:@"%ld", (long)self.chet123];
    } else{
        self.repet.text = @"ошибка, попробуй еще раз";
    }
}

- (IBAction)next:(id)sender {
    self.repet.text = @"";
    self.rezultat.text = @"";
    [self randomNumbers];
}

@end
