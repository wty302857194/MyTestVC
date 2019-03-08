//
//  MyAnimationViewController.m
//  MyTestVC
//
//  Created by wbb on 2017/8/15.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "MyAnimationViewController.h"

@interface MyAnimationViewController (){
    double a ;
}
@property (nonatomic, strong)CAShapeLayer *lineLayer;
@end

@implementation MyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    a = 0;
    // Do any additional setup after loading the view from its nib.
    [self fillAndline];
    [self pointAnimation];
}
- (void)pointAnimation {
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.frame = CGRectMake(10, 300, 100, 100);
    self.lineLayer.lineWidth = 5;
    self.lineLayer.lineCap = kCALineCapRound;
    self.lineLayer.lineJoin = kCALineJoinRound;
//    self.lineLayer.fillColor = [UIColor redColor].CGColor;
    self.lineLayer.strokeColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:self.lineLayer];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(5, 5)];
    [path addLineToPoint:CGPointMake(5, 80)];
    [path moveToPoint:CGPointMake(5, 80)];
    [path addLineToPoint:CGPointMake(80, 80)];
    [path moveToPoint:CGPointMake(80, 80)];
    [path addLineToPoint:CGPointMake(80, 5)];
    [path moveToPoint:CGPointMake(80, 5)];
    [path addLineToPoint:CGPointMake(5, 5)];
    
    self.lineLayer.path = path.CGPath;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0, 0, 5, 5);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.lineLayer addSublayer:layer];
    
//    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"path"];
//    ani.fromValue = @(CGPointMake(5, 5));
//    ani.toValue = @(CGPointMake(80, 5));
//    ani.duration = 1.0f;
//    [layer addAnimation:ani forKey:@"AnimateCirclePath"];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.values = @[[NSValue valueWithCGPoint:layer.frame.origin],
                         [NSValue valueWithCGPoint:CGPointMake(5, 5)],
                                                                 [NSValue valueWithCGPoint:CGPointMake(5, 80)],
                                                                [NSValue valueWithCGPoint:CGPointMake(80, 80)],
                                                                 [NSValue valueWithCGPoint:CGPointMake(80, 5)]];
//    animation.repeatCount = 1000;
//    animation.autoreverses = NO;
    animation.calculationMode = kCAAnimationLinear;
    animation.duration = 4;
    [layer addAnimation:animation forKey:@"rectRunAnimation"];

}

- (void)huaDong {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 300, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.frame = view.bounds;
    self.lineLayer.lineWidth =   10;
    self.lineLayer.lineCap = kCALineCapRound;
    self.lineLayer.lineJoin = kCALineJoinRound;
    self.lineLayer.fillColor = [UIColor redColor].CGColor;
    self.lineLayer.strokeColor = [UIColor yellowColor].CGColor;
    [view.layer addSublayer:self.lineLayer];
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(5, 5)];
    [path addLineToPoint:CGPointMake(5, 80)];
    [path moveToPoint:CGPointMake(5, 80)];
    [path addLineToPoint:CGPointMake(80, 80)];
    [path moveToPoint:CGPointMake(80, 80)];
    [path addLineToPoint:CGPointMake(80, 5)];
    [path moveToPoint:CGPointMake(80, 5)];
    [path addLineToPoint:CGPointMake(5, 5)];
    self.lineLayer.path = path.CGPath;
    self.lineLayer.strokeStart = 0.f;
    self.lineLayer.strokeEnd = 0.f;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        a++;
        if (a>10) {
            [timer invalidate];
            return ;
        }
