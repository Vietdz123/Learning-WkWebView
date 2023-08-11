//
//  ImportGoogleDriveController.swift
//  Learning-WkWebView
//
//  Created by Tiến Việt Trịnh on 08/08/2023.
//

import UIKit
import GoogleSignIn
import GoogleAPIClientForREST
import GTMSessionFetcher

class ImportGoogleDriveController: UIViewController {
    
    //MARK: - Properties
    fileprivate let service = GTLRDriveService()

    
    private lazy var siginVuiew: SiginButtonView = {
        let view = SiginButtonView()
        view.addTarget(self, action: #selector(handleSiginTapped), for: .touchUpInside)
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("get Data", for: .normal)

        button.addTarget(self, action: #selector(handleSearchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func handleSearchButtonTapped() {
        listFiles("240742351_244197850803598_8758922099910121959_n.png")
    }
    //MARK: - UIComponent
    
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupGoogleSignIn()
    }
    
    func configureUI() {
        view.backgroundColor = .red
        view.addSubview(siginVuiew)
        view.addSubview(searchButton)
        
        siginVuiew.frame = .init(x: 200, y: 200, width: 100, height: 100)
        searchButton.frame = .init(x: 200, y: 400, width: 100, height: 100)
        service.apiKey = "AIzaSyBbrMA36_nm36NCMiy3pQoLmmxhzROidBI"
        
    }
    
}

//MARK: - Method
extension ImportGoogleDriveController {
    
    //MARK: - Helpers
    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        GIDSignIn.sharedInstance().scopes = [kGTLRAuthScopeDriveReadonly]
        GIDSignIn.sharedInstance()?.signInSilently()
        
    }
    
    //MARK: - Selectors
    @objc func handleSiginTapped() {

        
        GIDSignIn.sharedInstance().signInSilently()

    }
}

// MARK: - Delegate GIDSignInDelegate
extension ImportGoogleDriveController: GIDSignInDelegate, GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let _ = error {
            
        } else {
            service.authorizer = GIDSignIn.sharedInstance().currentUser.authentication.fetcherAuthorizer()
            print("Authenticate successfully")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("Did disconnect to user")
        
    }
    
    public func listFiles(_ folderID: String) {
        let root = "(mimeType = 'image/jpeg' or mimeType = 'image/png' or mimeType = 'application/pdf') or (name contains '\(folderID)')"
        
        let query = GTLRDriveQuery_FilesList.query()
        query.pageSize = .max
//        query.pageToken = nil
        query.q = root
        query.fields = "files(id,name,mimeType,modifiedTime,fileExtension,size,iconLink, thumbnailLink, hasThumbnail),nextPageToken"
  
        service.executeQuery(query)  { ticker, result, error in
            let data = result as! GTLRDrive_FileList
            print("DEBUG: \(data.files?.count)")
            print("DEBUG: \(String(describing: data.files?[0].name))")
        }
        
//        service.executeQuery(a) { ticker, result, error in
//            guard let result = result as? GTLRDataObject else {
//                print("DEBUG: failed \(String(describing: result)) ")
//
//                return
//            }
//            print("DEBUG: \(String(describing: result.contentType))")
//            let filename = URL.videoEditorFolder()?.appendingPathComponent("Siuuuu")
//            try? result.data.write(to: filename!)
//            print("DEBUG: \(String(describing: URL.videoEditorFolder()))")
//        }
    }
}

