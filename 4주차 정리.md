## 🍎 iOS 4주차 공부 📚



- struct란?
  - 여러 변수를 담을 수 있는 컨테이너
  - 데이터를 용도에 맞게 묶어 표현하고자 할 때 용이
  - 프로퍼티와 메서드를 사용하여 구조화된 데이터와 기능을 가짐
  - 하나의 새로운 사용자정의 데이터 타입을 만들어주는 것
  - 초기화를 정의하여 초기 상태를 설정할 수 있음
  - 확장 가능
  - 프로토콜 사용이 가능
  - subscript 사용이 가능



- struct 와 class의 차이?
  - 구조체는 값(value) 타입, 클래스는 참조 타입
    - 참조타입 : 값 타입과 달리 값이 복사되는 것이 아닌 <u>메모리를 참조</u>
  - 구조체는 상속할 수 없다.
  - 타입캐스팅은 클래스의 인스턴스에만 허용됨 (상위 또는 하위 클래스 타입으로 형변환 가능)
  - 디이녈라이저는 클래스의 인스턴스에만 활용가능
  - 참조 횟수 계산은 클랫의 인스턴스에만 적용



- #### ⭐️⭐️로그인 과정!!⭐️⭐️

  1. APIContants.swift

  ```swift
  struct APIConstants {
      static let baseURL = "http://13.209.144.115:3333"
      static let signinURL = APIConstants.baseURL + "/user/signin"
      static let signupURL = APIConstants.baseURL + "/user/signup"
  }
  ```

  ​	// 변하지 않는 API의 값을 모아둔 구조체

  ​	먼저 baseURL이 되는 http://13.209.144.115:3333을 baseURL이라는 상수에 저장해준다.

  ​	그리고 로그인을 할 때 접속되는 URL인 <u>signinURL</u>은 기존 베이스 URL인 " http://13.209.144.115:3333" 	(APIConstants.baseURL)에 "/user/signin"을 더한 값이다. 

  ​	회원가입을 할 때 접속되는 URL인 signupURL도 마찬가지의 방법.

  

  2. // 서버에서 JSON형식으로 넘어온 로그인 데이터를 swift형식으로 바꿔주는 decoding 단계.

     👉🏻 Object는 키 값이 존재하거나 존재하지 않을 수 있기 때문에 특정 키가 없이 데이터가 내려올 수 있다. 

     그렇다면 이전에 잘 내려오던 데이터의 특정 키가 갑자기 안내려온다면 Codable을 썼을 때 무슨 문제가 생길까? 

      ⭐️ **KeyNotFound에러**가 발생한다.⭐️

  ```swift
  struct SigninData: Codable {
      var status: Int
      var success: Bool
      var message: String
      var data: TokenData?
      
      enum CodingKeys:String, CodingKey {
          case status = "status" 
          case success = "success"
          case message = "message"
          case data = "data"
      }
      
  
      
      init(from decoder: Decoder) throws {
          let values = try decoder.container(keyedBy: CodingKeys.self)
          status = (try? values.decode(Int.self, forKey: .status)) ?? -1
          success = (try? values.decode(Bool.self, forKey: .success)) ?? false
          message = (try? values.decode(String.self, forKey: .message)) ?? ""
          data = (try? values.decode(TokenData.self, forKey: .data)) ?? nil
      }
  }
  
  struct TokenData: Codable {
      var jwt:String
  }
  ```

     (JSONData가 바뀔 경우를 대비) 이런 문제가 발생하는 것을 방지하고자 JSON을 직접 decoding해서 문제를 해결한다.

    	1️⃣ JSON을 decoding할 때 init(from decoder:Decoder)을 호출하여 해당 부분에 직접 코드를 작성해준		다.

  ​        👉🏻 KeyNotFound에러는 init함수에 기본 값을 넣어주는 방식으로 해결 가능

  ​	  2️⃣ JSON에 특정 키가 없는 경우는 항상 빈 문자열(Int의 경우에는 -1, Bool의 경우에는 false, data의 경우	에 는 nil)을 넣어주도록 코드 수정 ==> 에러 발생 x

  

  ​	❗️**CodingKey는 왜 사용하는 건가요??**

   	 📚 JSON의 키 이름이나 타입을 다르게 하고 싶을 때 CodingKey를 정의해줘야 한다!!

  ​      (의문점)

  ​      => 우리 코드에서 이름은 변경되지 않았는데, 왜 case status = "status" 를 해줘야 하나요??

  ​      => 그냥 case status 로 놔둬도 되는 것 아닌가용......????😭😭😭

  

  ​	//decodable의 init(from:)은 NSCoding의 init(coder:)와 거의 비슷하다. 다만 Decoder프로토콜은 다음의 차이를 갖는다.

  ​	Decoder에서 키는 미리 정의된 코딩키만 사용가능하다. 즉, 디코더로부터 데이터를 바로 추출하지 못하고 코딩키에 의존하는 컨테이너를 생성해야 한다. 컨테이너는 연결된 디코더의 내부 메모리 뷰의 각 영역을 키를 통해서 액세스할 수 있게 해주는 장치이다. 컨테이너로부터 특정한 키의 값을 얻는 메소드는 decode(_:forKey:)인데, 얻어야 할 값의 타입을 먼저 전달해야 하고, 키에는 CodingKey 프로토콜의 enum타입값을 전달한다. 이와 같은 구조를 염두에 두면 init(from:)의 구현이 쉽게 이해될 것이다.

  

  3. NetworkResult.swift

     //서버 통신에 따른 결과를 case별로 나눠 저장함

     ```swift
     enum NetworkResult<T> {
         case success(T) //성공 -> value를 가진 success
         case requestErr(T) //요청 에러 -> value를 가진 requestErr
         case pathErr //경로 에러
         case serverErr //서버 내부 에러
         case networkFail //네트워크 연결 실패
     }
     ```

     

  4. LoginService.swift

     👉🏻👉🏻 Alamofire 라이브러리를 이용하여 실제로 로그인 과정의 데이터 통신을 시작하는 단계이다.

     ##### Alamofire란? 스위프트 기반 HTTP 네트워킹 라이브러리!!!!

     ```
     
     ```

     *** Closure는 익명함수로 알려진 기능으로, 함수를 func키워드로 선언하는 것이 아니라, 함수를 변수에 선언하는 형태를 취하고 있다. => Closure는 코드를 간결하고, 직관적으로 작성하는 데 많은 도움을 준다.

     - Closure Expression Syntax

     ```swift
     {(parameters) -> return type in
           statements
     }
     ```

     

     클로저가 함수로부터 Escape한다는 것은 해당 함수의 인자로 클로저가 전달되지만, 함수가 반환된 후 실행되는 것을 의미한다. 함수의 인자가 함수의 영역을 탈출하여 함수 밖에서 사용할 수 있는 개념은 기존에 우리가 알고 있던 변수의 scope개념을 무시한다. 왜냐면 함수에서 선언된 로컬 변수가 로컬 변수의 영역을 뛰어넘어 함수 밖에서도 유효하기 때문이다.

     

     일반 로컬 변수(주로 값들: `Int`, `String` 등등)가 함수 밖에서 살아있는 것은 전역 변수를 함수에 가져와서 값을 새로 주는 것과 크게 다르지 않아 보인다. 그래서 이와 같은 `Escape` 개념이 크게 의미가 없어 보인다. 하지만, 클로저의 `Escaping`은 `A 함수가 마무리된 상태에서만 B 함수가 실행되도록` 함수를 작성할 수 있다는 점에서 유용하다.

     함수의 실행 순서를 보장 받을 수 있는 것은 상당히 중요한 기능이다. 왜냐하면, 이 순서 보장은 비동기 함수의 경우도 포함하기 때문이다. 서버에서 Json 형식의 데이터를 가져와 화면에 이를 보여주는 앱을 생각해보자. 이 때 HTTP 통신을 위해 `Alamofire` 라이브러리를 사용한다. `Alamofire` 라이브러리는 이 같은 경우 흔히 아래와 같은 형태로 사용된다.

     ```swift
     let dataRequest = Alamofire.request(APIConstants.signinURL, method: .post, parameters: makeParameter(id, pwd), encoding: JSONEncoding.default, headers: header)
     ```

     `Alamofire.request(urlRequest)` 메소드는 서버로 `Request`를 전송한다. 여기서는 post 방식으로 Json 형식의 데이터를 받아온다. 그리고 그 결과는 `Response` 객체를 통해 받을 수 있다. 일반적으로 서버에 `Request`를 전송하고 그 `Response` 받아오는 함수들은 비동기로 작동하여 `Request`를 보낸 직후 반환 되어버리는데, 어떻게 이 같은 `Response`가 `Request` 결과를 기다리게 하는 형태로 함수를 작성할 수 있는 것일까? 답은 `Escaping Closure`에 있다. `login` 함수의 파라미터를 간단히 들여다보면 다음과 같이 되어 있다.

     

     ```swift
     func login(id:String, pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
             let header: HTTPHeaders = ["Content-Type": "application/json"] //Request Header 생성
             let dataRequest = Alamofire.request(APIConstants.signinURL, method: .post, parameters: makeParameter(id, pwd), encoding: JSONEncoding.default, headers: header)
             
             //데이터 통신 시작 -> 서버로 Request 전송
             // escaping closure로 인해 dataResponse in 부분은 서버로부터 데이터가 들어온 다음 실행된다!!
             dataRequest.responseData { dataResponse in
                 switch dataResponse.result {
                   //기본적으로 ResultType은 success와 failure 두가지의 인자를 갖고 있다.
                   //*표준라이브러리의 Result Type!!!*
                 case .success:
                     guard let statusCode = dataResponse.response?.statusCode else {return}
                     guard let value = dataResponse.result.value else {return}
                     let networkResult = self.judge(by: statusCode,value)
                     completion(networkResult)
                 case .failure:completion(.networkFail)
                 }
             }
         }
     ```

     

     눈여겨 볼 부분은 `completion` 이다. 이 `completion`는 `Escaping Closure` 형태로 작성되어 있다. 

     즉, `completion`는 `login` 함수가 반환되고(완전히 서버로부터 값을 가져 온 상태에서) 실행된다. 

     그 부분이 바로 `trailing closure` 형태로 작성되어 있는 `{ dataResponse in }` 부분이다.

     

  5. 로그인부 구현

     ```swift
     @IBAction func login(_ sender: UIButton) {
             guard let inputID = emailTextField.text else {return}
             guard let inputPWD = passwordTextField.text else {return}
             
             LoginService.shared.login(id: inputID, pwd: inputPWD) {
                 networkResult in
                 switch networkResult{
                 case .success(let token):
                     guard let token = token as? String else {return}
                     UserDefaults.standard.set(token, forKey: "token")
                     guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "customTabbarController") as? UITabBarController else {return}
                     tabbarController.modalPresentationStyle = .fullScreen
                     self.present(tabbarController, animated: true, completion: nil)
                 case .requestErr(let message):
                     guard let message = message as? String else {return}
                     let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                     let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                     alertViewController.addAction(action)
                     self.present(alertViewController, animated: true, completion: nil)
                 case .pathErr: print("path")
                 case .serverErr: print("serverErr")
                 case .networkFail: print("networkfail")
                     
                 }
             }
             
         }
     ```

     

  





