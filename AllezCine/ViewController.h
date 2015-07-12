//
//  ViewController.h
//  AllezCine
//
//  Created by LIUYiling on 10/07/15.
//  Copyright (c) 2015 LIUYiling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *accueilTableView;

@end

