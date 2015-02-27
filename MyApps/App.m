//
//  App.m
//  MyApps
//
//  Created by Jorge Henrique P. Garcia on 2/27/15.
//  Copyright (c) 2015 Guilherme Ferreira de Souza. All rights reserved.
//

#import "App.h"

@implementation App

-(instancetype)initWithNome:(NSString *)n andCateg:(NSString *)c andImg:(NSString *)i{
    self = [super init];
    
    if (self){
        
        _nome = n;
        _categoria = c;
        _imagem = i;
        
    }
    
    return self;
}

@end
