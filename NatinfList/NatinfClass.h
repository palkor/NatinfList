//
//  NatinfClass.h
//  NatinfList
//
//  Created by Pascal on 18/07/14.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NatinfClass : NSObject
@property (nonatomic, strong) NSString *libelleInfractionClass;
@property (nonatomic, strong) NSString *natinfInfractionClass;
@property (nonatomic, strong) NSString *categorieInfractionClass;
@property (nonatomic, strong) NSString *montantAmende;
@property (nonatomic, strong) NSString *montantMinore;
@property (nonatomic, strong) NSString *montantMajore;
@property (nonatomic, strong) NSString *classeInfraction;
@property (nonatomic, strong) NSString *retraitPoint;

-(id)initWithDictionnary:(NSDictionary *) dict;

@end
