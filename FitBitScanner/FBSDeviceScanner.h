//
//  FBSDeviceScanner.h
//  FitBitScanner
//
//  Created by Sam Marshall on 9/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOBluetooth/IOBluetooth.h>

@interface FBSDeviceScanner : NSObject

@property (nonatomic, readonly) CBCentralManager *manager;

- (instancetype)initWithDelegate:(id<CBCentralManagerDelegate>)delegate;

- (bool)startScan;

@end
