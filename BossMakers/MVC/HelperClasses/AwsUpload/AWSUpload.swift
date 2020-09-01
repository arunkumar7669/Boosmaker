//
//  AWSUpload.swift
//  AWSDemo
//
//  Created by Apple on 30/07/19.
//  Copyright © 2019 Abhishek singh. All rights reserved.
//

import UIKit
import Foundation
import AWSS3
import AWSCore


class AWSUploadImage {
    static let shared = AWSUploadImage()
    
    var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
    var progressBlock: AWSS3TransferUtilityProgressBlock?
    var finalProgress: Float = 0.0
    
    private init() {
        
    }
    
    func deleteFile(name: String,_ completion : @escaping (Bool)->Void) {
        let s3 = AWSS3.default()
        let deleteObjectRequest = AWSS3DeleteObjectRequest()
        deleteObjectRequest?.bucket = AWSConstant.bucketName
        deleteObjectRequest?.key = name
        s3.deleteObject(deleteObjectRequest!).continueWith { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                print("Error occurred: \(error)")
                completion(false)
                return nil
            }
            completion(true)
            print("Deleted successfully.")
            return nil
        }
    }
    
    
    func uploadFile(_ data: Data, fileName: String, fileUrl: String,_ completion : @escaping (String)->Void) {
        let access = AWSConstant.accessToken
        let secret = AWSConstant.secretKey
        let credentials = AWSStaticCredentialsProvider(accessKey: access, secretKey: secret)
        let configuration = AWSServiceConfiguration(region: AWSRegionType.USEast2, credentialsProvider: credentials)
        configuration?.allowsCellularAccess = true
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        guard let url = URL(string: fileUrl) else { return }
    
        let uploadRequest = AWSS3TransferManagerUploadRequest()!
        uploadRequest.body = url
        
        let path = fileUrl
        let mime = MimeType(path: path).value
        
//        uploadRequest.key = fileName + ".\(MimeType(path: path).ext ?? "")"
        uploadRequest.key = fileName
        uploadRequest.bucket = AWSConstant.bucketName
        
        uploadRequest.contentType = mime
        uploadRequest.acl = .publicRead
        
        self.progressBlock = {(task, progress) in
            DispatchQueue.main.async(execute: {
                if (self.finalProgress < Float(progress.fractionCompleted)) {
                    self.finalProgress = Float(progress.fractionCompleted)
                }
            })
        }
        
        self.completionHandler = { (task, error) -> Void in
            DispatchQueue.main.async(execute: {
                if let error = error {
                    print("Failed with error: \(error)")
                    print("Failed")
                }
                else if(self.finalProgress != 1.0) {
//                    self.statusLabel.text = "Failed"
                    NSLog("Error: Failed - Likely due to invalid region / filename")
                }
                else{
                    print("Success")
                }
            })
        }
        
        
        let expression = AWSS3TransferUtilityUploadExpression()
        AWSS3TransferUtility.default().uploadData(
            data,
            bucket: AWSConstant.bucketName,
            key: fileName,
            contentType: mime,
            expression: expression,
            completionHandler: completionHandler).continueWith { (task) -> AnyObject? in
                if let error = task.error {
                    print("Error: \(error.localizedDescription)")

                    DispatchQueue.main.async {
                         print("Failed")
                    }
                }

                if let result = task.result {

                    DispatchQueue.main.async {
//                        self.statusLabel.text = "Uploading..."
                        print("Upload Starting!")
                        
                        let url = AWSS3.default().configuration.endpoint.url
                        let publicURL = url?.appendingPathComponent(uploadRequest.bucket!).appendingPathComponent(uploadRequest.key!)
                        completion(publicURL?.absoluteString ?? "")
                        print("Uploaded to:\(publicURL)")
                    }

                    // Do something with uploadTask.
                }

                return nil;
        }
        
//        let transferManager = AWSS3TransferManager.default()
//        let expression = AWSS3TransferUtilityUploadExpression()
//
//        let transferUtility = AWSS3TransferUtility.default()
//        var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
//
//        completionHandler = { (task, error) -> Void in
//
//            DispatchQueue.main.async(execute: {
//
//            })
//
//        }
        
//        transferUtility.uploadData(data, bucket: AWSConstant.bucketName, key: fileName, contentType: "image/", expression: expression, completionHandler: completionHandler).continueWith { (task) -> Any? in
//
//            if let error = task.error {
//
//                print("Error : \(error.localizedDescription)")
//
//            }
//            if task.result != nil {
//                let url = AWSS3.default().configuration.endpoint.url
//
//                let publicURL = url?.appendingPathComponent(AWSConstant.bucketName).appendingPathComponent(fileName)
//
//                if let absoluteString = publicURL?.absoluteString {
//
//                    print("Image URL : ",absoluteString)
//                    completion(absoluteString)
//
//                }
//            }
//
//            return nil
//
//
//        }
        
        
        
//        transferManager.upload(uploadRequest).continueWith(block: { (task: AWSTask<AnyObject>) -> Any? in
//            if let error = task.error {
//                print("Upload failed with error: (\(error.localizedDescription))")
//                return nil
//            }
////            if let exception = task.description {
//                print("Upload failed with exception (\(task.description))")
////            }
//
//            if task.result != nil {
//                let url = AWSS3.default().configuration.endpoint.url
//                let publicURL = url?.appendingPathComponent(uploadRequest.bucket!).appendingPathComponent(uploadRequest.key!)
//                completion(publicURL?.absoluteString ?? "")
//                print("Uploaded to:\(publicURL)")
//            }
//            return nil
//        })
        
    }
    
