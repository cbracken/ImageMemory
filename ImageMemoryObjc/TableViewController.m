#import "TableViewController.h"
#import "ImageTableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (NSString*)imageUrlForIndex:(NSInteger)index {
  static NSString *const kImageURL = @"https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Googleplex-Patio-Aug-2014.JPG/640px-Googleplex-Patio-Aug-2014.JPG";
  return [NSString stringWithFormat:@"%@?x=%ld", kImageURL, index];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *const kCellIdentifier = @"ImageCell";
  ImageTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];

  NSString* imageUrl = [self imageUrlForIndex:indexPath.item];
  NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
  cell.photoView.image = [UIImage imageWithData:imageData];
  cell.photoLabel.text = imageUrl;
  return cell;
}

@end
