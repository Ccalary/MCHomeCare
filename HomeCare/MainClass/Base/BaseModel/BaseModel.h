//
//  BaseModel.h
//  HomeCare
//
//  Created by chh on 2017/12/27.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic, assign) NSInteger state;

@property (nonatomic, strong) id data;

@property (nonatomic, strong) NSArray *fieldErrors;

@end
