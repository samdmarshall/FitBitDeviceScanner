//
//  main.m
//  FitBitScanner
//
//  Created by Sam Marshall on 9/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FBSDeviceScanner.h"
#import "FBSDeviceScannerDelegate.h"

void FBSStart(FBSDeviceScanner *deviceScanner) {
	bool notStarted = true;
	while (notStarted) {
		notStarted = ![deviceScanner startScan];
		
		if (notStarted) {
			sleep(1);
		}
	}
	
	CFRunLoopRun();
}

int main(int argc, const char * argv[]) {
	FBSDeviceScannerDelegate *scannerDelegate = [[FBSDeviceScannerDelegate alloc] init];
	FBSDeviceScanner *deviceScanner = [[FBSDeviceScanner alloc] initWithDelegate:scannerDelegate];
	FBSStart(deviceScanner);
    return 0;
}
