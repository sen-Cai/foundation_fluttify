//
// Created by Yohom Bao on 2019/11/22.
//

#import "UIImageHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

@implementation UIImageHandler
- (instancetype)initWith:(NSString *)method :(NSDictionary *)args :(FlutterResult)methodResult {
  self = [super init];
  if (self) {
    // UIImage::getData
    if ([@"UIImage::getData" isEqualToString:method]) {
      NSNumber *refId = (NSNumber *) args[@"refId"];

      UIImage *target = (UIImage *) HEAP[refId];
      NSData *data = UIImageJPEGRepresentation(target, 100);
      methodResult([FlutterStandardTypedData typedDataWithBytes:data]);
    }
  }
  return self;
}

@end