# ZRTabView
An easy lightweight tab bar controller that is scrollable and tab bar items are flexible with text sizes.

**Sample screenshots**

<img src="<img src=“…/ScreenShot.png" width="200" />" width="200" />

**Usage sample**

```
- (void) initializeTabView
{
    TestViewController *test1 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"testViewController"];
    
    TestViewController *test2 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"testViewController"];
    [test2.view setBackgroundColor:[UIColor lightGrayColor]];
    
    TestViewController *test3 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"testViewController"];
    [test3.view setBackgroundColor:[UIColor orangeColor]];
    
    ZRTabView *tabView = [[ZRTabView alloc] initWithPoint:CGPointMake(0, 0) withViews:[NSMutableArray arrayWithObjects:test1, test2, test3, nil] viewsNameArray:[NSMutableArray arrayWithObjects:@"ANYTHING", @"ANYTHING MORE", @"ANY WISH YOU WANT TO WRITE", nil] initialSelection:0];
    tabView.delegate = self;
    
    [self.view addSubview:tabView];
}

```

You will get the selected index on delegate method

```
-(void)didSelectTabBarWidgetIndex:(int)index
{
...
}
````