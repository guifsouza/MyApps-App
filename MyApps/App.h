//
//  App.h
//  MyApps
//
//  Created by Jorge Henrique P. Garcia on 2/27/15.
//  Copyright (c) 2015 Guilherme Ferreira de Souza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject
{

}

- (instancetype) initWithNome:(NSString *)n andCateg:(NSString *)c andImg:(NSString *)i;

@property NSString *nome, *categoria, *imagem;

@end
