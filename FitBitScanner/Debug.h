//
//  Debug.h
//  FitBitScanner
//
//  Created by Sam Marshall on 9/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef FitBitScanner_Debug_h
#define FitBitScanner_Debug_h

#ifdef DEBUG
#define DBLog(...) NSLog(__VA_ARGS__)
#else
#define DBLog(...) 
#endif

#endif
