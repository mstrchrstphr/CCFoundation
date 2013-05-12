CCFoundation
============

UIKit categories, utilities and other helpful snippets. Tasks I find helpful across all apps.

## Some Examples

```obj-c
// Lot's of useful little NSString methods...
- (NSString *)incrementIntegerValue; // e.g. @"1" -> @"2"
- (BOOL)isValidEmail;
+ (NSString *)stringRepresentationOfNumberOfBytes:(uint64_t)numOfBytes; // e.g. 102.95 KB
```

```obj-c
// Many new UIView methods…
- (UIViewController *)firstAvailableUIViewControllerOfType:(Class)type;
- (UIView *)viewWithTagObject:(id)object;
```

```obj-c
// Get a random pastel-color
+ (UIColor *)randomPastelColor;
```

```obj-c
// MKMapView
- (void)centerMapOnAnnotations;
```

```obj-c
// Expand UITextFields dynamically to text.
- (CGFloat)setText:(NSString *)text andExpandVerticallyUpTo:(CGFloat)maxHeight;
```

```obj-c
// Who wants to type in all that unnecessary code?
+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName;
```

## Contributing

You're the best if you do.

1. Fork
2. Code
3. Comment :)

## License

The MIT License (MIT)

Copyright (c) 2013 Christopher Constable

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.