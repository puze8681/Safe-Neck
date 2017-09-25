//
//  DailyReportViewController.swift
//  SafeNeck
//
//  Created by 박태준 on 2017. 9. 23..
//  Copyright © 2017년 stac2017. All rights reserved.
//

import UIKit

class DailyReportViewController: UIViewController {

    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Daily Report"
        
        print("I'm here : 1")
        // Do any additional setup after loading the view.
        setUI()
    }

    //UI생성
    func setUI(){
        setUISetting()
        setScrollView()
        setNavigationBarView()
        setCommentView()
        setConditionView()
        setReportNoticeLabel()
        setChartView()
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
    
    //스크롤뷰 세팅
    func setScrollView(){
        let screensize : CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight * 1.2 + 20)
        view.addSubview(scrollView)
    }
    //내비게이션 바 생성
    func setNavigationBarView(){
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 44))
        let navItem = UINavigationItem(title: "SafeNeck");
        navBar.setItems([navItem], animated: false);
        navBar.layer.shadowRadius = 2
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 247/255, green: 246/255, blue: 242/255, alpha: 1)]
        scrollView.addSubview(navBar);
    }
    
    //상태 변화 뷰 생성
    func setConditionView(){
        let conditionUIView : CondituonUIView = CondituonUIView(frame: CGRect(x: 10, y: view.frame.height * 0.1 + 15, width: view.frame.width - 20, height: view.frame.height * 0.35 - 25), 1, 3, 2)
        scrollView.addSubview(conditionUIView)
    }
    //코멘트 라벨 생성
    func setCommentView(){
        let commentView = CommentUIView(frame: CGRect(x: 10, y: view.frame.height * 0.45 + 10, width: view.frame.width - 20, height: view.frame.height * 0.15), "자세가 매우 좋습니다. 흠잡을 곳이 없군요.")
        scrollView.addSubview(commentView)
    }
    
    //리포트 알림 라벨 생성
    func setReportNoticeLabel(){
        let titleLabel = UILabel(frame: CGRect(x: 10, y: view.frame.height * 0.6 + 25, width: view.frame.width - 20, height: view.frame.height * 0.05 - 10))
        titleLabel.text = "사용자의 상태 리포트"
        titleLabel.textColor = .green
        titleLabel.font = UIFont(name: "NanumBarunGothicOTFBold", size: 16)
        scrollView.addSubview(titleLabel)

        let contentLabel = UILabel(frame: CGRect(x: 10, y: view.frame.height * 0.65 + 10, width: view.frame.width - 20, height: view.frame.height * 0.05))
        contentLabel.text = "사용자의 사용 시간 상태 비율입니다."
        contentLabel.textColor = UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1)
        contentLabel.font = UIFont(name: "NanumBarunGothicOTF", size: 12)
        scrollView.addSubview(contentLabel)
    }
    
    func setChartView(){
        let chartView = ChartUIView(frame: CGRect(x: 10, y: view.frame.height * 0.7 + 15, width: view.frame.width - 20, height: view.frame.height * 0.4))
        scrollView.addSubview(chartView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //상태 변화 뷰 클래스
    class CondituonUIView: UIView {
        
        var typeOne : Int!
        var typeTwo : Int!
        var typeThree : Int!
        
        init(frame: CGRect, _ typeOne: Int?, _ typeTwo: Int?, _ typeThree: Int?) {
            super.init(frame: frame)
            self.backgroundColor = .white
            self.typeOne = typeOne
            self.typeTwo = typeTwo
            self.typeThree = typeThree
            self.layer.borderWidth = 0
            self.layer.cornerRadius = 5
            self.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: 0, height: 5), radius: 5, scale: true)
            setLayOut()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setLayOut() {
            
            let labelBackGroundView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.3))
            labelBackGroundView.backgroundColor = UIColor(red: 30/255, green: 181/255, blue: 148/255, alpha: 1)
            
            let path = UIBezierPath(roundedRect:labelBackGroundView.bounds, byRoundingCorners:[.topRight, .topLeft], cornerRadii: CGSize(width: 5, height:  5))
            
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            labelBackGroundView.layer.mask = maskLayer
            
            addSubview(labelBackGroundView)
            
            let titleLabel = UILabel(frame: CGRect(x: 10, y: 2, width: frame.width - 20, height: frame.height * 0.2))
            titleLabel.text = "사용자의 상태 변화"
            titleLabel.textColor = .white
            titleLabel.font = UIFont(name: "NanumBarunGothicOTFBold", size: 16)
            addSubview(titleLabel)
            
            let contentLabel = UILabel(frame: CGRect(x: 10, y: frame.height * 0.1 + 12, width: frame.width - 20, height: frame.height * 0.1))
            contentLabel.text = "3일간의 상태 변화입니다"
            contentLabel.textColor = UIColor(red: 170/255, green: 226/255, blue: 213/255, alpha: 1)
            contentLabel.font = UIFont(name: "NanumBarunGothicOTF", size: 12)
            addSubview(contentLabel)
            
            let yesterYesterDayConditionView = ConditionNodeUIView(frame: CGRect(x: -10, y: frame.height * 0.2 + 15, width: frame.height * 0.72, height: frame.height * 0.8 - 15), typeOne, 0)
            addSubview(yesterYesterDayConditionView)
            
            let yesterDayConditionView = ConditionNodeUIView(frame: CGRect(x: frame.width * 0.5 - frame.height * 0.36, y: frame.height * 0.2 + 15, width: frame.height * 0.72, height: frame.height * 0.8 - 15), typeTwo, 1)
            addSubview(yesterDayConditionView)
            
            let toDayConditionView = ConditionNodeUIView(frame: CGRect(x: frame.width - frame.height * 0.72 + 10, y: frame.height * 0.2 + 15, width: frame.height * 0.72, height: frame.height * 0.8 - 15), typeThree, 2)
            addSubview(toDayConditionView)
            
            let leftShiftX = frame.width * 0.5 - frame.height * 0.36
            let leftShiftY = frame.height * 0.6 - 40
            
            let leftShiftImage = UIImageView(frame: CGRect(x: leftShiftX, y: leftShiftY, width: 10, height: 10))
            leftShiftImage.image = UIImage(named: "ic_daily_next")
            leftShiftImage.contentMode = .scaleAspectFit
            addSubview(leftShiftImage)
            
            let rightShiftX = frame.width - frame.height * 0.72 - 10
            let rightShiftY = frame.height * 0.6 - 40
            
            let rightShiftImage = UIImageView(frame: CGRect(x: rightShiftX, y: rightShiftY, width: 10, height: 10))
            rightShiftImage.image = UIImage(named: "ic_daily_next")
            rightShiftImage.contentMode = .scaleAspectFit
            addSubview(rightShiftImage)
        }
    }
    
    //상태 변화 뷰 클래스에 들어가는 하루 상태 뷰
    class ConditionNodeUIView : UIView{
        
        var type: Int!
        var day: Int!
        var images : [String] = ["ic_daily_sogood", "ic_daily_good", "ic_daily_standard","ic_daily_bad","ic_daily_sobad"]
        var title: [String] = ["정상", "주의", "경고", "나쁨", "매우 나쁨"]
        var subTitle: [String] = ["2일 전 상태", "1일 전 상태", "현재 상태"]
        var textColor: [UIColor] = [UIColor.soGood, UIColor.good, UIColor.standard, UIColor.bad, UIColor.soBad]
        
        init(frame: CGRect, _ type: Int, _ day: Int){
            super.init(frame: frame)
            self.type = type
            self.day = day
            setLayOut()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setLayOut(){
            let conditionImageView = UIImageView(frame:CGRect(x: frame.height * 0.2, y: frame.height * 0.15, width: frame.height * 0.6, height: frame.height * 0.35))
            conditionImageView.contentMode = .scaleAspectFit
            
            let titleLabel = UILabel(frame: CGRect(x: frame.height * 0.2, y: frame.height * 0.55, width: frame.height * 0.6, height: frame.height * 0.25))
            titleLabel.font = UIFont(name: "NanumBarunGothicOTFBold", size: 20)
            titleLabel.textAlignment = NSTextAlignment.center

            let subTitleLabel = UILabel(frame: CGRect(x: frame.height * 0.2, y: frame.height * 0.75, width: frame.height * 0.6, height: frame.height * 0.1))
            subTitleLabel.font = UIFont(name: "NanumBarunGothicOTF", size: 12)
            subTitleLabel.textColor = UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1)
            subTitleLabel.textAlignment = NSTextAlignment.center

            for i in 0...4 {
                if(type == i){
                    conditionImageView.image = UIImage(named: images[i])
                    titleLabel.text = title[i]
                    titleLabel.textColor = textColor[i]
                }
            }
            
            for i in 0...2 {
                if(day == i){
                    subTitleLabel.text = subTitle[i]
                }
            }
            
            addSubview(conditionImageView)
            addSubview(titleLabel)
            addSubview(subTitleLabel)
        }
    }
    
    //커멘트 커스텀 뷰
    class CommentUIView: UIView{
        
        var comment: String!
        
        init(frame: CGRect, _ comment: String){
            super.init(frame: frame)
            self.comment = comment
            self.backgroundColor = UIColor.green
            self.layer.borderWidth = 0
            self.layer.cornerRadius = 5
            self.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: 0, height: 5), radius: 5, scale: true)
            setLayOut()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setLayOut(){
            
            let commentImage = UIImageView(frame: CGRect(x: frame.height * 0.2, y: frame.height * 0.25, width: frame.height * 0.5, height: frame.height * 0.5))
            commentImage.image = UIImage(named: "ic_daily_comment")
            commentImage.contentMode = .scaleAspectFill
            addSubview(commentImage)
            
            let titleCommentLable = UILabel(frame: CGRect(x: frame.height * 0.9, y: frame.height * 0.2, width: frame.width - (frame.height * 1.6), height: frame.height * 0.2))
            titleCommentLable.text = "사용자님의 상태 변화에 대한 코멘트"
            titleCommentLable.textColor = UIColor(red: 17/255, green: 103/255, blue: 84/255, alpha: 1)
            titleCommentLable.font = UIFont(name: "NanumBarunGothicOTF", size: 12)
            titleCommentLable.textAlignment = NSTextAlignment.left
            addSubview(titleCommentLable)
            
            let subTitleCommentLable = UILabel(frame: CGRect(x: frame.height * 0.9, y: frame.height * 0.4, width: frame.width - (frame.height * 1.6), height: frame.height * 0.2))
            subTitleCommentLable.text = comment
            subTitleCommentLable.textColor = UIColor.white
            subTitleCommentLable.font = UIFont(name: "NanumBarunGothicOTFBold", size: 16)
            subTitleCommentLable.textAlignment = NSTextAlignment.left
            addSubview(subTitleCommentLable)
        }
    }
    
    //차트 뷰
    class ChartUIView: UIView{
        
    override init(frame: CGRect){
            super.init(frame: frame)
            self.backgroundColor = .white
            self.layer.borderWidth = 0
            self.layer.cornerRadius = 5
            self.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: 0, height: 5), radius: 5, scale: true)
            setLayOut()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setLayOut(){
            
        }
    }
    
    
    func setSwipeType(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(DailyReportViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(DailyReportViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.right:
                self.tabBarController?.selectedIndex = 2
                
            case UISwipeGestureRecognizerDirection.left:
                self.tabBarController?.selectedIndex = 1

            default:
                break
            }
        }
    }


}
