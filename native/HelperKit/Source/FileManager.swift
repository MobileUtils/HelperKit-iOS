//
//  FileManager.swift
//  HelperKit
//
//  Created by Basheer Ahamed.S on 30/05/21.
//

import Foundation

public class CustomFileManager: NSObject {
    
    static func getDirectoryPath() -> String {
        let paths =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    static func createDirectory(as directoryName: String) {
        let fileManager = FileManager.default
        do {
            try fileManager.createDirectory(atPath: directoryName, withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    static func saveFile(fileData: Data, fileName: String) {
        let fileManager = FileManager.default
        fileManager.createFile(atPath: fileName, contents: fileData, attributes: nil)
    }
    
    static func getFileURL(fileName filePath: String) -> URL? {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            return URL(fileURLWithPath: filePath)
        } else {
            return nil
        }
    }
    
    static func getFile(fileName filePath: String) -> Data? {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            return fileManager.contents(atPath: filePath)
        } else {
            return nil
        }
    }
    
    @discardableResult static func createDirectory(_ folderFullPath: String) -> Bool {
        do {
            try FileManager.default.createDirectory(atPath: folderFullPath, withIntermediateDirectories: false, attributes: nil)
            return true
        } catch _ as NSError {
            return false
        }
    }
    
    static func isFileExist(path: String) -> Bool {
        return FileManager().fileExists(atPath: path)
    }
    
    static func isFileExist(relativePathWithExtention: String) -> Bool {
        let path = getDirectoryPath() + "/\(relativePathWithExtention)"
        return FileManager().fileExists(atPath: path)
    }
    
    static func deleteDirectory(name: String) {
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(name)
        if fileManager.fileExists(atPath: paths) {
            try! fileManager.removeItem(atPath: paths)
        } else {
            print("---> Error at CustomFileManager.swift")
        }
    }
}

