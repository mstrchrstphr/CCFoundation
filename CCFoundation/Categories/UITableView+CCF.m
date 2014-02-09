//
//  UITableView+CCF.m
//  Pods
//
//  Created by Christopher Constable on 8/12/13.
//
//

#import "UITableView+CCF.h"

@implementation UITableView (CCF)

- (void)scrollToTop
{
    [self scrollToTop:YES];
}

- (void)scrollToTop:(BOOL)animated
{
    [self scrollRectToVisible:CGRectMake(0, 0, 1, 1)
                     animated:animated];
}

- (void)scrollToFirstRowInSection:(NSInteger)section
                         animated:(BOOL)animated
{
    if ([self numberOfRowsInSection:section] > 0) {
        [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]
                    atScrollPosition:UITableViewScrollPositionTop
                            animated:animated];
    }
}

@end
