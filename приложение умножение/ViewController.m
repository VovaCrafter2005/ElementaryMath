//
//  ViewController.m
//  приложение умножение
//
//  Created by TROLLER KRUTOU on 03.11.15.
//  Copyright © 2015 VOVA@CRAFTER. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray* arrayTableAll;

@property (assign, nonatomic) NSInteger oneChislo;
@property (assign, nonatomic) NSInteger twoChislo;
@property (assign, nonatomic) NSInteger rezultatIgroka;
@property (assign, nonatomic) NSInteger chet123;
@property (assign, nonatomic) NSInteger antiChet123;
@property (assign, nonatomic) BOOL repeatedError;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.repeatedError = NO;
    self.smileImageView.alpha = 0;
    self.nextView.alpha = 0;
    [self.rezultat becomeFirstResponder];
    [self randomNumbers];
    [self loadRecord];

}

- (void)initArrayTable {
    
    NSMutableArray* arrayTableAll = [[NSMutableArray alloc] initWithObjects:[NSNumber init],
                                                                            [NSNumber init],
                                                                            [NSNumber init],
                                                                            [NSNumber init],
                                                                            [NSNumber init],
                                                                            [NSNumber init],
                                                                            [NSNumber init],
                                                                            [NSNumber init],
                                                                            [NSNumber init],
                                                                            [NSNumber init],
                                                                            [NSNumber init],
                                                                            [NSNumber init], nil];
    
    self.arrayTableAll = arrayTableAll;
    
    int i;
    for (i = 0; i <= 10; i++) {
        NSMutableArray* arrayTable = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInteger:0],
                                                                            [NSNumber numberWithInteger:0],
                                                                            [NSNumber numberWithInteger:0],
                                                                            [NSNumber numberWithInteger:0],
                                                                            [NSNumber numberWithInteger:0],
                                                                            [NSNumber numberWithInteger:0],
                                                                            [NSNumber numberWithInteger:0],
                                                                            [NSNumber numberWithInteger:0],
                                                                            [NSNumber numberWithInteger:0],
                                                                            [NSNumber numberWithInteger:0],
                                                                            [NSNumber numberWithInteger:0], nil];
        [arrayTableAll addObject:arrayTable];
    }

}

- (void)randomNumbers {

    self.oneChislo = arc4random() % 4 + 3;
    self.twoChislo = arc4random() % 9 + 1;

    self.oneNumber.text = [NSString stringWithFormat:@"%ld", (long)self.oneChislo];
    self.twoNumber.text = [NSString stringWithFormat:@"%ld",(long)self.twoChislo];
}

- (IBAction)pokazatOtvet:(id)sender {
    self.rezultat.text = [NSString stringWithFormat:@"%ld",(long)self.oneChislo * self.twoChislo];

    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.proverit.alpha = 0;
                         self.otvetView.alpha = 0;
                         self.nextView.alpha = 1;
                     } completion:^(BOOL finished) {
                     }];

}

- (IBAction)proverit:(id)sender {
    self.rezultatIgroka = [self.rezultat.text intValue] ;
    if (self.rezultatIgroka == self.oneChislo * self.twoChislo) {
        
        self.repet.text = @"верно, молодец!";
        self.smileImageView.image = [UIImage imageNamed:@"smile!.png"];
        self.smileImageView.alpha = 1;

        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.proverit.alpha = 0;
                             self.otvetView.alpha = 0;
                             self.nextView.alpha = 1;
                         } completion:^(BOOL finished) {
                         }];

        self.chet123++;
        self.chet.text = [NSString stringWithFormat:@"%ld", self.chet123];
        self.repeatedError = NO;
    } else {
        if (self.repeatedError) {
            [UIView animateWithDuration:1
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.repet.textColor = [UIColor redColor];
                             } completion:^(BOOL finished) {
                                 self.repet.textColor = [UIColor blackColor];
                             }];
            self.repet.text = @"Неправельно!";
            self.repeatedError = NO;

        } else {
            self.repet.text = @"Неправельно, попробуй еще раз";
            self.smileImageView.image = [UIImage imageNamed:@"smile..png"];
            self.smileImageView.alpha = 1;
            self.repeatedError = YES;
        }
    }
}


- (IBAction)next:(id)sender {
    self.repet.text = @"";
    self.rezultat.text = @"";
    [self randomNumbers];
    self.smileImageView.alpha = 0;
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.proverit.alpha = 1;
                         self.otvetView.alpha = 1;
                         self.nextView.alpha = 0;
                     } completion:^(BOOL finished) {
                     }];
}




- (void)loadRecord {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    self.recordPravilnihOtvetov.text = [NSString stringWithFormat:@"%ld", (long)[userDefaults integerForKey:@"Рекорд верных ответов"]];
}

@end
