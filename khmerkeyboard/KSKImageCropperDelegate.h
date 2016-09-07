@protocol KSKImageCropperDelegate <NSObject>
@optional
- (void)imageCropper:(UIViewController *)cropper didFinishCroppingImageWithResult:(UIImage *)image;
@end