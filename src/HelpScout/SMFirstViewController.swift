//
//  FirstViewController.swift
//  TextExpanderDemoAppSwift
//
//  Created by Greg Scown on 7/23/16.
//  Copyright © 2016 SmileOnMyMac, LLC. All rights reserved.
//

import UIKit
import TextExpander

class SMFirstViewController: UIViewController, SMTextExpanderViewController, SMTEFillDelegate,UIPickerViewDelegate,UIPopoverPresentationControllerDelegate,UITextViewDelegate{

    @IBOutlet weak var textView: UITextView?
    
   //  @IBOutlet weak var textField: UITextField?
   //  @IBOutlet weak var searchBar: UISearchBar?
    
    @IBAction func addNoteBtn(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()){
            self.dismissViewControllerAnimated(true, completion: nil)
       }
    }

    var textExpander : SMTEDelegateController?
    var snippetExpanded: Bool = false
    var tapRecognizer: UITapGestureRecognizer?
    
    @IBAction func DismissBtn(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()){
            self.dismissViewControllerAnimated(true, completion: nil)

        }
    }
    @IBOutlet weak var statusField: UITextField!
    @IBOutlet weak var addNote: UIButton!
    
    var  status = ["ACTIVE","PENDING",
                   "CLOSED"]
    var selectedItem : Int = 0
    var picker = UIPickerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.backgroundColor = UIColor
        .blueColor()
        
        picker.delegate = self
        // picker.dataSource = self
        self.statusField.inputView = self.picker
        
       //quit textfield border
       statusField.borderStyle = .None
        
        
        //Customize add Button
        self.addNote.frame = CGRectMake(10, 10, 70, 30)
        addNote.layer.cornerRadius = 5
        
       // self.textView!.text = "something in code"

        
        self.setupKeyboardDismissal()

        self.textExpander = SMTEDelegateController()
       // self.searchBar!.delegate = self.textExpander
       // self.textField!.delegate = self.textExpander
        self.textView!.delegate = self.textExpander
        self.textExpander!.nextDelegate = self

        self.textExpander!.clientAppName = "TextExpanderDemoApp"
        self.textExpander!.fillCompletionScheme = "textexpanderdemoapp-fill-xc"
        self.textExpander!.fillDelegate = self
        self.textExpander!.appGroupIdentifier = "group.com.smileonmymac.textexpander.demoapp"; // !!! You must change this
    }
    ////Pickeeeer status
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return status.count
        } //else if pickerView.tag == 1 {
          //  return revisador.count
            
        //}
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if pickerView.tag == 0 {
            statusField.text = status[row]
        }
        //else if pickerView.tag == 1 {
           // checkerText.text = revisador[row]
       // }
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if pickerView.tag == 0 {
            return status[row]
        } //else if pickerView.tag == 1 {
          //  return revisador[row]
       // }
        
        return ""
    }
    ///End Picker


    @IBAction func AssignBtn(sender: AnyObject) {
        
        self.performSegueWithIdentifier("showpop", sender: self)

    }
    func identifierForTextArea(uiTextObject: AnyObject!) -> String? {
        if (self.textView! === uiTextObject) {
            return "myTextView";
        }
        /*if (self.textField! === uiTextObject) {
            return "myTextField";
        }
        if (self.searchBar! === uiTextObject) {
            //return "mySearchBar";
        }
         */
        return nil;
    }
    
    func prepareForFillSwitch(textIdentifier: String!) -> Bool {
        return true;
    }
 //expect the identified text object to become the first responder.
    func makeIdentifiedTextObjectFirstResponder(textIdentifier: String!, fillWasCanceled userCanceledFill: Bool, cursorPosition ioInsertionPointLocation: UnsafeMutablePointer<Int>) -> AnyObject! {
        self.snippetExpanded = true;
        if ("myTextView" == textIdentifier) {
            self.textView?.becomeFirstResponder()
            let theLoc = self.textView?.positionFromPosition((self.textView?.beginningOfDocument)!, offset: ioInsertionPointLocation.memory);
            if ((theLoc) != nil) {
                self.textView?.selectedTextRange = self.textView?.textRangeFromPosition(theLoc!, toPosition: theLoc!);
            }
            return self.textView;
        }
        /*
        if ("myTextField" == textIdentifier) {
            self.textField?.becomeFirstResponder();
            let theLoc = self.textView?.positionFromPosition((self.textView?.beginningOfDocument)!, offset: ioInsertionPointLocation.memory);
            if ((theLoc) != nil) {
                self.textField?.selectedTextRange = self.textField?.textRangeFromPosition(theLoc!, toPosition: theLoc!);
            }
            return self.textField
        }
        if ("mySearchBar" == textIdentifier) {
            self.searchBar?.becomeFirstResponder()
            // Note: UISearchBar does not support cursor positioning.
            // Since we don't save search bar text as part of our state, if our app was unloaded while TE was
            // presenting the fill-in window, the search bar might now be empty to we should return
            // insertionPointLocation of 0.
            let searchTextLen = ((self.searchBar?.text)! as NSString).length
            if (searchTextLen < ioInsertionPointLocation.memory) {
                ioInsertionPointLocation.memory = searchTextLen
            }
            return self.searchBar
        }
        */
        return nil;
    }
    func setupKeyboardDismissal() {
        let nc: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
        self.tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapAnywhere))
    }
    
    func keyboardWillShow(note: NSNotification) {
        self.view!.addGestureRecognizer(self.tapRecognizer!)
    }
    
    func keyboardWillHide(note: NSNotification) {
        self.view!.removeGestureRecognizer(self.tapRecognizer!)
    }
    
    func didTapAnywhere(recognizer: UITapGestureRecognizer) {
        recognizer.view!.endEditing(true)
    }
    override func viewDidAppear(animated: Bool) {

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// The following are the UITextViewDelegate methods; they simply write to the console log for demonstration purposes
    /*
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        print("nextDelegate textViewShouldBeginEditing")
        return true
    }
   */
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        print("nextDelegate textViewShouldEndEditing")
        
        if(textView.text == "")
        {
            textView.text = "Type Your text here..."
            
        }
        textView.resignFirstResponder()
        return true
    }
 
    
    //////placeholder text
    func textViewDidBeginEditing(textView: UITextView) {
        print("nextDelegate textViewDidBeginEditing")
        
        if(textView.text == "Type Your text here...")
        {
            textView.text = ""
            
        }
        
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        print("nextDelegate textViewDidEndEditing")
        
        
        if(textView.text == "")
        {
            textView.text = "Type Your text here..."
            
        }
        textView.resignFirstResponder()
    }
    
    func textView(aTextView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if self.textExpander!.isAttemptingToExpandText {
            self.snippetExpanded = true
        }
      //print("nextDelegate textView:shouldChangeTextInRange: \(NSStringFromRange(range)) originalText: \(aTextView.text) replacementText: \(text)")
        let text = textView?.text
        
        if  text == "" {
            textView?.resignFirstResponder()
            return false
            
        }
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        if self.snippetExpanded {
            self.snippetExpanded = false
        }
    

    }
    
    func textViewDidChangeSelection(textView: UITextView) {
        print("nextDelegate textViewDidChangeSelection")
    }
    
// The following are the UITextFieldDelegate methods; they simply write to the console log for demonstration purposes
    /*
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("nextDelegate textFieldShouldBeginEditing")
        return true
    }

    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("nextDelegate textFieldDidBeginEditing")
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("nextDelegate textFieldShouldEndEditing")
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("nextDelegate textFieldDidEndEditing")
    }
    
    func textField(aTextField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("nextDelegate textField:shouldChangeCharactersInRange: \(NSStringFromRange(range)) originalText: \(aTextField.text!) replacementText: \(string)")
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        print("nextDelegate textFieldShouldClear")
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("nextDelegate textFieldShouldReturn")
        return true
    }

// The following are the UISearchBarDelegate methods; they simply write to the console log for demonstration purposes

    func searchBarCancelButtonClicked(inSearchBar: UISearchBar) {
        print("searchBarCancelButtonClicked: \(inSearchBar)")
    }
 */

}



