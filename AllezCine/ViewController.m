//
//  ViewController.m
//  AllezCine
//
//  Created by LIUYiling on 10/07/15.
//  Copyright (c) 2015 LIUYiling. All rights reserved.
//

#import "ViewController.h"
#import "AccueilTableViewCell.h"
#import <CoreData/CoreData.h>


@interface ViewController ()
@property (strong) NSMutableArray *rdv;

@end

@implementation ViewController{
    NSArray *names;
    NSArray *faces;
    NSArray *cines;
    NSArray *times;

}

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"RDV"];
    self.rdv = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    //[self.view reloadInputViews];
   // [self.view setNeedsDisplay];
    [self.view reloadInputViews];
    //[self.view reloadData];
    //[UITableView reloadData]
}

- (void)viewDidLoad {
    [super viewDidLoad];
    names = [NSArray arrayWithObjects:@"Michelle", @"Susan", @"Elisabeth", @"Jack", @"Mike",@"Michelle", @"Susan", @"Elisabeth", @"Jack", @"Mike",@"Michelle", @"Susan", @"Elisabeth", @"Jack", @"Mike",nil];
    faces = [NSArray arrayWithObjects:@"01.jpg", @"02.jpg", @"03.jpg", @"04.jpg", @"05.jpg",@"01.jpg", @"02.jpg", @"03.jpg", @"04.jpg", @"05.jpg",@"01.jpg", @"02.jpg", @"03.jpg", @"04.jpg", @"05.jpg",nil];
    cines = [NSArray arrayWithObjects:@"MK2 Bib", @"UGC Goblin", @"UGC Opera",@"MK2 Bib", @"UGC Goblin", @"UGC Opera",@"MK2 Bib", @"UGC Goblin", @"UGC Opera",@"MK2 Bib", @"UGC Goblin", @"UGC Opera",@"MK2 Bib", @"UGC Goblin", @"UGC Opera",nil];//@"MK2 Biblio", @"UGC Goblins", @"Gaumont Pathe", @"UGC Opera", @"Gaumont Pathe","MK2 Biblio", @"UGC Goblins", @"Gaumont Pathe", @"UGC Opera", @"Gaumont Pathe","MK2 Biblio", @"UGC Goblins", @"Gaumont Pathe", @"UGC Opera", @"Gaumont Pathe",nil];
    times= [NSArray arrayWithObjects:@"17h30", @"18h00", @"18h30", @"19h00", @"20h00",@"17h30", @"18h00", @"18h30", @"19h00", @"20h00",@"17h30", @"18h00", @"18h30", @"19h00", @"20h00",nil];

    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"accueilCell";
    
    AccueilTableViewCell *cell = (AccueilTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"accueilCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //Configure the cell...
    NSManagedObject *rdvCell = [self.rdv objectAtIndex:indexPath.row];

    [cell.timeLabel setText:[NSString stringWithFormat:@"%@ ", [rdvCell valueForKey:@"time"]]];
    
    

    cell.nameLabel.text = [names objectAtIndex:indexPath.row];

    cell.faceView.image = [UIImage imageNamed:[faces objectAtIndex:indexPath.row]];
    
    cell.cineLabel.text = [cines objectAtIndex:indexPath.row];


    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"The number is %lu",(unsigned long)self.rdv.count);
    return self.rdv.count;
}

@end
