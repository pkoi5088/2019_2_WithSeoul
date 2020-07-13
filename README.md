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
Java의 일종의 Model을 담당하는 기술로 총 3개의 Model이 있다. 실제 로그인을 한 사용자의 정보를 가지고 있는 User.java, 데이터베이스를 하나의 모델화 시킨 Javabeans.java, 실제 위치를 숫자화 시켜주는 Location.java이다. 실제 JSP내에서는 useBean을 User.java에만 사용하였는데 useBean을 데이터베이스에 사용하게 되면 여러 개의 연결이 발생해 비효율적이기 때문이다.  

### 2. JSP
기본적인 View와 로그인, 로그아웃 등 세션에서 처리해야 하는 기술적 페이지를 담당한다. Jsp의 개수는 총 18개 이며 그중 7개는 기능을, 10개는 화면을, 나머지 1개는 실행을 담당하는 jsp이다. 실제 연산은 javascript를 이용하여 프로그래밍하였지만 경고창과 같은 기능도 사용하기위해 html기능도 사용하였다.  

### 3. MySQL & JDBC
본 프로젝트에서 사용한 DBMS는 MySQL이다. JavaBeans에서 연동을 하였다면 기능 jsp에서 사용할 데이터 검색, 연산, 갱신, 삭제와 같은 실제 데이터베이스에 대한 처리를 한다.  
생성한 Table은 총 3개이다. User의 목록을 나타낼 user_tbl, 게시글에 대한 내용, 위치정보를 나타낼 post_tbl, 신고글에 대한 정보를 나타낼 declare_tbl이다. 다음사진들은 위에서부터 user_tbl, post_tbl, declare_tbl의 정보들이다.  
<b>
A. user_tbl  
![user](https://user-images.githubusercontent.com/44914802/87287848-8f84b900-c535-11ea-80d3-562cee3aae9c.png)
<br>
B. post_tbl  
![post](https://user-images.githubusercontent.com/44914802/87287853-914e7c80-c535-11ea-9545-23f34ef481f1.png)
<br>
C. declare_tbl  
![declare](https://user-images.githubusercontent.com/44914802/87287857-93184000-c535-11ea-97d5-26bd35ac277a.png)
<br></b>

### 4. Naver Map API
장소들의 정확한 위치를 사용자들에게 제공하고자 프로젝트에 Naver에서 제공하는 Map API를 사용하였다.
글을 작성하는 경우에 지도를 이용해서 사용자는 보다 정확한 장소에 대한 정보를 입력할 수 있다. 해당 기술은 JavaScript를 통해서 구현하였으며, 네이버에서 제공하는 Class와 Interface를 사용하였다.  
글을 작성하는 과정에서 지도상에 클릭을 하면 해당 위치에 마커를 찍는 함수, 좌표를 반환하고 반환 받은 좌표로 실제 지번주소와 도로명 주소를 받아오는 함수를 구현에 이용하였다.
