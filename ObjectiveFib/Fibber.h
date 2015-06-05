//
//  Fibber.h
//  ObjectiveFib
//
//  Created by Rick Windham on 6/2/15.
//  Copyright (c) 2015 Rick Windham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Fibber : NSObject
- (BOOL)loadTestData;
- (NSUInteger)getFibFor:(NSUInteger)slot;
- (int)fib:(int)num;
- (NSUInteger)tellAFib:(NSUInteger)slot;
- (UIColor *)getRandomUIColor;
@end
