//
//  ViewController.swift
//  iOSAppIntro
//
//  Created by t2023-m0026 on 12/11/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let exampleDatas = ["Option 1", "Option 2", "Option 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setUILabel()
        // 아래 setUILabel 메서드를 호출
        
        setUIScrollView()
        setUIImageView()
        setUITextField()
        setUIButton()
        setUISwitch()
        setUISlider()
        setUISegmentedControl()
        setUIPickerView()
        setUITableView()
        setUICollectionView()
    }
    
    //setUIlabel()이라는 메서드로 UILabel을 불러오고, 내용, 폰트, 사이즈, 색상, 정렬, 노출열(줄), 말줄임을 설정함.
    func setUILabel() {
        let textLabel = UILabel()                            // setUILabel이라는 메서드는
        textLabel.text = "안녕하세요, UILabel 예제를 입력합니다."    // 표시할 문자열을 나타냄
        textLabel.font = UIFont.systemFont(ofSize: 18)       // 텍스트의 폰트와 사이즈를 설정
        textLabel.textColor = UIColor.green                  // 텍스트의 색상을 설정
        textLabel.textAlignment = .center                    // Label 내에서 텍스트의 정렬을 설정
        textLabel.numberOfLines = 2                          // 노출되는 텍스트의 열을 설정.(0 = 자동 줄바꿈)
        textLabel.lineBreakMode = .byTruncatingTail          // 텍스트가 UILabel보다 클 때, 줄 바꿈 처리 방법을 설정
        
        // 코드로 직접 선언했기 때문에 .frame에서 CGRect로 위치, 크기를 선언하고
        // self.view.addSubview(textaLabel)로 ViewController가 위치한 전체 view에 textLabel을 보여줌
        textLabel.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(textLabel)
    }
    
    func setUIImageView() {
        let imageView = UIImageView()
        let checkMarkAsset = UIImage(named: "CheckMark")             // CheckMark라는 에셋(이미지)을 checkMarkAsset이라는 인스턴스로 생성.
        
        imageView.image = checkMarkAsset                            // 생성한 인스턴스로 imageView에 들어갈 image를 초기화
        imageView.contentMode = .scaleAspectFit
        /*
         contentMode 예시
         scaleToFill : 이미지가 원래 비율을 무시하고, 이미지 뷰의 경계에 맞춰 이미지를 확장
         scaleAspectFit : 이미지의 가로세로 비율을 유지하면서 이미지뷰 내에서 가능한 많은 면적을 차지하도록 확장. 이미지 잘리지 않음.
         scaleAspectFill : 이미지의 가로세로 비율을 유지하면서 이미지뷰를 완전히 채우도록 확장. 이미지가 잘릴 수 있음.
         reddraw : 이미지 뷰의 경계가 변경될 때마다 이미지 뷰를 다시 그립니다.
         center, top, bottom, left, right, topRight, topLeft, bottomRight, bottomLeft : 이미지뷰 안에 해당하는 위치에 이미지를 원본크기로 위치시킨다. 원본크기가 이미지뷰보다 클 경우, 이미지가 잘릴 수 있음.
         */
        
        imageView.frame = CGRect(x: 150, y: 300, width: 100, height: 100)
        self.view.addSubview(imageView)
    }
    
    func setUITextField() {
        let textField = UITextField()
        
        textField.placeholder = "할 일을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = false
        textField.returnKeyType = .done
        
        textField.frame = CGRect(x: 50, y: 400, width: 300, height: 100)
        self.view.addSubview(textField)
    }
    
    func setUIButton() {
        let click = UIButton(type: .system)
        
        click.setTitle("버튼", for: .normal)
        click.backgroundColor = UIColor.blue
        click.setTitleColor(UIColor.white, for: .normal)
        click.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)         // #selector는 클래스 외부에서 액션로직(메소드)을 참조한다.
        
        click.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        self.view.addSubview(click)
    }
    @objc func buttonTapped() {                                                                 // 버튼으로 동작할 액션은 클래스 외부에서 선언
        print("버튼이 눌렸다!")
    }
    
    func setUISwitch() {
        let onAndOff = UISwitch()
        
        onAndOff.isOn = true                            // 초기상태는 true = On, false = Off
        onAndOff.onTintColor = UIColor.green            // 스위치의 배경 색상 설정
        onAndOff.thumbTintColor = UIColor.white         // 스위치의 색상 설정
        onAndOff.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged) //#selector로 클래스 외부에서 액션로직(메소드) 참조.
        
        onAndOff.frame = CGRect(x: 150, y: 400, width: 100, height: 100)
        self.view.addSubview(onAndOff)
    }
    @objc func switchValueChanged(_ sender: UISwitch) {                                     // 켜져있을 때, 꺼져있을 때 각각을 프린트하는 액션
        if sender.isOn {
            print("Switch is On")
        } else {
            print("Switch if Off")
        }
    }
    
    func setUISlider() {
        let slider = UISlider()
        slider.value = 50                                   // 슬라이드의 초기값
        slider.minimumValue = 0                             // 슬라이드가 가질 수 있는 최소값
        slider.maximumValue = 100                           // 슬라이드가 가질 수 있는 최대값
        slider.minimumTrackTintColor = UIColor.red          // 버튼보다 작은 쪽의 슬라이드 색상
        slider.maximumTrackTintColor = UIColor.blue         // 버튼보다 큰 쪽의 슬라이드 색상
        slider.thumbTintColor = UIColor.white               // 슬라이드 버튼의 색상
        
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        
        slider.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(slider)
    }
    @objc func sliderValueChanged(_ sender: UISlider) {
        print("Slider value : \(sender.value)")
    }
    
    func setUISegmentedControl() {
        let myUISegment = UISegmentedControl(items: exampleDatas)
        myUISegment.selectedSegmentIndex = 0
        myUISegment.tintColor = UIColor.blue
        myUISegment.isMomentary = false                                         // 선택을 일시적으로 설정할 것인지를 선택. true = 일시적, false = 영구적
        
        myUISegment.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        
        myUISegment.frame = CGRect(x: 150, y: 400, width: 100, height: 100)
        self.view.addSubview(myUISegment)
    }
    @objc func segmentValueChanged(_ sender: UISegmentedControl) {
        print("Selected Segment index : \(sender.selectedSegmentIndex)")
    }
    
    
    
    func setUIScrollView() {
        let myUIScrollView = UIScrollView(frame: view.bounds)
        myUIScrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)     // 스크롤 영역의 크기. 이 값이 UIScrollView의 프레임 크기보다 크면 스크롤이 가능하다????
        //myUIScrollView.contentOffset                                                                  // 스크롤 뷰의 현재 스크롤 위치를 설정
        //myUIScrollView.contentInset                                                                   // 스크롤 뷰의 컨텐츠와 뷰 사이의 여백을 설정
        myUIScrollView.isScrollEnabled = true                                                           // 스크롤 기능을 활성화(true) 또는 비활성화(false)
        myUIScrollView.isPagingEnabled = false                                                          // 페이지 기능을 활성화(true) 또는 비활성화(false)
        myUIScrollView.bounces = true                                                                   // 컨텐츠 경계에서의 바운스 효과를 활성화(true) 또는 비활성화(false)
        
        let labelInScrollView = UILabel(frame: CGRect(x: 0, y: view.frame.height - 50, width: view.frame.width, height: 100))
        labelInScrollView.text = "Hello, UIScrollView!"
        labelInScrollView.textAlignment = .center
        myUIScrollView.addSubview(labelInScrollView)
        
        self.view.addSubview(myUIScrollView)
    }
    
    
    
    func setUIPickerView() {
        let myPickerView = UIPickerView()
        myPickerView.delegate = self
        myPickerView.dataSource = self
        myPickerView.center = self.view.center
        
        self.view.addSubview(myPickerView)
    }
    func numberOfComponents(in myPickerView: UIPickerView) -> Int {           // 선택지를 몇 가지로 부여할 것인가를 말함. 숫자만큼 선택할 수 있는 행이 늘어남.
        return 1
    }
    func pickerView(_ myPickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {             // 몇 개의 행이 들어가있는지를 입력.
        return exampleDatas.count
    }
    func pickerView(_ myPickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {     // 각 선택지의 이름을 부여.
        return exampleDatas[row]
    }
    func pickerView(_ myPickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {                   // 선택되었을 때의 동작.
        print("Selected : \(exampleDatas[row])")
    }
    
    
    
    
    
    func setUITableView() {                                                                             // 테이블(표)을 이용해 선택지를 얻는 UI
        let myTableView = UITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.frame = self.view.bounds
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.view.addSubview(myTableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {               // 몇 개의 선택지를 가질 수 있는가를 설정.
        return exampleDatas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {    // 각 셀에 어떤 것을 넣을 것인지를 설ㅈ
        let selectedCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        selectedCell.textLabel?.text = exampleDatas[indexPath.row]
        return selectedCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {                     // 셀을 선택했을 때의 동작 설정
        print("Selected : \(exampleDatas[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)                                            // 셀을 선택했다가 떼었을 때의 애니메이션 설정
    }
    
    
    
    func setUICollectionView() {                                                                    // 사진첩 형태(그리드 레이아웃)의 선택지를 제공하는 UI
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = self.view.bounds
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        self.view.addSubview(collectionView)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exampleDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected : \(exampleDatas[indexPath.row])")
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath : IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

