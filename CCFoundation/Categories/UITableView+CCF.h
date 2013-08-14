//
//  UITableView+CCF.h
//  Pods
//
//  Created by Christopher Constable on 8/12/13.
//
//

#import <UIKit/UIKit.h>

@interface UITableView (CCF)

- (void)scrollToFirstRowInSection:(NSInteger)section
                         animated:(BOOL)animated;

@end
