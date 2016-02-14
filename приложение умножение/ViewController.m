//
//  ViewController.m
//  приложение умножение
//
//  Created by TROLLER KRUTOU on 03.11.15.
//  Copyright © 2015 VOVA@CRAFTER. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) NSInteger oneChislo;
@property (assign, nonatomic) NSInteger twoChislo;
@property (assign, nonatomic) NSInteger rezultatIgroka;
@property (assign, nonatomic) NSInteger chet123;
@property (assign, nonatomic) NSInteger antiChet123;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.smileImageView.alpha = 0;
    self.nextView.alpha = 0;
    [self.rezultat becomeFirstResponder];
    [self randomNumbers];
    [self loadRecord];

}

- (void)randomNumbers {
    self.oneChislo = arc4random() % 4 + 2;
    self.twoChislo = arc4random() % 9 + 2;

    self.oneNumber.text = [NSString stringWithFormat:@"%ld", (long)self.oneChislo];
    self.twoNumber.text = [NSString stringWithFormat:@"%ld",(long)self.twoChislo];
}

- (IBAction)pokazatOtvet:(id)sender {
    self.rezultat.text = [NSString stringWithFormat:@"%ld",(long)self.oneChislo * self.twoChislo];
    self.proverit.alpha = 0;
    self.otvetView.alpha = 0;
    self.nextView.alpha = 1;

}

- (IBAction)proverit:(id)sender {
    self.rezultatIgroka = [self.rezultat.text intValue] ;
    if (self.rezultatIgroka == self.oneChislo * self.twoChislo) {
        self.repet.text = @"верно, молодец!";
        self.smileImageView.image = [UIImage imageNamed:@"smile!.png"];
        self.smileImageView.alpha = 1;
        self.proverit.alpha = 0;
        self.otvetView.alpha = 0;
        self.nextView.alpha = 1;
        
        
//        [UIView animateWithDuration:1
//                              delay:0
//                            options:UIViewAnimationOptionCurveEaseInOut
//                         animations:^{
//                             self.nextView.center = CGPointMake(self.nextView.center.x, self.nextView.center.y - 60);
////                             self.otvetView.center = CGPointMake(self.otvetView.center.x, self.otvetView.center.y + 60);
////                             self.proverit.center = CGPointMake(self.proverit.center.x, self.proverit.center.y + 60);
//                         } completion:^(BOOL finished) {
//                         }];

        self.chet123++;
        self.chet.text = [NSString stringWithFormat:@"%ld", self.chet123];
        
    } else{
       self.rezultatIgroka = [self.rezultat.text intValue] ;
        if (self.rezultatIgroka != self.oneChislo * self.twoChislo) {
            self.repet.text = @"неправельно,попробуй еще раз";
            self.smileImageView.image = [UIImage imageNamed:@"smile..png"];
            self.smileImageView.alpha = 1;
        }
    }
}


- (IBAction)next:(id)sender {
    self.repet.text = @"";
    self.rezultat.text = @"";
    [self randomNumbers];
    self.smileImageView.alpha = 0;
    self.proverit.alpha = 1;
    self.otvetView.alpha = 1;
    self.nextView.alpha = 0;
}




- (void)loadRecord {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    self.recordPravilnihOtvetov.text = [NSString stringWithFormat:@"%ld", (long)[userDefaults integerForKey:@"Рекорд верных ответов"]];
}

@end
