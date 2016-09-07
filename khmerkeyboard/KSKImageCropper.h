#import "KSKImageCropperDelegate.h"

@interface KSKImageCropper : UIViewController <UIScrollViewDelegate> {
  UIImage *_originalImage;
  UIButton *_cancelButton;
  UIButton *_saveButton;
  UIView *_cropRectView;
  UIScrollView *_scrollView;
  UIImageView *_imageView;
}
@property (nonatomic, strong) UIView *cropRectView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *croppedImage;
@property (nonatomic, assign) id<KSKImageCropperDelegate> delegate;
- (instancetype)initWithImage:(UIImage *)image;
- (void)setOriginalImage:(UIImage *)image;
- (UIImage *)originalImage;
- (void)addCropRectView;
- (void)addButtons;
- (UIButton *)saveButton;
- (UIButton *)cancelButton;
- (void)cancelButtonPressed:(UIButton *)sender;
- (void)saveButtonPressed:(UIButton *)sender;
@end
