//
//  Fibber.m
//  ObjectiveFib
//
//  Created by Rick Windham on 6/2/15.
//  Copyright (c) 2015 Rick Windham. All rights reserved.
//

#import "Fibber.h"

@interface Fibber ()
@property (strong, nonatomic) NSMutableDictionary *cache;
@property (strong, nonatomic) NSArray *knownFibs;
@end

@implementation Fibber

#pragma mark - Lifecycle

- (instancetype)init {
    if ([super init] == self) {
        _cache = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark - Test Methods

- (BOOL)loadTestData {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestData"
                                                         ofType:@"txt"];
    
    NSError *error = nil;
    NSString *sourceString = [NSString stringWithContentsOfFile:filePath
                                                       encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSLog(@"error %@", error);
    }
    
    _knownFibs = [sourceString componentsSeparatedByCharactersInSet:
                      [NSCharacterSet newlineCharacterSet]];
    
    if (_knownFibs.count == 50) {
        return true;
    } else {
        return false;
    }
}

- (NSUInteger)getFibFor:(NSUInteger)slot {
    if (slot < _knownFibs.count) {
        return [[_knownFibs objectAtIndex:slot] integerValue];
    } else {
        return 0;
    }
}

#pragma mark - Methods
// the Diamond option
- (int) fib:(int)num {
    static NSMutableDictionary *fibCache = nil;
    if (!fibCache) {
        fibCache = [NSMutableDictionary new];
    }
    if (fibCache[@(num)]) {
        return [fibCache[@(num)] intValue];
    }
    int val = (num == 0) ? 0 : ((num < 3) ? 1 : ([self fib:num-1] + [self fib:num-2]));
    fibCache[@(num)] = @(val);
    return val;
}

- (NSUInteger)tellAFib:(NSUInteger)slot {
    switch (slot) {
        case 0:
            return 0;
            break;
        case 1:
            return 1;
            break;
        default:
            return [self tellAFib:slot - 2] + [self tellAFib:slot - 1];
            break;
    }
}

- (UIColor *)getRandomUIColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
