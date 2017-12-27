//
//  FieldErrorModel.h
//  HomeCare
//
//  Created by chh on 2017/12/27.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FieldErrorModel : NSObject
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) int field;
@end
