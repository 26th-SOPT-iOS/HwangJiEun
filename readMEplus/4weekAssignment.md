## 🍎 4주차 도전과제!

<br>

#### 1️⃣ 회원가입 후 로그인 뷰로 이동했다가 바로 탭바로 이동하는 도전과제 

```swift
SignupService.shared.signup(id: joinInputID, pwd: joinInputPWD, name: joinInputName, email: joinInputEmail, phone: joinInputPhone) {
            networkResult in
            switch networkResult{
            case .success:
                //회원가입 절차가 성공했을 때 로그인 서비스를 불러옴 -> 불러올 때 id는 회원가입 시 사용했던 id, password도 회원가입 시 사용했던 password! 
                LoginService.shared.login(id: joinInputID, pwd: joinInputPWD) {
                networkResults in
                switch networkResults{
                    //토큰을 받아옴
                case .success(let token):
                    guard let token = token as? String else {return}
                    UserDefaults.standard.set(token, forKey: "token")
                    
                    //회원가입뷰와 로그인뷰간의 데이터 전달과정
                    guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? ViewController else {return}
                    //로그인뷰의 아이디필드를 회원가입 아이디로
                    receiveViewController.id = joinInputID
                    //로그인뷰의 패스워드필드를 회원가입 패스워드로
                    receiveViewController.password = joinInputPWD
                    
                    //로그인뷰로 가는과정
                    self.navigationController?.show(receiveViewController, sender: self)
                    
                    //로그인이 성공했으니 탭바로 이동!
                    guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "customTabbarController") as? UITabBarController else {return}
                    tabbarController.modalPresentationStyle = .fullScreen
                    self.present(tabbarController, animated: true, completion: nil)
  
       
```

1. 회원가입 절차가 성공했을 때 로그인 서비스를 불러온다 
2. 로그인 서비스를 불러올 때 id는 회원가입 시 사용했던 id, password도 회원가입 시 사용했던 password!
   - 이렇게 함으로써 회원가입 시 사용했던 id와 pw를 이용하여 로그인을 할 수 있다.
3. 그 다음 토큰을 받아온다! 
4. 그 후 회원가입 뷰에서 로그인 뷰로 데이터를 전달한다. (로그인뷰의 아이디필드를 회원가입뷰의 아이디로, 로그인뷰의 패스워드필드를 회원가입뷰의 패스워드로)
5. 로그인뷰로 이동
6. 탭바로 이동!



#### 👉🏻👉🏻 뷰가 나타날 때 마다 setData로 뷰를 갱신해주었다!

```swift
  override func viewWillAppear(_ animated: Bool) {
    setData()
    }
```

setData()함수를 만들어서 JoinViewController(회원가입 뷰컨)으로부터 전달받은 데이터를 셋팅해주었다.

viewWillApper는 뷰가 나타날 때마다 처리되는 함수이므로 이후 viewWillAppear함수에서 setData를 호출해주었다.

<br>

<image src="./images/4weekAssignmentVideo.gif" width="414px" height="814px"> </image>





<<<<<<< HEAD


<br>

<br>
=======
<video style="max-height:100%; max-width:100%;">

<video src="./images/4weekAssignmentVideo.mov" width="300" height="700"/>
>>>>>>> 91e94cb860c5dcd48a8f1de87de8f1d3f11a70c0

