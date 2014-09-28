//
//  FBSDeviceScannerDelegate.h
//  FitBitScanner
//
//  Created by Sam Marshall on 9/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <IOBluetooth/IOBluetooth.h>

@interface FBSDeviceScannerDelegate : NSObject <CBCentralManagerDelegate>

@property (nonatomic, readonly) NSArray *discoveredDevices;

- (instancetype)init;

- (void)forgetDevices;

#pragma mark Protocol - CBCentralManagerDelegate

- (void)centralManagerDidUpdateState:(CBCentralManager *)central;

- (void)centralManager:(CBCentralManager *)central willRestoreState:(NSDictionary *)dict;

- (void)centralManager:(CBCentralManager *)central didRetrievePeripherals:(NSArray *)peripherals;

- (void)centralManager:(CBCentralManager *)central didRetrieveConnectedPeripherals:(NSArray *)peripherals;

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI;

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral;

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error;

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error;

@end
