//
//  ViewController.m
//  TomatoSpriteKit
//
//  Created by Antonio de Carvalho Jr on 5/26/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "ViewController.h"
#import "StartScene.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    // Configure the view.
    SKView *skView = (SKView*)self.view;
    if (!skView.scene) {
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        // Create and configure the scene.
        StartScene* scene = [[StartScene alloc] initWithSize:skView.bounds.size];
        
        // Present the scene.
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [skView presentScene:scene];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
