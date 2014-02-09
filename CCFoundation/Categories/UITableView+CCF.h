//
//  UITableView+CCF.h
//  Pods
//
//  Created by Christopher Constable on 8/12/13.
//
//

#import <UIKit/UIKit.h>

@interface UITableView (CCF)

/**
 *  Scrolls to the top of a table view.
 */
- (void)scrollToTop;
- (void)scrollToTop:(BOOL)animated;

- (void)scrollToFirstRowInSection:(NSInteger)section
                         animated:(BOOL)animated;

@end
