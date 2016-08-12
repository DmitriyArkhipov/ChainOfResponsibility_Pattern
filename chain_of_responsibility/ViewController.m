//
//  ViewController.m
//  chain_of_responsibility
//
//  Created by Dmitriy Arkhipov on 12.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "ViewController.h"

#import "COR.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    Receiver *receiver = [[Receiver alloc] initWithBankTransfer:YES moneyTransfer:YES payPalTransfer:NO];
    Receiver *receiver = [[Receiver alloc] initWithBankTransfer:NO moneyTransfer:YES payPalTransfer:YES];
    
    PaymentHandler *bankPaymentHandler = [[BankPaymentHandler alloc] init];
    PaymentHandler *moneyPaymentHandler = [[MoneyPaymentHandler alloc] init];
    PaymentHandler *payPalPaymentHandler = [[PayPalPaymentHandler alloc] init];
    
    bankPaymentHandler.successor = payPalPaymentHandler;
    payPalPaymentHandler.successor = moneyPaymentHandler;
    
//    [bankPaymentHandler handleReceiver:receiver];
    [payPalPaymentHandler handleReceiver:receiver];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
