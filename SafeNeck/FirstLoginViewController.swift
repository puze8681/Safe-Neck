//
//  FirstLoginViewController.swift
//  SafeNeck
//
//  Created by 박태준 on 2017. 9. 21..
//  Copyright © 2017년 stac2017. All rights reserved.
//

import UIKit
import Alamofire

class FirstLoginViewController: UIViewController{

    let initURL = "http://soylatte.kr:8080/auth/init"
    var femaleButton : genderUIButton!
    var maleButton : genderUIButton!
    
    var age: String!
    var gender: String!
    var position: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }
    
    //UI생성
    func setUI(){
        setUISetting()
        setNavigationBarView()
        setGenderButtonView()
        setTopLabelView()
        setStartButtonView()
        setInfoSelectLabel()
        
        
    }
    
    //기본 UI 세팅
    func setUISetting(){
        
        //배경 색
        view.backgroundColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        
        //내비게이션 바 아래쪽 뷰 세팅
        let basicUI = UIView(frame: CGRect(x: 0, y: 64, width: view.frame.width, height: view.frame.height-64))
        basicUI.backgroundColor = UIColor.white
        self.view.addSubview(basicUI)
    }
    
    //내비게이션 바 생성
    func setNavigationBarView(){
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 44))
        let navItem = UINavigationItem(title: "INIT ACCOUNT");
        navBar.setItems([navItem], animated: false);
        navBar.layer.shadowRadius = 2
        navBar.backgroundColor = UIColor.white
        self.view.addSubview(navBar);
    }
    
    //상단 텍스트 라벨 생성
    func setTopLabelView(){
        let textLabel1 = UILabel(frame: CGRect(x: 10, y: view.frame.height * 0.12, width: view.frame.width - 20, height: view.frame.height * 0.05))
        textLabel1.text = "Setting User Information"
        textLabel1.font = UIFont(name: "NanumBarunGothicOTFBold", size: 16)
        textLabel1.textColor = UIColor.darkGray
        view.addSubview(textLabel1)
        
        let textLabel2 = UILabel(frame: CGRect(x: 10, y: view.frame.height * 0.15, width: view.frame.width - 20, height: view.frame.height * 0.05))
        textLabel2.text = "Setting Interface For Better Service"
        textLabel2.font = UIFont(name: "NanumBarunGothicOTFLight", size: 12)
        textLabel2.textColor = UIColor.lightGray
        view.addSubview(textLabel2)
    }
    
    //성별 선택 버튼 생성
    func setGenderButtonView(){
        femaleButton = genderUIButton(frame: CGRect(x: 10, y: view.frame.height * 0.2 + 10, width: (view.frame.width * 0.5 - 15), height: view.frame.height * 0.1 - 20) , getText: "FEMALE")
        femaleButton.addTarget(FirstLoginViewController(), action: #selector(femaleButtonClicked), for: .touchUpInside)
        femaleButton.isSelected = true
        femaleButton.backgroundColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        femaleButton.genderLabel.textColor = UIColor.white
        view.addSubview(femaleButton)
        
        maleButton = genderUIButton(frame: CGRect(x: (view.frame.width * 0.5 + 5), y: view.frame.height * 0.2 + 10, width: (view.frame.width * 0.5 - 15), height: view.frame.height * 0.1 - 20) , getText: "MALE")
        maleButton.addTarget(FirstLoginViewController(), action: #selector(maleButtonClicked), for: .touchUpInside)
        maleButton.isSelected = false
        maleButton.backgroundColor = UIColor.white
        maleButton.genderLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        view.addSubview(maleButton)
    }
    
    //나이, 직군 선택 뷰 생성
    func setInfoSelectLabel(){
        let ageLabel = ageSelectUIView(frame: CGRect(x: 10, y: view.frame.height * 0.3 + 10, width: (view.frame.width * 0.5 - 15), height: view.frame.height * 0.6 - 30), getText: "AGE")
        view.addSubview(ageLabel)
        
        let positionLabel = positionSelectUIView(frame: CGRect(x: (view.frame.width * 0.5 + 5), y: view.frame.height * 0.3 + 10, width: (view.frame.width * 0.5 - 15), height: view.frame.height * 0.6 - 30), getText: "POSITION")
        view.addSubview(positionLabel)
    }
    
    //로그인 버튼 생성
    func setStartButtonView() {
        let startButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.9, width: view.frame.width, height: view.frame.height * 0.1))
        startButton.setTitle("start", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        startButton.titleLabel?.font = UIFont(name: "NanumBarunGothicOTFLight", size: 16)
        startButton.contentHorizontalAlignment = .center
        startButton.addTarget(FirstLoginViewController(), action: #selector(startButtonClicked), for: .touchUpInside)
        view.addSubview(startButton)
    }

    //여성 선택 버튼 실행
    func femaleButtonClicked(){
        if(femaleButton.isSelected){
        }else{
            femaleButton.isSelected = true
            maleButton.isSelected = false
            femaleButton.backgroundColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            femaleButton.genderLabel.textColor = UIColor.white
            maleButton.backgroundColor = UIColor.white
            maleButton.genderLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        }
    }
    
    //남성 선택 버튼 실행
    func maleButtonClicked(){
        if(maleButton.isSelected){
        }else{
            maleButton.isSelected = true
            femaleButton.isSelected = false
            maleButton.backgroundColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            maleButton.genderLabel.textColor = UIColor.white
            femaleButton.backgroundColor = UIColor.white
            femaleButton.genderLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        }
    }
    
    //시작 버튼 실행
    func startButtonClicked(){
        print("start")
    
        let myViewController = TabBarViewController()
        let navController = UINavigationController(rootViewController: myViewController)
        self.present(navController, animated:true, completion: nil)
        
        print("myViewController : ",myViewController)
        print("navController : ",navController)

//        if(idTextField.text == ""){
//            myAlert("Login FAIL", message: "enter your ID")
//        }else if(pwTextField.text == ""){
//            myAlert("Login FAIL", message: "enter your PASSWORD")
//        }else{
//            start(idTextField.text!, pwTextField.text!)
//        }
    }
    
    //Alert 실행
    func myAlert(_ title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //시작하기
    func start(_ id: String, _ pw: String){
        
        let myViewController = TabBarViewController()
        let navController = UINavigationController(rootViewController: myViewController)
        self.present(navController, animated:true, completion: nil)

        print("myViewController : ",myViewController)
        print("navController : ",navController)
//        let parameters = [
//            "id" : id,
//            "password" : pw,
//            ] as [String : Any]
        
//        Alamofire.request(loginURL, method: .post, parameters: parameters).responseJSON
//            {
//                response in
//                print(response)
//                let stringStatusCode = String(describing: response.response?.statusCode)
//                //printing response
//                if(response.response?.statusCode == 200){
//                    self.myAlert("Start SUCCESS", message: "WELCOME - SAFE NECK")
//                    self.navigationController?.popViewController(animated: true)
//                }else{
//                    print("STATUS CODE : " + stringStatusCode)
//                    self.myAlert("Start FAIL", message:"SERVER ERROR")
//                }
//        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //성별 선택을 위한 커스텀 UIButton
    class genderUIButton: UIButton {
        
        var text : String!
        var genderLabel : UILabel!
        
        init(frame: CGRect, getText: String) {
            super.init(frame: frame)
            self.backgroundColor = .white
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1).cgColor
            self.layer.cornerRadius = 5
            self.text = getText
            setLayOut()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setLayOut() {
            genderLabel = UILabel(frame: CGRect(x: frame.width * 0.5 - 40, y: frame.height * 0.5 - 10, width: 80,  height: 20))
            genderLabel.text = text
            genderLabel.font = UIFont(name: "NanumBarunGothicOTFBold", size: 12)
            genderLabel.textAlignment = NSTextAlignment.center
            addSubview(genderLabel)
        }
    }
    
    //나이 선택을 위한 커스텀 UIView
    class ageSelectUIView: UIView, UIPickerViewDelegate, UIPickerViewDataSource{
        
        var text: String!
        var label : UILabel!
        var subLable: UILabel!
        let ageStringValue: [String] = ["10대", "20대", "30대", "40대", "50대", "60대", "70 이상"]
        var pickerView: UIPickerView!
        
        func numberOfComponents(in pickerView: UIPickerView)->Int{
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)->String?{
            return ageStringValue[row]
        }
        
        func pickerView(_ pickerView: UIPickerView , numberOfRowsInComponent component: Int)->Int{
            return ageStringValue.count
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
            switch row {
            case 0...6:
                subLable.text = "Your AGE is " + ageStringValue[row]
                break
            default:
                subLable.text = "Choose your AGE"
                break
            }
        }

        init(frame: CGRect, getText: String){
            super.init(frame: frame)
            self.text = getText
            self.backgroundColor = .white
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1).cgColor
            self.layer.cornerRadius = 5
            self.pickerView = UIPickerView(frame: CGRect(x: 10, y: 50, width: frame.width - 20, height: frame.height - 60))
            pickerView.delegate = self
            pickerView.dataSource = self
            addSubview(self.pickerView)
            setLabelLayOut()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setLabelLayOut(){
            label = UILabel(frame: CGRect(x: 10, y: 5, width: frame.width - 20, height: 30))
            label.text = text
            label.font = UIFont(name: "NanumBarunGothicOTF", size: 16)
            label.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            label.textAlignment = NSTextAlignment.center
            addSubview(label)
            
            subLable = UILabel(frame: CGRect(x: 10, y: 45, width: frame.width - 20, height: 30))
            subLable.textColor = UIColor.darkGray
            subLable.font = UIFont(name: "NanumBarunGothicOTFLight", size: 10)
            subLable.textAlignment = NSTextAlignment.center
            addSubview(subLable)
        }
    }

    //포지션 선택을 위한 커스텀 UIView
    class positionSelectUIView: UIView, UIPickerViewDelegate, UIPickerViewDataSource{
        
        var text: String!
        var label : UILabel!
        var subLable: UILabel!
        let positionStringValue: [String] = ["(초,중,고) 학생", "대학생", "직장인", "일반인"]
        var pickerView: UIPickerView!
        
        func numberOfComponents(in pickerView: UIPickerView)->Int{
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)->String?{
            return positionStringValue[row]
        }
        
        func pickerView(_ pickerView: UIPickerView , numberOfRowsInComponent component: Int)->Int{
            return positionStringValue.count
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
            switch row {
            case 0...4:
                subLable.text = "Your POSITION is " + positionStringValue[row]
                break
            default:
                subLable.text = "Choose your POSITION"
            }
        }

        init(frame: CGRect, getText: String){
            super.init(frame: frame)
            self.text = getText
            self.backgroundColor = .white
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1).cgColor
            self.layer.cornerRadius = 5
            self.pickerView = UIPickerView(frame: CGRect(x: 10, y: 50, width: frame.width - 20, height: frame.height - 60))
            pickerView.delegate = self
            pickerView.dataSource = self
            addSubview(self.pickerView)
            setLabelLayOut()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setLabelLayOut(){
            label = UILabel(frame: CGRect(x: 10, y: 5, width: frame.width - 20, height: 30))
            label.text = text
            label.font = UIFont(name: "NanumBarunGothicOTF", size: 16)
            label.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            label.textAlignment = NSTextAlignment.center
            addSubview(label)
            
            subLable = UILabel(frame: CGRect(x: 10, y: 45, width: frame.width - 20, height: 30))
            subLable.textColor = UIColor.darkGray
            subLable.font = UIFont(name: "NanumBarunGothicOTFLight", size: 10)
            subLable.textAlignment = NSTextAlignment.center
            addSubview(subLable)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if((self.navigationController?.viewControllers.count)! > 1)
        {
            self.navigationController?.viewControllers.removeFirst()
        }
    }
}
