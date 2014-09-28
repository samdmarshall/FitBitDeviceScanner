//
//  FBSDevicePeripheralDelegate.h
//  FitBitScanner
//
//  Created by Sam Marshall on 9/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <IOBluetooth/IOBluetooth.h>

@interface FBSDevicePeripheralDelegate : NSObject <CBPeripheralDelegate>

- (instancetype)init;

#pragma mark Protocol - CBPeripheralDelegate

- (void)peripheralDidUpdateName:(CBPeripheral *)peripheral;

- (void)peripheralDidInvalidateServices:(CBPeripheral *)peripheral;

- (void)peripheral:(CBPeripheral *)peripheral didModifyServices:(NSArray *)invalidatedServices;

- (void)peripheralDidUpdateRSSI:(CBPeripheral *)peripheral error:(NSError *)error;

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error;

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverIncludedServicesForService:(CBService *)service error:(NSError *)error;

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error;

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error;

- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error;

- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error;

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error;

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error;

- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error;

@end
