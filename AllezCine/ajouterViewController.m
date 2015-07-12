//
//  ajouterViewController.m
//  AllezCine
//
//  Created by LIUYiling on 11/07/15.
//  Copyright (c) 2015 LIUYiling. All rights reserved.
//

#import "ajouterViewController.h"
#import <CoreData/CoreData.h>


@interface ajouterViewController ()

@end

@implementation ajouterViewController

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)PublierButtonPressed:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"RDV" inManagedObjectContext:context];
    [newDevice setValue:self.cine.text forKey:@"cine"];
    [newDevice setValue:self.time.text forKey:@"time"];
    [newDevice setValue:self.film.text forKey:@"film"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
