//
//  UIImage+Extensions.swift
//  imdb
//
//  Created by User01 on 22/6/23.
//

import UIKit
import AVFoundation

extension UIImage {
    func curvedImageWithRadius(radius: CGFloat) -> UIImage? {
        let imageRect = CGRect(origin: .zero, size: self.size)
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        // Create rounded path with specified radius
        let path = UIBezierPath(roundedRect: imageRect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: radius * scale, height: radius * scale))
        
        context.addPath(path.cgPath)
        context.clip()
        
        self.draw(in: imageRect)
        
        let curvedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        return curvedImage
    }
    
    func addBlurredImageUnderneath(posterSize: CGSize) -> UIImage? {
    
        let originalImage: UIImage = self
        // Create a CIImage from the original image
        guard let ciImage = CIImage(image: originalImage) else {
            return nil
        }
        
        // Apply a Gaussian blur filter to the CIImage
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(16, forKey: kCIInputRadiusKey) // Adjust the blur radius as desired
        
        guard let outputCIImage = filter?.outputImage else {
            return nil
        }
        
        // Convert the CIImage to a UIImage
        let context = CIContext(options: nil)
        guard let outputCGImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else {
            return nil
        }
        
        let blurredImage = UIImage(cgImage: outputCGImage)
        
        // Combine the original image and the blurred image
        UIGraphicsBeginImageContextWithOptions(originalImage.size, false, originalImage.scale)
        blurredImage.draw(at:
                .init(x: -32 * scale, y: -32 * scale)
        )
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return combinedImage
    }
    
    func redrawImageWithAspectFit(image: UIImage, size: CGSize) -> UIImage? {
        let image = self
        let aspectFitSize = AVMakeRect(aspectRatio: image.size, insideRect: CGRect(origin: .zero, size: size)).size
        
        let renderer = UIGraphicsImageRenderer(size: aspectFitSize)
        
        let resizedImage = renderer.image { context in
            image.draw(in: CGRect(origin: .zero, size: aspectFitSize))
        }
        
        return resizedImage
    }





}