//        self.lineLayer.strokeStart = a/100;
        self.lineLayer.strokeEnd = a/10;
    }];
}
- (void)cacanimation {
    CAShapeLayer *shapeLayer = [CAShapeLayer new];
    shapeLayer.fillColor = [UIColor redColor].CGColor;  //填充颜色
//    shapeLayer.lineWidth = 2.f;
//    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
    
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 400)];
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 200, 400) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(30, 100)];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 400) radius:100 startAngle:0 endAngle:M_PI/2.f clockwise:YES];
//    [path addArcWithCenter:CGPointMake(200, 400) radius:100 startAngle:M_PI/2.f endAngle:M_PI clockwise:YES];
//    [path closePath];
    shapeLayer.path = path.CGPath;
    
    
    
    
}
- (void)bezierPath {
    CAShapeLayer *shapeLayer = [CAShapeLayer new];
    shapeLayer.fillColor = [UIColor redColor].CGColor;  //填充颜色
    [self.view.layer addSublayer:shapeLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 200, 10, 100) cornerRadius:50];
    path.lineJoinStyle = kCGLineJoinRound;
    //    [path addArcWithCenter:CGPointMake(200, 400) radius:100 startAngle:M_PI/2.f endAngle:M_PI clockwise:YES];
    //    [path closePath];
    shapeLayer.path = path.CGPath;

}
- (void)layoutSubviews {
    
    UIColor *color = [UIColor orangeColor];
    [color set];
    //创建path
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置线宽
    path.lineWidth = 3;
    //线条拐角
    path.lineCapStyle = kCGLineCapRound;
    //终点处理
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path moveToPoint:(CGPoint){100,100}];
    [path addLineToPoint:(CGPoint){200,100}];
    [path addLineToPoint:(CGPoint){250,150}];
    [path addLineToPoint:(CGPoint){200,200}];
    [path addLineToPoint:(CGPoint){100,200}];
    [path addLineToPoint:(CGPoint){50,150}];
    [path closePath];
    //根据坐标点连线
    
    [path stroke];//如果修改最后一句代码将[path stroke]改成[path fill];   是填充的意思
    
}
- (void)juXing {
    //线条颜色
    UIColor *color = [UIColor orangeColor];
    [color set];
    
    //创建path
    //rect四个值分别为（x、y、矩形长，矩形宽）
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:(CGRect){10,20,100,50}];
    //设置线宽
    path.lineWidth = 3;
    //线条拐角
    path.lineCapStyle = kCGLineCapRound;
    //终点处理
    path.lineJoinStyle = kCGLineJoinRound;
    
    //根据坐标点连线
    [path stroke];
}
- (void)threeBezier {
    //线条颜色
    UIColor *color = [UIColor orangeColor];
    [color set];
    
    //添加路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    path.lineWidth = 3;
    //线条拐角
    path.lineCapStyle = kCGLineCapRound;
    //终点处理
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path moveToPoint:(CGPoint){20,100}];
    [path addCurveToPoint:(CGPoint){150,70} controlPoint1:(CGPoint){70,30} controlPoint2:(CGPoint){80,120}];
    
    //根据坐标点连线
    [path stroke];
}
- (void)fillAndline {
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.fillColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:shapeLayer1];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:60 startAngle:0 endAngle:M_PI/2.f clockwise:YES];
    shapeLayer1.path = path.CGPath;
    
    
    CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.fillColor = [UIColor clearColor].CGColor;
    shapeLayer2.lineWidth = 2.f;
    shapeLayer2.strokeColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:shapeLayer2];

    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:60 startAngle:M_PI/2.f endAngle:M_PI clockwise:YES];
    shapeLayer2.path = path2.CGPath;
}


- (void)fillView {
    CGSize finalSize = CGSizeMake(CGRectGetWidth(self.view.frame), 600);
    CGFloat layerHeight = finalSize.height * 0.2;
    CAShapeLayer *bottomCurveLayer = [[CAShapeLayer alloc]init];
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, finalSize.height - layerHeight)];
    [path addLineToPoint:CGPointMake(0, finalSize.height - 1)];
    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - 1)];
    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - layerHeight)];
    [path addQuadCurveToPoint:CGPointMake(0, finalSize.height - layerHeight) controlPoint:CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) - 40)];
    
    
    bottomCurveLayer.path = path.CGPath;
    bottomCurveLayer.fillColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:bottomCurveLayer];

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

@end
