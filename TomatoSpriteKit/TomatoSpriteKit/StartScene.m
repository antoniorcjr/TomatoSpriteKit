//
//  StartScene.m
//  TomatoSpriteKit
//
//  Created by Antonio de Carvalho Jr on 5/26/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "StartScene.h"
#import "GameScene.h"

@implementation StartScene
- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode *background = [SKSpriteNode new];
        background.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
        background.size = self.frame.size;
        background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        
        [self addChild:background];
        
        SKLabelNode *tapLabel = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        tapLabel.text = @"TAP TO START";
        tapLabel.fontSize = 20;
        tapLabel.fontColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
        tapLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)/3);
        
        [self addChild:tapLabel];
    }
    
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    SKAction *fadeAway = [SKAction fadeOutWithDuration: 0.25];
    SKAction *remove = [SKAction removeFromParent];
    SKAction *moveSequence = [SKAction sequence:@[fadeAway, remove]];
    [self runAction:moveSequence completion:^{
        SKScene *gameScene  = [[GameScene alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
        [self.view presentScene:gameScene transition:doors];
    }];
}
@end
