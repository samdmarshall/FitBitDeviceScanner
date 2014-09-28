//
//  FBSDeviceScanner.m
//  FitBitScanner
//
//  Created by Sam Marshall on 9/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#import "FBSDeviceScanner.h"
#import "FBSDeviceScannerDelegate.h"
#import "FBSDevicePeripheralDelegate.h"

#import "Debug.h"

@interface FBSDeviceScanner () {
	CBCentralManager *_manager;
	dispatch_queue_t _scannerQueue;
	NSTimer *_pollDevices;
	NSArray *_knownFitBitServiceUUIDs;
	
	CBPeripheral *_connectedDevice;
}

@end

@implementation FBSDeviceScanner

- (instancetype)initWithDelegate:(id<CBCentralManagerDelegate>)delegate {
	self = [super init];
	
	if (self != nil) {
		_scannerQueue = dispatch_queue_create("com.samdmarshall.fitbitscanner.cbmanagerqueue", NULL);
		_manager = [[CBCentralManager alloc] initWithDelegate:delegate queue:_scannerQueue];
		_pollDevices = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(pollDeviceList:) userInfo:nil repeats:YES];
		_knownFitBitServiceUUIDs = [NSArray arrayWithObjects:
									[CBUUID UUIDWithString:@"1800"],
									[CBUUID UUIDWithString:@"1801"],
									[CBUUID UUIDWithString:@"180a"],
									[CBUUID UUIDWithString:@"180f"],
									nil];
		_connectedDevice = nil;
	}
	
	return self;
}

- (bool)startScan {
	bool result = false;
	
	if ([_manager state] == CBCentralManagerStatePoweredOn) {
		[(FBSDeviceScannerDelegate *)[_manager delegate] forgetDevices];
		
		NSDictionary *scanningOptions = @{ CBCentralManagerScanOptionAllowDuplicatesKey: @YES };
		[_manager scanForPeripheralsWithServices:_knownFitBitServiceUUIDs options:scanningOptions];
		
		result = true;
	}
	
	return result;
}

- (void)pollDeviceList:(NSTimer *)timer {
	NSArray *devices = [(FBSDeviceScannerDelegate *)[_manager delegate] discoveredDevices];
	
	if ([devices count] != 0 && _connectedDevice == nil) {
		_connectedDevice = [devices firstObject];
		[_manager connectPeripheral:_connectedDevice options:nil];
		[self stopScan];
	}
	
	if (_connectedDevice != nil && [_connectedDevice state] == CBPeripheralStateConnected) {
		if ([_connectedDevice delegate] == nil) {
			FBSDevicePeripheralDelegate *deviceDelegate = [[FBSDevicePeripheralDelegate alloc] init];
			[_connectedDevice setDelegate:deviceDelegate];
		}
		
		
	}
	
}

- (bool)stopScan {
	bool result = false;
	
	if (_pollDevices != nil) {
		[_pollDevices invalidate];
		[_manager stopScan];
		
		result = true;
	}
	
	return result;
}

@end
