

import UIKit
import AuthenticationServices
class ViewController: UIViewController,ASAuthorizationControllerDelegate {
    @IBOutlet var appleSignInButtonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSignInAppleButton()
        // Do any additional setup after loading the view.
    }
    func setUpSignInAppleButton() {
        if #available(iOS 13.0, *) {
            var authorizationButton = ASAuthorizationAppleIDButton.init(type: ASAuthorizationAppleIDButton.ButtonType.signIn, style: ASAuthorizationAppleIDButton.Style.whiteOutline)
            authorizationButton.translatesAutoresizingMaskIntoConstraints = false
            authorizationButton.addTarget(self, action: #selector(self.signInWithAppleButtonAction), for: .touchUpInside)
            authorizationButton.cornerRadius = CGFloat(8)
            self.view.addSubview(authorizationButton)
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[authorizationButton]-(0)-|", options: [], metrics: nil, views: ["authorizationButton": authorizationButton]))
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[authorizationButton(45)]-(0)-|", options: [], metrics: nil, views: ["authorizationButton": authorizationButton]))
        } else {
            // Fallback on earlier versions
        }
    }
    @objc func signInWithAppleButtonAction() {
        
        if #available(iOS 13.0, *) {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.performRequests()
        }
    }
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
            //            AppleIDSignInManager.shared.currentAuthAppleUserID = appleIDCredential.user // store apple user ID
            let externalAccessToken = String(decoding: appleIDCredential.authorizationCode!, as: UTF8.self)
            let externalAccountCode = String(decoding: appleIDCredential.identityToken!, as: UTF8.self)
            print(appleIDCredential)
            print(appleIDCredential.authorizationCode)
            print(externalAccessToken)
            print(appleIDCredential.identityToken)
            print(externalAccountCode)
            
            
            //            self.authenticateWithExternalAccountCredentials("DW7zZ0kF0YSPUroq5H4jnm3j7RpfK9t9BB6T0sgSK8", externalAccountCode: externalAccountCode, externalAccessToken:externalAccessToken, externalTokenSecret: nil)
            DispatchQueue.main.async{
                //                if let hasToken = AppleIDSignInManager.shared.getUserRefreshTokenForAppleUserID(){
                //                    self.showHudWithMessage("")
                //                    let onSuccess = {(guestTokenResponse: PXOAuthAuthentication?) -> Void in
                //                        if let hasAuth = guestTokenResponse{
                //                            self.appDelegate().modelAPI.signIn(withRefreshToken: hasAuth.printedCardNumber, oauthTokens: hasAuth, cardTemplateCode: AppSettings.shared().cardTemplateCode(), delegate: self as PXSignInOrRegisterDelegate)
                //                        }else{
                //                            self.hideHud()
                //                        }
                //                    }
                //                    let onError = {(error: Error?) -> Void in
                //                        self.hideHud()
                //                        if let hasValue = error?.localizedDescription{
                //                            self.showAlert(title: "", description: hasValue, rightButton: "OK", leftButton: nil) { (status) in }
                //                        }
                //                    }
                //                    self.appDelegate().modelAPI.directAPI.oauth.refreshToken(hasToken, scope: ["user_read","user_write","account_read","account_write"], onSuccess: onSuccess, onError: onError)
                //                }else{
                //                     Show Signup and Login bottom sheet
                //                    let storyBoard = UIStoryboard(name: "ThemeOneScreen", bundle: nil)
                //                    if let signInAppleObject = storyBoard.instantiateViewController(withIdentifier: "SignInWithAppleSheet") as? SignInWithAppleSheet{
                //                        self.showDimView()
                //                        signInAppleObject.view.frame = CGRect.init(x: signInAppleObject.view.frame.origin.x, y: UIScreen.main.bounds.height, width: signInAppleObject.view.frame.size.width, height: signInAppleObject.view.frame.height)
                //                        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
                //                            signInAppleObject.view.frame = UIScreen.main.bounds
                //                        }, completion: { _ in
                //                        })
                //                        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(signInAppleObject.view)
                //                        UIApplication.shared.keyWindow?.rootViewController?.addChild(signInAppleObject)
                //                }
            }
        }
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
       
    }
}

