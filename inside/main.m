//
//  main.m
//  inside
//
//  Created by bentleypeng on 2023/3/16.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

@interface ObjcClass : NSObject
@end

@implementation ObjcClass

+ (void)load {
    
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    return [super resolveClassMethod:sel];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        ((void(*)(id, SEL))objc_msgSend)([ObjcClass new], @selector(aaa));
        ((void(*)(id, SEL))objc_msgSend)(ObjcClass.class, @selector(bbb));
        NSLog(@"Hello, World!");
#pragma clang diagnostic pop
    }
    return 0;
}
