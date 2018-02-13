//
//  ViewController.m
//  TestServer
//
//  Created by zhangyaowu on 2018/2/8.
//  Copyright © 2018年 zhangyaowu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) NSThread *myThread;
@property (nonatomic,assign)BOOL iden;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self alwaysLiveBackGoundThread];
//    [self alwaysLiveBackGoundThread1];
//    [self group];
}
#pragma mark if
- (void)alwaysLiveBackGoundThread{
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(myThreadRun) object:@"etund"];
    self.myThread = thread;
    thread.name = @"test";
    [self.myThread start];
    
}
- (void)myThreadRun{
    NSLog(@"my thread run");
    NSLog(@"%@",[NSThread currentThread]);
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//[[NSRunLoop currentRunLoop] run];
    NSLog(@"------------");
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",self.myThread);
    [self performSelector:@selector(doBackGroundThreadWork) onThread:self.myThread withObject:nil waitUntilDone:NO];

}
- (void)doBackGroundThreadWork{
    NSLog(@"do some work %s",__FUNCTION__);
    NSLog(@"%@",[NSThread currentThread]);
    //    CFRunLoopStop(CFRunLoopGetCurrent());
}



#pragma mark while
- (void)alwaysLiveBackGoundThread1{
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(myThreadRun1) object:@"etund"];
    self.myThread = thread;
    thread.name = @"test";
    [self.myThread start];
    
}
- (void)myThreadRun1{
    NSLog(@"my thread run");
    NSLog(@"%@",[NSThread currentThread]);
    
    self.iden = YES;
    while (self.iden) {
        NSLog(@"---while1----");
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"---while2----");
    }
    //    [[NSRunLoop currentRunLoop] run];
    NSLog(@"------------");
    
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"%@",self.myThread);
//    [self performSelector:@selector(doBackGroundThreadWork1) onThread:self.myThread withObject:nil waitUntilDone:NO];
//
//}
- (void)doBackGroundThreadWork1{
    NSLog(@"do some work %s",__FUNCTION__);
    NSLog(@"%@",[NSThread currentThread]);
//    self.iden = NO;
    
    
    //    CFRunLoopStop(CFRunLoopGetCurrent());
}



//- (void)xinhao{
//    dispatch_queue_t queue = dispatch_queue_create("com.xx.xx", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue1 = dispatch_queue_create("com.zyw.xx", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_semaphore_t sema = dispatch_semaphore_create(1);
//
//    dispatch_block_t block = dispatch_block_create(0, ^{
//        dispatch_apply(100, queue, ^(size_t index) {
//            dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//
//
//            dispatch_async(queue1, ^{
//                NSLog(@"%zu",index);
//                dispatch_semaphore_signal(sema);
//            });
//        });
//
//    });
//
//    dispatch_queue_t queue2 = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue2, block);
//
//    dispatch_block_wait(block, DISPATCH_TIME_FOREVER);
//    NSLog(@"over");
//}
//
//- (void)group{
//     dispatch_queue_t queue = dispatch_queue_create("com.zyw.first", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_group_t group =  dispatch_group_create();
//    NSLog(@"----1");
////    dispatch_group_async(queue, ^{
////        NSLog(@"111:%@",[NSThread currentThread]);
////    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"111:%@",[NSThread currentThread]);
//
//        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
//    });
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"222:%@",[NSThread currentThread]);
//    });
//    NSLog(@"----2");
//    dispatch_group_notify(group, queue, ^{
//       NSLog(@"group:%@",[NSThread currentThread]);
//    });
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"333:%@",[NSThread currentThread]);
//    });
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"444:%@",[NSThread currentThread]);
//    });
//
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    NSLog(@"over");
//}
//
//- (void)barrier{
//    dispatch_queue_t queue = dispatch_queue_create("com.zyw.first", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"----1");
//    dispatch_async(queue, ^{
//        NSLog(@"111:%@",[NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"222:%@",[NSThread currentThread]);
//    });
//    NSLog(@"----2");
//    dispatch_barrier_async(queue, ^{
//        NSLog(@"3333:%@",[NSThread currentThread]);
//    });
//    NSLog(@"----3");
//    dispatch_async(queue, ^{
//        NSLog(@"444:%@",[NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"555:%@",[NSThread currentThread]);
//    });
//    NSLog(@"----4");
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
