//
//  COR.m
//  chain_of_responsibility
//
//  Created by Dmitriy Arkhipov on 12.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//


#import "COR.h"


@implementation Receiver

- (instancetype) initWithBankTransfer:(BOOL)bt moneyTransfer:(BOOL)mt payPalTransfer:(BOOL)ppt {

    self = [super init];
    
    if (self) {
        _bankTransfer = bt;
        _moneyTransfer = mt;
        _payPalTransfer = ppt;
    }

    return self;

}

@end

@implementation PaymentHandler

- (void) handleReceiver:(Receiver *)receiver {
    
    [self doesNotRecognizeSelector:_cmd];
    
}

@end



@implementation BankPaymentHandler

- (void) handleReceiver:(Receiver *)receiver {
    
        if (receiver.bankTransfer) {
            NSLog(@"PaymentHandler: Выполняем банковский перевод.");
        } else if (self.successor) {
            [self.successor handleReceiver:receiver];
        }
}

@end


@implementation MoneyPaymentHandler

- (void) handleReceiver:(Receiver *)receiver {
    
    if (receiver.moneyTransfer) {
        NSLog(@"PaymentHandler: Выполняем перевод через системы денежных переводов.");
    } else if (self.successor) {
        [self.successor handleReceiver:receiver];
    }
}

@end


@implementation PayPalPaymentHandler

- (void) handleReceiver:(Receiver *)receiver {
    
    if (receiver.payPalTransfer) {
        NSLog(@"PaymentHandler: Выполняем перевод через PayPal.");
    } else if (self.successor) {
        [self.successor handleReceiver:receiver];
    }
}

@end