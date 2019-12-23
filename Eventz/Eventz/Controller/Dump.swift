////
////  Dump.swift
////  Eventz
////
////  Created by Max Nabokow on 12/14/19.
////  Copyright © 2019 Maximilian Nabokow. All rights reserved.
////
//
//
//override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
////        NotificationCenter.default.removeObserver(self)
//    }
//
//@objc fileprivate func handleKeyboardShow(notification: Notification) {
//    guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
//    let keyboardFrame = value.cgRectValue
//    
//    // Calculate distance from botton of signUpButton to bottom of the screen
//    let bottomspace = view.frame.height - stackView.frame.origin.y - stackView.frame.height
//    
//    let difference = keyboardFrame.height - bottomspace
//    if difference > 0 {
//        view.transform = CGAffineTransform(translationX: 0, y: -difference - 12)
//    }
//}
//
//@objc fileprivate func handleKeyboardHide() {
//    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//        self.view.transform = .identity
//    })
//}
//
//fileprivate func setupNotificationObservers() {
//    NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//    NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//}
//
//override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//    super.touchesEnded(touches, with: event)
//    view.endEditing(true)
//}
