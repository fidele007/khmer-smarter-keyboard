@interface KSKImageCropper : UIViewController <UIScrollViewDelegate> {
  UIImage *_importedImage;
  UIButton *_cancelButton;
  UIButton *_saveButton;
  UIView *_cropRectangle;
  UIScrollView *_scrollView;
  UIImageView *_imageView;
}
@property (nonatomic, strong) UIView *cropRectangle;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
- (id)initWithImage:(UIImage *)image;
- (void)setImportedImage:(UIImage *)image;
- (UIImage *)importedImage;
- (void)addCropRectangle;
- (void)addButtons;
- (void)cancelButtonPressed:(UIButton *)sender;
- (void)saveButtonPressed:(UIButton *)sender;
@end
