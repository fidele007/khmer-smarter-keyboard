#import "KSKImageCropper.h"

@implementation KSKImageCropper : UIViewController
- (id)initWithImage:(UIImage *)image {
  _importedImage = image;
  return [self init];
}

- (void)setImportedImage:(UIImage *)image {
  _importedImage = image;
}

- (UIImage *)importedImage {
  return _importedImage;
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

  [self addCropRectangle];
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
  CGRect imageViewFrame = self.cropRectangle.frame;
  CGFloat imageViewHeight = _importedImage.size.height * CGRectGetWidth(imageViewFrame)/_importedImage.size.width;
  self.imageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), imageViewHeight);
  self.imageView.image = [self importedImage];

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
  CGRect cropRectangleFrame = self.cropRectangle.frame;
  CGFloat topPadding = CGRectGetMinY(cropRectangleFrame);
  CGFloat bottomPadding = CGRectGetHeight(self.view.bounds) - CGRectGetMinY(cropRectangleFrame) - CGRectGetHeight(cropRectangleFrame);
  self.scrollView.contentInset = UIEdgeInsetsMake(topPadding, 0, bottomPadding, 0);
}

- (void)addCropRectangle {
  self.cropRectangle = [[[UIView alloc] init] autorelease];
  CGFloat superviewHeight = CGRectGetHeight(self.view.frame);
  CGFloat rectWidth = CGRectGetWidth(self.view.frame);
  CGFloat keyboardRatio = 250.0/375.0;
  CGFloat rectHeight = rectWidth * keyboardRatio;
  self.cropRectangle.frame = CGRectMake(0, superviewHeight/4.0, rectWidth, rectHeight);
  self.cropRectangle.layer.borderColor = [UIColor whiteColor].CGColor;
  self.cropRectangle.layer.borderWidth = 1.0f;
  self.cropRectangle.backgroundColor = [UIColor clearColor];
  self.cropRectangle.userInteractionEnabled = NO; // This allows interaction for subviews under it
  [self.view addSubview:self.cropRectangle];
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

- (void)cancelButtonPressed:(UIButton *)sender {
  [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveButtonPressed:(UIButton *)sender {
  HBLogDebug(@"Saved photo here");
}
@end
