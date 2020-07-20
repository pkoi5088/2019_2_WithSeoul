# 2019_2_WithSeoul
본 프로젝트는 2019년도 2학기 웹프로그래밍에서 진행한 웹 프로젝트로 프로젝트명은 ‘withSeoul’이고 주제는 ‘사람들이 직접 참여할 수 있는 서울지도 만들기’이며 홈페이지를 이용하는 사람들의 정보입력을 토대로 서울 구석구석, 나만 알고있는 맛집 명소 등을 소개하는 웹페이지로 방향을 잡았다. 다음 사진은 완성된 프로젝트 결과로 홈페이지의 사이트맵을 그린 사진이다.
![111](https://user-images.githubusercontent.com/44914802/87287595-40d71f00-c535-11ea-9631-90d8dd26bdc8.png)
<br>
홈페이지의 전체적인 기능은 이용자들이 추천하고자 하는 장소, 명소들에 대한 위치나 정보들을 하나의 게시판에 글을 작성하면 다른 이용자들이 그것을 보고 서울여행을 계획하는 기능이다.

## 사용기술
여기서 담당한 역할을 웹페이지 백앤드와 서버 프로그래밍을 담당하였으며 사용한 기술은 다음과 같다.  
1.	JavaBeans & JSP  
2.	MySQL & JDBC  
3.	Naver Map API & JavaScript  
전반적으로 구현한 기능은 크게 회원가입, 로그인, 게시글 작성, 회원탈퇴 등 데이터베이스 관련 기능과 게시글작성, 열람과정에서 사용할 네이버 지도관련 API를 웹과 연동하는 기능을 구현하였다.  
전체 홈페이지 구조는 MVC모델을 바탕으로 설계하였고 모델1로 설계하였다.  

### 1. JavaBeans
Java의 일종의 Model을 담당하는 기술로 총 3개의 Model이 있다. 실제 로그인을 한 사용자의 정보를 가지고 있는 User.java, 데이터베이스 접근 객체인 Javabeans.java, 실제 위치를 숫자화 시켜주는 Location.java이다. Location.java는 JSP내의 연산으로 해도 되지만 JSP 구현을 쉽게 하기 위해 추가하였다.  
실제 데이터베이스 접근 객체는 Javabeans.java는 생성자에서 실제 서버와의 연동을 하고 쿼리연산, db 연결해제, user정보에 대한 check, 실제 로그인 및 회원가입 등 데이터베이스가 필요한 연산에 대해서 필요한 부분을 함수로 구현하였다.  

### 2. JSP
기본적인 View와 로그인, 로그아웃 등 세션에서 처리해야 하는 기술적 JSP와 실제 사용자가 볼 화면을 담당한다. Jsp의 개수는 총 18개 이며 그중 7개는 기능을, 10개는 화면을, 나머지 1개는 실행을 담당하는 jsp이다.  

+ Declare/Delete, Insert.jsp  
신고글을 담당하는 JSP 데이터베이스의 declare_tbl에 대한 삽입, 삭제 연산에 대한 기능을 가지고 있다.  
+ Login/Login.jsp  
로그인을 담당하는 Login.jsp이다. 현재 로그인 정보는 Session에 id를 저장함으로 로그인 상태를 유지하도록 하였다.  
+ Post/Delete, Insert.jsp  
게시글을 담당하는 JSP 데이터베이스의 post_tbl에 대한 삽입, 삭제 연산에 대한 기능을 가지고 있다. 게시글 하나가 가지고 있는 속성이 많기 때문에 입력되지 않은 정보에 대한 예외처리를 한번에 구현하였다.  
+ Register/Register.jsp  
회원가입을위한 JSP로 user_tbl에 대한 삽입 연산이 이뤄진다. 입력하지 않은 회원정보나 이미 존재한 아이디 같은 경우를 예외처리 해주었으며 조건을 다 만족한다면 user_tbl에 삽입하도록 구현하였다.  
+ Withdraw/Withdraw.jsp  
회원탈퇴에 대한 JSP로 Register.jsp는 user_tbl에 대한 삽입 연산이라면 Withdraw.jsp는 user_tbl에 대한 삭제 연산이다. 이미 id가 존재하기 때문에 바로 db모델만 있다면 삭제연산이 가능하다.  
+  View/  
해당 프로젝트는 MVC 모델1로 설계되었는데 JSP에서 View와 Controller를 담당한다. View/폴더는 View들을 모아놓은 플더로 각 화면에 대한 JSP들이 있다.  
### 3. MySQL & JDBC
본 프로젝트에서 사용한 DBMS는 MySQL이다. JavaBeans에서 연동을 하였다면 기능 jsp에서 사용할 데이터 검색, 연산, 갱신, 삭제와 같은 실제 데이터베이스에 대한 처리를 한다. 생성한 Table은 총 3개이다. User의 목록을 나타낼 user_tbl, 게시글에 대한 내용, 위치정보를 나타낼 post_tbl, 신고글에 대한 정보를 나타낼 declare_tbl이다.  
아쉽게도 해당 과목을 수강하고 있을 때는 데이터베이스에 대한 지식이 부족해 key설정하지 않았다. 하지만 회원가입할 때는 이미 존재하는 id인지 확인을 하였고, 게시글 고유 number에 대한 것은 각 row에서 가장 num이 큰 값 +1을 number로 설정했기 때문에 Unique하다고 할 수 있고 이는 곧, 각 테이블에 대한 key가 존재한다고 볼 수 있다.  

### 4. Naver Map API
장소들의 정확한 위치를 사용자들에게 제공하고자 프로젝트에 Naver에서 제공하는 Map API를 사용하였다.
글을 작성하는 경우에 지도를 이용해서 사용자는 보다 정확한 장소에 대한 정보를 입력할 수 있다. 해당 기술은 JavaScript를 통해서 구현하였으며, 네이버에서 제공하는 Class와 Interface를 사용하였다.  
글을 작성하는 과정에서 지도상에 클릭을 하면 해당 위치에 마커를 찍는 함수, 좌표를 반환하고 반환 받은 좌표로 실제 지번주소와 도로명 주소를 받아오는 함수를 구현에 이용하였다.  
## 실행화면  
### 메인화면  
![메인화면](https://user-images.githubusercontent.com/44914802/87934542-3a631d00-caca-11ea-827a-549ab52cb2bc.png)  
### 메인화면(로그인)  
![메인화면(로그인)](https://user-images.githubusercontent.com/44914802/87934546-3b944a00-caca-11ea-91fe-490a50ba1a8a.png)  
### 로그인  
![로그인](https://user-images.githubusercontent.com/44914802/87934554-418a2b00-caca-11ea-89ab-0493dc69c454.png)  
### 회원가입  
![회원가입](https://user-images.githubusercontent.com/44914802/87934564-45b64880-caca-11ea-8034-c295855342a7.png)  
### 홈페이지소개  
![홈페이지소개](https://user-images.githubusercontent.com/44914802/87934582-4c44c000-caca-11ea-8dc1-a6facc9bfca1.png)  
### 장소추천_최신순  
![추천_최신순](https://user-images.githubusercontent.com/44914802/87934596-51a20a80-caca-11ea-9981-743695dcc08c.png)  
### 장소추천_조회순  
![추천_조회순](https://user-images.githubusercontent.com/44914802/87934600-549cfb00-caca-11ea-9ac1-d6beed5a03ba.png)  
### 장소추천_연령대  
![추천_연령대](https://user-images.githubusercontent.com/44914802/87934606-5797eb80-caca-11ea-8fec-c2292b5565ca.png)  
### 테마로추천_관광지/유적지  
![테마_1](https://user-images.githubusercontent.com/44914802/87934615-5cf53600-caca-11ea-9b42-492445ff5357.png)  
### 테마로추천_랜드마크  
![테마_2](https://user-images.githubusercontent.com/44914802/87934616-5e266300-caca-11ea-86e7-9719ea303459.png)  
### 테마로추천_문화예술  
![테마_3](https://user-images.githubusercontent.com/44914802/87934618-5e266300-caca-11ea-82f4-093d43ff3021.png)  
### 테마로추천_스포츠  
![테마_4](https://user-images.githubusercontent.com/44914802/87934619-5ebef980-caca-11ea-9f52-61fbe9d1d992.png)  
### 지역별명소  
![지역별](https://user-images.githubusercontent.com/44914802/87934636-64b4da80-caca-11ea-9ba2-21e4a0a2aa55.png)  
### 축제안내  
![축제안내](https://user-images.githubusercontent.com/44914802/87934645-69798e80-caca-11ea-80aa-8e7282937e82.png)  
### 게시글작성  
![게시글작성](https://user-images.githubusercontent.com/44914802/87934657-6e3e4280-caca-11ea-945c-a5784881765e.png)  
### 내가쓴글  
![내가쓴글](https://user-images.githubusercontent.com/44914802/87934668-7302f680-caca-11ea-93f4-a984fbdb2e36.png)  
### 글보기  
![글보기](https://user-images.githubusercontent.com/44914802/87934671-74342380-caca-11ea-96dc-75f3f7d2a95b.png)