//    func uploadFile(withImage image:UIImage,_ completion : @escaping (String)->Void) {
//        let access = AWSConstant.accessToken
//        let secret = AWSConstant.secretKey
//        let credentials = AWSStaticCredentialsProvider(accessKey: access, secretKey: secret)
//        let configuration = AWSServiceConfiguration(region: AWSRegionType.USEast2, credentialsProvider: credentials)
//        configuration?.allowsCellularAccess = true
//
//        AWSServiceManager.default().defaultServiceConfiguration = configuration
//        let s3BucketName = AWSConstant.bucketName
//
//        let compressedImage = self.resizeImage(image: image, targetSize: CGSize(width: 80, height: 80)).pngData()
//
//        let remoteName =  "post/" + generateRandomStringWithLength(length: 12) + "user_paundit" +  ".png"
//        print("REMOTE NAME : ",remoteName)
//        let expression = AWSS3TransferUtilityUploadExpression()
//
//
//        var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
//
//        completionHandler = { (task, error) -> Void in
//
//            DispatchQueue.main.async(execute: {
//
//            })
//
//        }
//
//        guard let url = URL(string: "") else {
//            return
//        }
//
//        let remoteFileName = "Name of uploaded file"
//        let S3BucketName = "Name of your bucket on Amazon S3"
//        let uploadRequest = AWSS3TransferManagerUploadRequest()!
//        uploadRequest.body = url
//        uploadRequest.key = remoteFileName
//        uploadRequest.bucket = S3BucketName
//        uploadRequest.contentType = "image/jpeg"
//        uploadRequest.acl = .publicRead
//
////        let transferUtility = AWSS3TransferUtility.default()
////        transferUtility.uploadFile(<#T##fileURL: URL##URL#>, key: <#T##String#>, contentType: <#T##String#>, expression: <#T##AWSS3TransferUtilityUploadExpression?#>, completionHandler: <#T##AWSS3TransferUtilityUploadCompletionHandlerBlock?##AWSS3TransferUtilityUploadCompletionHandlerBlock?##(AWSS3TransferUtilityUploadTask, Error?) -> Void#>)
////
////
////
////
////
////
////
////        //-----------
////        if image.pngData() != nil{
////
////
////
////
////
//            transferUtility.uploadData(image.pngData()!, bucket: s3BucketName, key: remoteName, contentType: "image/", expression: expression, completionHandler: completionHandler).continueWith { (task) -> Any? in
//
//                if let error = task.error {
//
//                    print("Error : \(error.localizedDescription)")
//
//                }
//                if task.result != nil {
//                    let url = AWSS3.default().configuration.endpoint.url
//
//                    let publicURL = url?.appendingPathComponent(s3BucketName).appendingPathComponent(remoteName)
//
//                    if let absoluteString = publicURL?.absoluteString {
//
//                        print("Image URL : ",absoluteString)
//                        completion(absoluteString)
//
//                    }
//                }
//
//                return nil
//
//
//            }
//
//        }
//    }
    
     func generateRandomStringWithLength(length: Int) -> String {
        
        let randomString: NSMutableString = NSMutableString(capacity: length)
        
        let letters: NSMutableString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var i: Int = 0
        while i < length {
            
            let randomIndex: Int = Int(arc4random_uniform(UInt32(letters.length)))
            
            randomString.append("\(Character( UnicodeScalar( letters.character(at: randomIndex))!))")
            i += 1
        }
        return String(randomString)
    }
    
     func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width
        let heightRatio = targetSize.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize = CGSize(width: widthRatio, height: heightRatio)
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: widthRatio, height: heightRatio)
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? UIImage()
    }

}

struct AWSConstant {
    static let accessToken = "AKIAJGXCIEJHBGJ3YRXA"
    static let secretKey = "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"
    static let bucketName = "dev-dandoop"
    static let bucketRegion = "us-east-2"
}
