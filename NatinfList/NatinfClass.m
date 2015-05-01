//
//  NatinfClass.m
//  NatinfList
//
//  Created by Pascal on 18/07/14.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import "NatinfClass.h"

@implementation NatinfClass

-(id)initWithDictionnary:(NSDictionary *)dict {
    self = [super init];
    if (self != nil) {
        self.libelleInfractionClass = [dict valueForKeyPath:@"QualificationPVe"];
        self.natinfInfractionClass = [dict valueForKeyPath:@"Natinf"];
        self.categorieInfractionClass = [dict valueForKeyPath:@"Categorie"];
        self.montantAmende = [dict valueForKey:@"Montant_amende"];
        self.montantMinore = [dict valueForKey:@"Montant_minore"];
        self.montantMajore = [dict valueForKey:@"Montant_majore"];
        self.classeInfraction = [dict valueForKey:@"Classe"];
        self.retraitPoint = [dict valueForKey:@"Retrait_points"];
                                 
                                 
    }
    return self;
}


@end
