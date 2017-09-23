//
//  MainViewController.swift
//  SafeNeck
//
//  Created by 박태준 on 2017. 9. 22..
//  Copyright © 2017년 stac2017. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var todayNoticeNum: UILabel!
    var weekNoticeNum: UILabel!
    
    var dailyButton: TermUIButton!
    var weeklyButton: TermUIButton!
    var monthlyButton: TermUIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main"
        print("I'm here : 2")
        // Do any additional setup after loading the view.
        
        setUI()
    }

    //UI생성
    func setUI(){
        setUISetting()
        setNavigationBarView()
        setNoticeNumView()
        setDateLabelView()
        setGenderButtonView()
        setSwipeType()
    }
    
    //기본 UI 세팅
    func setUISetting(){
        //배경색
        view.backgroundColor = UIColor.white

        //내비게이션 바 아래쪽 뷰 세팅
        let basicUI = UIView(frame: CGRect(x: 0, y: 64, width: view.frame.width, height: view.frame.height-64))
        basicUI.backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 242/255, alpha: 1)
        self.view.addSubview(basicUI)
    }
    
    //내비게이션 바 생성
    func setNavigationBarView(){
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 44))
        let navItem = UINavigationItem(title: "SafeNeck");
        navBar.setItems([navItem], animated: false);
        navBar.layer.shadowRadius = 2
        self.view.addSubview(navBar);
    }
    
    //상단 알림개수 뷰 생성
    func setNoticeNumView(){
        let todayNoticeUIView: NoticeUIView = NoticeUIView(frame: CGRect(x: 10, y: view.frame.height * 0.1 + 15, width: view.frame.width * 0.5 - 15, height: view.frame.height * 0.2 + 10), getTitle: "오늘 받은 알림 개수", getContent: "일간 알림 개수 목표치는 15회입니다.", getBackColor: UIColor.white, getTextColor: UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1))
        view.addSubview(todayNoticeUIView)
        
        let weekNoticeUIView: NoticeUIView = NoticeUIView(frame: CGRect(x: view.frame.width * 0.5 + 5, y: view.frame.height * 0.1 + 15, width: view.frame.width * 0.5 - 15, height: view.frame.height * 0.2 + 10), getTitle: "주간 받은 알림 개수", getContent: "주간 알림 개수 목표치는 45회입니다.", getBackColor: UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1), getTextColor: UIColor.white)
        view.addSubview(weekNoticeUIView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //중간 날짜 라벨 생성
    func setDateLabelView(){
        let dateLabel = DateUIView(frame: CGRect(x: 10, y: view.frame.height * 0.35 + 10, width: view.frame.width - 20, height: view.frame.height * 0.09))
        view.addSubview(dateLabel)
    }
    
    //기간 선택 버튼 생성
    func setGenderButtonView(){
        dailyButton = TermUIButton(frame: CGRect(x: 15, y: view.frame.height * 0.5, width: (view.frame.width * 0.3 - 15), height: view.frame.height * 0.1 - 30) , getText: "DAILY")
        dailyButton.addTarget(MainViewController(), action: #selector(dailyButtonClicked), for: .touchUpInside)
        dailyButton.isSelected = true
        dailyButton.backgroundColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        dailyButton.termLabel.textColor = UIColor.white
        view.addSubview(dailyButton)
        
        weeklyButton = TermUIButton(frame: CGRect(x: (view.frame.width * 0.35 + 7.5), y: view.frame.height * 0.5, width: (view.frame.width * 0.3 - 15), height: view.frame.height * 0.1 - 30) , getText: "WEEKLY")
        weeklyButton.addTarget(MainViewController(), action: #selector(weeklyButtonClicked), for: .touchUpInside)
        weeklyButton.isSelected = false
        weeklyButton.backgroundColor = UIColor.white
        weeklyButton.termLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        view.addSubview(weeklyButton)
        
        monthlyButton = TermUIButton(frame: CGRect(x: (view.frame.width * 0.7), y: view.frame.height * 0.5, width: (view.frame.width * 0.3 - 15), height: view.frame.height * 0.1 - 30) , getText: "MONTHLY")
        monthlyButton.addTarget(MainViewController(), action: #selector(monthlyButtonClicked), for: .touchUpInside)
        monthlyButton.isSelected = false
        monthlyButton.backgroundColor = UIColor.white
        monthlyButton.termLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        view.addSubview(monthlyButton)
    }
    
    //일간 선택 버튼 실행
    func dailyButtonClicked(){
        if(dailyButton.isSelected){
        }else{
            dailyButton.isSelected = true
            weeklyButton.isSelected = false
            monthlyButton.isSelected = false
            
            dailyButton.backgroundColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            dailyButton.termLabel.textColor = UIColor.white
            weeklyButton.backgroundColor = UIColor.white
            weeklyButton.termLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            monthlyButton.backgroundColor = UIColor.white
            monthlyButton.termLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        }
    }
    
    //주간 선택 버튼 실행
    func weeklyButtonClicked(){
        if(weeklyButton.isSelected){
        }else{
            dailyButton.isSelected = false
            weeklyButton.isSelected = true
            monthlyButton.isSelected = false
            
            dailyButton.backgroundColor = UIColor.white
            dailyButton.termLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            weeklyButton.backgroundColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            weeklyButton.termLabel.textColor = UIColor.white
            monthlyButton.backgroundColor = UIColor.white
            monthlyButton.termLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
        }
    }

    //월간 선택 버튼 실행
    func monthlyButtonClicked(){
        if(monthlyButton.isSelected){
        }else{
            dailyButton.isSelected = false
            weeklyButton.isSelected = false
            monthlyButton.isSelected = true
           
            dailyButton.backgroundColor = UIColor.white
            dailyButton.termLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            weeklyButton.backgroundColor = UIColor.white
            weeklyButton.termLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            monthlyButton.backgroundColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            monthlyButton.termLabel.textColor = UIColor.white
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //상단 알림 개수 뷰 클래스
    class NoticeUIView: UIView {
        var num: Int!
        var title: String!
        var content: String!
        var noticeNumLabel: UILabel!
        var textColor: UIColor!
        
        init(frame: CGRect, getTitle: String, getContent: String, getBackColor: UIColor, getTextColor: UIColor) {
            super.init(frame: frame)
            self.backgroundColor = getBackColor
            self.layer.borderWidth = 0
            self.layer.cornerRadius = 5
            self.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: 0, height: 5), radius: 5, scale: true)
            self.title = getTitle
            self.textColor = getTextColor
            self.content = getContent
            setLayOut()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setLayOut() {
            let titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: frame.width - 20, height: frame.height * 0.2))
            titleLabel.text = self.title
            titleLabel.textColor = textColor
            titleLabel.font = UIFont(name: "NanumBarunGothicOTFBold", size: 16)
            addSubview(titleLabel)
            print("titleLabel")
            
            let contentLabel = UILabel(frame: CGRect(x: 10, y: frame.height * 0.2 + 10, width: frame.width - 20, height: frame.height * 0.1))
            contentLabel.text = self.content
            contentLabel.textColor = UIColor(red: 126/255, green: 213/255, blue: 194/255, alpha: 1)
            contentLabel.font = UIFont(name: "NanumBarunGothicOTF", size: 10)
            addSubview(contentLabel)
            print("contentLabel")

            noticeNumLabel = UILabel(frame: CGRect(x: 10, y: frame.height * 0.3 + 10, width: frame.width - 20, height: frame.height * 0.7))
            noticeNumLabel.textColor = textColor
            noticeNumLabel.font = UIFont(name: "NanumBarunGothicOTFLight", size: 72)
            noticeNumLabel.text = "12"
            addSubview(noticeNumLabel)
            print("noticeNumLabel")

        }
    }
    
    //날짜 커스텀 뷰
    class DateUIView: UIView{
        
        override init(frame: CGRect){
            super.init(frame: frame)
            self.backgroundColor = UIColor.white
            self.layer.borderWidth = 0
            self.layer.cornerRadius = 5
            self.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: 0, height: 5), radius: 5, scale: true)
            setLayOut()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setLayOut(){
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd"
            let result = formatter.string(from: date)

            let leftClampLabel = UILabel(frame: CGRect(x: frame.width * 0.1, y: 0, width: frame.width * 0.8, height: frame.height))
            leftClampLabel.text = "<"
            leftClampLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            leftClampLabel.font = UIFont(name: "NanumBarunGothicOTFBold", size: 20)
            leftClampLabel.textAlignment = NSTextAlignment.left
            addSubview(leftClampLabel)
            
            let rightClampLabel = UILabel(frame: CGRect(x: frame.width * 0.1, y: 0, width: frame.width * 0.8, height: frame.height))
            rightClampLabel.text = ">"
            rightClampLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            rightClampLabel.font = UIFont(name: "NanumBarunGothicOTFBold", size: 20)
            rightClampLabel.textAlignment = NSTextAlignment.right
            addSubview(rightClampLabel)

            let dateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dateLabel.textColor = UIColor(red: 31/255, green: 183/255, blue: 149/255, alpha: 1)
            dateLabel.font = UIFont(name: "NanumBarunGothicOTFBold", size: 16)
            dateLabel.textAlignment = NSTextAlignment.center
            dateLabel.text = result
            addSubview(dateLabel)
        }
    }

    //일간,주간, 월간 버튼
    class TermUIButton: UIButton{
    
        var text : String!
        var termLabel : UILabel!
        
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
            termLabel = UILabel(frame: CGRect(x: frame.width * 0.5 - 40, y: frame.height * 0.5 - 10, width: 80,  height: 20))
            termLabel.text = text
            termLabel.font = UIFont(name: "NanumBarunGothicOTFBold", size: 12)
            termLabel.textAlignment = NSTextAlignment.center
            addSubview(termLabel)
        }
    }

    //스와이프 타입 세팅
    func setSwipeType(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    //스와이프 응답 받기
    func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.right:
                self.tabBarController?.selectedIndex = 0

            case UISwipeGestureRecognizerDirection.left:
                self.tabBarController?.selectedIndex = 2

            default:
                break
            }
        }
    }
}
