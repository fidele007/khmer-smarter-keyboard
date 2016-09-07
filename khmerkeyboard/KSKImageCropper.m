#import "KSKImageCropper.h"

@implementation KSKImageCropper : UIViewController
- (instancetype)initWithImage:(UIImage *)image {
  self = [super init];
  if (self) {
    _originalImage = [image copy];
  }
  return self;
}

- (void)setOriginalImage:(UIImage *)image {
  _originalImage = [image copy];
}

- (UIImage *)originalImage {
  return _originalImage;
}

- (BOOL)shouldAutorotate {
  return NO;
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}

- (void)viewDidLoad {
  UIView *view = [[[UIView alloc] initWithFrame:self.view.bounds] autorelease];
  view.backgroundColor = [UIColor blackColor];
  view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  self.view = view;

  [self addCropRectView];
  [self addButtons];
  [self addScrollableImage];
}

- (void)addScrollableImage {
  self.scrollView = [[[UIScrollView alloc] initWithFrame:self.view.bounds] autorelease];
  // self.scrollView.clipsToBounds = NO;
  // self.scrollView.minimumZoomScale = 0.5;
  self.scrollView.maximumZoomScale = 6.0;
  self.scrollView.delegate = self;

  self.imageView = [[[UIImageView alloc] init] autorelease];
  CGRect imageViewFrame = self.cropRectView.frame;
  CGFloat imageViewHeight = self.originalImage.size.height / self.originalImage.size.width;
  imageViewHeight *= CGRectGetWidth(imageViewFrame);
  self.imageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), imageViewHeight);
  self.imageView.image = [self originalImage];

  self.scrollView.contentSize = self.imageView.bounds.size;
  self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

  [self.scrollView addSubview:self.imageView];
  [self.view addSubview:self.scrollView];
  [self.view sendSubviewToBack:self.scrollView];

  [self setContentInset];
}

// Set what imageView will be zoomed in reponse to zoom gestures
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return self.imageView;
}

- (void)scrollViewDidZoom:(id)scrollView {
  [self setContentInset];
}

- (void)setContentInset {
  CGRect cropRectViewFrame = self.cropRectView.frame;
  CGFloat topPadding = CGRectGetMinY(cropRectViewFrame);
  CGFloat bottomPadding = CGRectGetHeight(self.view.bounds) - CGRectGetMinY(cropRectViewFrame);
  bottomPadding -= CGRectGetHeight(cropRectViewFrame);
  self.scrollView.contentInset = UIEdgeInsetsMake(topPadding, 0, bottomPadding, 0);
}

- (void)addCropRectView {
  self.cropRectView = [[[UIView alloc] init] autorelease];
  CGFloat superviewHeight = CGRectGetHeight(self.view.frame);
  CGFloat rectWidth = CGRectGetWidth(self.view.frame);
  CGFloat keyboardRatio = 250.0/375.0;
  CGFloat rectHeight = rectWidth * keyboardRatio;
  self.cropRectView.frame = CGRectMake(0, superviewHeight/4.0, rectWidth, rectHeight);
  self.cropRectView.layer.borderColor = [UIColor whiteColor].CGColor;
  self.cropRectView.layer.borderWidth = 1.0f;
  self.cropRectView.backgroundColor = [UIColor clearColor];
  self.cropRectView.userInteractionEnabled = NO; // This allows interaction for subviews under it
  [self.view addSubview:self.cropRectView];
}

- (void)addButtons {
  // Bar view
  CGRect superviewFrame = self.view.frame;
  UIView *barView = [[[UIView alloc] init] autorelease];
  barView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.5];
  barView.frame = CGRectMake(0, CGRectGetHeight(superviewFrame) - 80, CGRectGetWidth(superviewFrame), 80);
  [self.view addSubview:barView];

  CGFloat barWidth = CGRectGetWidth(barView.frame);
  CGFloat barHeight = CGRectGetHeight(barView.frame);
  _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [_cancelButton setTitle:@"បោះបង់" forState:UIControlStateNormal];
  [_cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  _cancelButton.titleLabel.font = [UIFont systemFontOfSize:18];
  [_cancelButton addTarget:self
                    action:@selector(cancelButtonPressed:)
          forControlEvents:UIControlEventTouchUpInside];
  [_cancelButton sizeToFit];
  _cancelButton.center = CGPointMake(50, barHeight/2.0);
  [barView addSubview:_cancelButton];

  _saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [_saveButton setTitle:@"រក្សាទុក" forState:UIControlStateNormal];
  [_saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  _saveButton.titleLabel.font = [UIFont systemFontOfSize:18];
  [_saveButton addTarget:self
                  action:@selector(saveButtonPressed:)
        forControlEvents:UIControlEventTouchUpInside];
  [_saveButton sizeToFit];
  _saveButton.center = CGPointMake(barWidth - 50, barHeight/2.0);
  [barView addSubview:_saveButton];
}

- (UIButton *)saveButton {
  return _saveButton;
}

- (UIButton *)cancelButton {
  return _cancelButton;
}

- (void)cancelButtonPressed:(UIButton *)sender {
  [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
  UIGraphicsBeginImageContext(newSize);
  [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}

- (void)saveButtonPressed:(UIButton *)sender {
  HBLogDebug(@"Saved photo here");
}
@end
