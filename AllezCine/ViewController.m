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
    NSLog(@"Fetch %lu",(unsigned long)self.rdv.count);
    

    [self.accueilTableView reloadData];
   
    /*
    
    NSFetchRequest * allMovies = [[NSFetchRequest alloc] init];
    [allMovies setEntity:[NSEntityDescription entityForName:@"RDV" inManagedObjectContext:managedObjectContext]];
    [allMovies setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError * error = nil;
    NSArray * movies = [managedObjectContext executeFetchRequest:allMovies error:&error];
    //error handling goes here
    for (NSManagedObject * movie in movies) {
        [managedObjectContext deleteObject:movie];
    }
    NSError *saveError = nil;
    [managedObjectContext save:&saveError];*/

   // NSLog(@"TableView content hight %f",self.accueilTableView.contentSize.height);
  //  NSLog(@"TableView bounds height %f",self.accueilTableView.bounds.size.height);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    names = [NSArray arrayWithObjects:@"Michelle", @"Susan", @"Elisabeth", @"Jack", @"Mike",@"Michelle", @"Susan", @"Elisabeth", @"Jack", @"Mike",@"Michelle", @"Susan", @"Elisabeth", @"Jack", @"Mike",nil];
    faces = [NSArray arrayWithObjects:@"01.jpg", @"02.jpg", @"03.jpg", @"04.jpg", @"05.jpg",@"01.jpg", @"02.jpg", @"03.jpg", @"04.jpg", @"05.jpg",@"01.jpg", @"02.jpg", @"03.jpg", @"04.jpg", @"05.jpg",@"01.jpg", @"02.jpg", @"03.jpg", @"04.jpg", @"05.jpg",@"01.jpg", @"02.jpg", @"03.jpg", @"04.jpg", @"05.jpg",@"01.jpg", @"02.jpg", nil];
    cines = [NSArray arrayWithObjects:@"MK2 Bib", @"UGC Goblin", @"UGC Opera",@"MK2 Bib", @"UGC Goblin", @"UGC Opera",@"MK2 Bib", @"UGC Goblin", @"UGC Opera",@"MK2 Bib", @"UGC Goblin", @"UGC Opera",@"MK2 Bib", @"UGC Goblin", @"UGC Opera",nil];//@"MK2 Biblio", @"UGC Goblins", @"Gaumont Pathe", @"UGC Opera", @"Gaumont Pathe","MK2 Biblio", @"UGC Goblins", @"Gaumont Pathe", @"UGC Opera", @"Gaumont Pathe","MK2 Biblio", @"UGC Goblins", @"Gaumont Pathe", @"UGC Opera", @"Gaumont Pathe",nil];
    times= [NSArray arrayWithObjects:@"17h30", @"18h00", @"18h30", @"19h00", @"20h00",@"17h30", @"18h00", @"18h30", @"19h00", @"20h00",@"17h30", @"18h00", @"18h30", @"19h00", @"20h00",nil];

    self.accueilTableView.userInteractionEnabled = YES;
    self.accueilTableView.scrollEnabled = YES;
    self.accueilTableView.bounces = YES;
    [self.accueilTableView setAlwaysBounceVertical:YES];
    [self.view bringSubviewToFront:self.accueilTableView];
   
    [self.accueilTableView setContentSize:CGSizeMake(self.accueilTableView.contentSize.width, 2000.0f)];


   // NSLog(@"View content width %f",self.view.contentSize.width);
    NSLog(@"View bounds width %f",self.accueilTableView.bounds.size.width);
    NSLog(@"TableView content hight %f",self.accueilTableView.contentSize.height);
    NSLog(@"TableView bounds height %f",self.accueilTableView.bounds.size.height);

   
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
    
    [cell.cineLabel setText:[NSString stringWithFormat:@"%@ ", [rdvCell valueForKey:@"cine"]]];
    [cell.nameLabel setText:[NSString stringWithFormat:@"%@ ", [rdvCell valueForKey:@"film"]]];


   // cell.nameLabel.text = [names objectAtIndex:indexPath.row];

    cell.faceView.image = [UIImage imageNamed:[faces objectAtIndex:indexPath.row]];
    
    //cell.cineLabel.text = [cines objectAtIndex:indexPath.row];


    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"The number is %@",self.accueilTableView.scrollEnabled);
    return self.rdv.count;
}



@end
