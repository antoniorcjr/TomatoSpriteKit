//
//  GameScene.m
//  TomatoSpriteKit
//
//  Created by Antonio de Carvalho Jr on 5/26/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene
- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKColor *skyColor = [SKColor colorWithRed:182.0/255.0 green:241.0/255.0 blue:255.0/255.0 alpha:1.0];
        [self setBackgroundColor:skyColor];
        
        SKTexture *cloudTexture = [SKTexture textureWithImageNamed:@"cloud"];
        
        SKAction *moveCloudSprite = [SKAction moveToX:-cloudTexture.size.width duration:10];
        SKAction *resetCloudSprite = [SKAction moveToX:self.frame.size.width + cloudTexture.size.width/2 duration:0];
        SKAction *moveCloudSpritesForever = [SKAction repeatActionForever:
                                             [SKAction sequence:@[moveCloudSprite, resetCloudSprite]]];
        
        
        SKSpriteNode *cloud = [SKSpriteNode spriteNodeWithTexture:cloudTexture];
        cloud.position = CGPointMake(self.frame.size.width, self.frame.size.height - cloud.size.height/2);
        
        [cloud runAction:moveCloudSpritesForever];
        
        SKNode *ground = [SKNode new];
        
        SKTexture *groundTexture = [SKTexture textureWithImageNamed:@"ground"];
        SKTexture *grassTexture = [SKTexture textureWithImageNamed:@"grass"];
        
        SKAction *moveGrassSprite = [SKAction moveByX:-grassTexture.size.width
                                                    y:0
                                             duration:1.0];
        
        SKAction *resetGrassSprite = [SKAction moveByX:grassTexture.size.width
                                                     y:0
                                              duration:0];
        
        SKAction *moveGrassSpritesForever = [SKAction repeatActionForever:
                                             [SKAction sequence:@[moveGrassSprite, resetGrassSprite]]];
        
        
        CGFloat numberOfGrounds = ceil(self.frame.size.width/groundTexture.size.width);
        
        for(int i = 0; i < numberOfGrounds + 1; i++) {
            SKSpriteNode *groundChild = [SKSpriteNode spriteNodeWithTexture:groundTexture];
            groundChild.position = CGPointMake(groundTexture.size.width*i, groundTexture.size.height/2);
            [ground addChild:groundChild];
            
            SKSpriteNode *grassChild = [SKSpriteNode spriteNodeWithTexture:grassTexture];
            grassChild.position = CGPointMake(grassTexture.size.width*i, groundTexture.size.height + grassTexture.size.height/2);
            [grassChild runAction:moveGrassSpritesForever];
            [ground addChild:grassChild];
        }
        
        SKTexture *tomato1 = [SKTexture textureWithImageNamed:@"tomato1"];
        SKTexture *tomato2 = [SKTexture textureWithImageNamed:@"tomato2"];
        SKTexture *tomato3 = [SKTexture textureWithImageNamed:@"tomato3"];
        SKTexture *tomato4 = [SKTexture textureWithImageNamed:@"tomato4"];
        SKTexture *tomato5 = [SKTexture textureWithImageNamed:@"tomato5"];
        
        SKAction *tomatoAction = [SKAction repeatActionForever:[SKAction animateWithTextures:
                                                                @[tomato1, tomato2,
                                                                  tomato3, tomato4, tomato5, tomato4,
                                                                  tomato3, tomato2]
                                                                                timePerFrame:0.1]];
        
        
        SKSpriteNode *tomato = [SKSpriteNode spriteNodeWithTexture:tomato1];
        tomato.position = CGPointMake(self.frame.size.width/4, groundTexture.size.height + tomato.size.height/2);
        
        [tomato runAction:tomatoAction];
        
        [self addChild:cloud];
        [self addChild:ground];
        [self addChild:tomato];
    }
    return self;
}

@end
