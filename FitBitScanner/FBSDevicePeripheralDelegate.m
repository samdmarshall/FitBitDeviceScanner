//
//  FBSDevicePeripheralDelegate.m
//  FitBitScanner
//
//  Created by Sam Marshall on 9/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#import "FBSDevicePeripheralDelegate.h"
#import "Debug.h"

@implementation FBSDevicePeripheralDelegate

- (instancetype)init {
	self = [super init];
	
	if (self != nil) {
		
	}
	
	return self;
}

#pragma mark Protocol - CBPeripheralDelegate

- (void)peripheralDidUpdateName:(CBPeripheral *)peripheral {
	DBLog(@"%@: Name Changed %@",peripheral, [peripheral name]);
}

- (void)peripheralDidInvalidateServices:(CBPeripheral *)peripheral {
	DBLog(@"%@: Has invalidated services",peripheral);
}

- (void)peripheral:(CBPeripheral *)peripheral didModifyServices:(NSArray *)invalidatedServices {
	DBLog(@"%@: Modified Services: %@",peripheral, invalidatedServices);
}

- (void)peripheralDidUpdateRSSI:(CBPeripheral *)peripheral error:(NSError *)error {
	DBLog(@"%@: Updated RSSI %@",peripheral, [peripheral RSSI]);
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
	DBLog(@"%@: Did discover services",peripheral);
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverIncludedServicesForService:(CBService *)service error:(NSError *)error {
	DBLog(@"%@: Did discover included services for service: %@",peripheral, service);
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
	DBLog(@"%@: Did discover characteristics for service: %@",peripheral, service);
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
	DBLog(@"%@: Did update value for characteristic: %@",peripheral, characteristic);
}

- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
	DBLog(@"%@: Did write value for characteristic: %@",peripheral, characteristic);
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
	DBLog(@"%@: Did update notification state for characteristic: %@",peripheral, characteristic);
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
	DBLog(@"%@: Did discover descriptors for characteristic: %@",peripheral, characteristic);
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error {
	DBLog(@"%@: Did update value for descriptor: %@",peripheral, descriptor);
}

- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error {
	DBLog(@"%@: Did write value for descriptor: %@",peripheral, descriptor);
}

@end
