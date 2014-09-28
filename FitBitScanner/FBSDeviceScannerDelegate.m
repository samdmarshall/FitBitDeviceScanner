//
//  FBSDeviceScannerDelegate.m
//  FitBitScanner
//
//  Created by Sam Marshall on 9/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#import "FBSDeviceScannerDelegate.h"
#import "Debug.h"

@interface FBSDeviceScannerDelegate () {
	NSString *_previousState;
	NSMutableArray *_discoveredDevices;
}

@end

@implementation FBSDeviceScannerDelegate

- (instancetype)init {
	self = [super init];
	
	if (self != nil) {
		_previousState = @"Unknown";
		_discoveredDevices = [NSMutableArray new];
	}
	
	return self;
}

- (void)forgetDevices {
	[_discoveredDevices removeAllObjects];
}

#pragma mark Protocol - CBCentralManagerDelegate

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
	NSString *newState = @"Unknown";
	
	switch ([central state]) {
		case CBCentralManagerStateUnknown: {
			newState = @"Unknown";
			break;
		}
		case CBCentralManagerStateResetting: {
			newState = @"Resetting";
			break;
		}
		case CBCentralManagerStateUnsupported: {
			newState = @"Unsupported";
			break;
		}
		case CBCentralManagerStateUnauthorized: {
			newState = @"Unauthorized";
			break;
		}
		case CBCentralManagerStatePoweredOff: {
			newState = @"Powered Off";
			break;
		}
		case CBCentralManagerStatePoweredOn: {
			newState = @"Powered On";
			break;
		}
		default: {
			newState = @"Error!";
			break;
		}
	}
	
	DBLog(@"State Changed %@ -> %@", _previousState, newState);
	
	_previousState = newState;
}

- (void)centralManager:(CBCentralManager *)central willRestoreState:(NSDictionary *)dict {
	
}

- (void)centralManager:(CBCentralManager *)central didRetrievePeripherals:(NSArray *)peripherals {
	DBLog(@"Retrieved Peripherals: %@",peripherals);
}

- (void)centralManager:(CBCentralManager *)central didRetrieveConnectedPeripherals:(NSArray *)peripherals {
	
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
	DBLog(@"Discovery");
	DBLog(@"\tPeripheral: %@",peripheral);
	DBLog(@"\tAdvertisement Data: %@",advertisementData);
	
	if ([_discoveredDevices containsObject:peripheral] == NO) {
		[_discoveredDevices addObject:peripheral];
		DBLog(@"Adding Device!");
	}
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
	
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
	
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
	
}

@end
