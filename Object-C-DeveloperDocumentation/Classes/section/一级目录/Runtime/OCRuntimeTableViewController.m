//
//  OCRuntimeTableViewController.m
//  Object-C-DeveloperDocumentation
//
//  Created by xiang fu on 2018/1/23.
//  Copyright © 2018年 xiang fu. All rights reserved.
//

#import "OCRuntimeTableViewController.h"
#import <objc/runtime.h>

@interface OCRuntimeTableViewController ()

@property (nonatomic , copy)NSString *justString;

@end

@implementation OCRuntimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 19;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return 31;
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) return @"关于类的使用";
    return @"---";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.textLabel.numberOfLines = 0;
        cell.detailTextLabel.numberOfLines = 0;
    }
    if (indexPath.section == 0){
        if (indexPath.row == 0){
            cell.textLabel.text = @"class_getName返回一个类的名称。";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"例：class_getName(self.class) = %@",[NSString stringWithUTF8String:class_getName(self.class)]];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"class_getSuperclass返回一个类的父类名称。";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"例：class_getSuperclass(self.class) = %@",class_getSuperclass(self.class)];
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"class_isMetaClass返回一个布尔值，表示一个类对象是否是一个元类。";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"????例：class_isMetaClass(self.class) = %@",class_isMetaClass(self.class)? @"yes":@"no"];
        }else if (indexPath.row == 3){
            cell.textLabel.text = @"class_getInstanceSize返回类实例的大小。";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"例：class_isMetaClass(self.class) = %zu字节",class_getInstanceSize(self.class)];
        }else if (indexPath.row == 4){
            cell.textLabel.text = @"class_getInstanceVariable获取cls类的名称为name的成员变量的详细信息，这个信息返回给Ivar类型的结构体。";
            Ivar ivar = class_getInstanceVariable(self.class, "_title");
            NSLog(@"---%s--%td--%s",ivar_getName(ivar),ivar_getOffset(ivar),ivar_getTypeEncoding(ivar));
            cell.detailTextLabel.text = [NSString stringWithFormat:@"例：Ivar ivar ="
                                         "class_getInstanceVariable(self.class, \"_title\");\n"
                                         "ivar_getName(ivar)=%s--ivar_getOffset(ivar)=%td--ivar_getTypeEncoding(ivar)=%s",ivar_getName(ivar),ivar_getOffset(ivar),ivar_getTypeEncoding(ivar)];
        }else if (indexPath.row == 4){
            cell.textLabel.text = @"class_getInstanceVariable获取cls类的名称为name的成员变量的详细信息，这个信息返回给Ivar类型的结构体。";
            Ivar ivar = class_getInstanceVariable(self.class, "_title");
            NSLog(@"---%s--%td--%s",ivar_getName(ivar),ivar_getOffset(ivar),ivar_getTypeEncoding(ivar));
            cell.detailTextLabel.text = [NSString stringWithFormat:@"例：Ivar ivar ="
                                         "class_getInstanceVariable(self.class, \"_title\");\n"
                                         "ivar_getName(ivar)=%s--ivar_getOffset(ivar)=%td--ivar_getTypeEncoding(ivar)=%s",ivar_getName(ivar),ivar_getOffset(ivar),ivar_getTypeEncoding(ivar)];
        }
        
    }
//    cell.textLabel.text = @"";
//    cell.detailTextLabel.text = @"";
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
