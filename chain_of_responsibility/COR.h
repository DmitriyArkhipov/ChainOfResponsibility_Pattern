//
//  COR.h
//  chain_of_responsibility
//
//  Created by Dmitriy Arkhipov on 12.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Receiver : NSObject

@property (assign, nonatomic) BOOL bankTransfer;

@property (assign, nonatomic) BOOL moneyTransfer;

@property (assign, nonatomic) BOOL payPalTransfer;


- (instancetype) initWithBankTransfer:(BOOL)bt moneyTransfer:(BOOL)mt payPalTransfer:(BOOL)ppt;

@end


/**
 Реализация абстрактного метода через протокол
 */
//@protocol TransferHandler <NSObject>
//
//@optional
//- (void) handleReceiver:(Receiver *)receiver;
//
//@end

@interface PaymentHandler : NSObject //<TransferHandler>

@property (strong, nonatomic) PaymentHandler *successor;

/**
 абстрактный метод не имеющий реализации в классе PaymentHandler
 */
- (void) handleReceiver:(Receiver *)receiver;

@end



@interface BankPaymentHandler : PaymentHandler

- (void) handleReceiver:(Receiver *)receiver;

@end


@interface MoneyPaymentHandler : PaymentHandler

- (void) handleReceiver:(Receiver *)receiver;

@end


@interface PayPalPaymentHandler : PaymentHandler

- (void) handleReceiver:(Receiver *)receiver;

@end


