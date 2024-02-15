<p align="center">
 <img src = "https://github.com/http-kjs/SecondProject/assets/124488773/dfd1ab7f-8389-4276-9ce4-d4f7e9422407">
</p>

['제주 속으로' 포트폴리오 바로가기](https://www.notion.so/ecf4fc9b31914a57a8cfd691ddd9f522)  
## 📚목차  
  
1. [소개](#소개)
2. [개발 목표](#개발-목표)
3. [모델링 ERD & 플로우차트](#모델링-erd--플로우차트)
4. [담당 역할](#담당-역할)
5. [개별 소스](#개별-소스)

---  
### 👋소개  
<p align="center">
 <img src = "https://github.com/http-kjs/SecondProject/assets/124488773/cdecd10a-bef5-40eb-8c84-5957b193aaac" height="400px", width="1200px">
</p>  

**개발 인원 :** *<span style = "color:gray">5명</span>*  
**개발 기간 :** *<span style = "color:gray">2023 / 06 / 30 ~ 2023 / 07 / 21</span>*  
<br>
**제주는 대한민국에서 가장 인기 있는 관광지입니다. 제주 여행을 준비하는 여행객에게 여러가지 배너와 복잡한 인터페이스를 제외하여 편의성을 증가시키고, 여행 준비에 필요한 정보를 제공하는 웹 구현 프로젝트 입니다.**  
<br>
**상세 설명 :** ['제주에오길' 포트폴리오로 이동](https://ten-pond-80a.notion.site/ecf4fc9b31914a57a8cfd691ddd9f522?pvs=4)

---  
### 📃모델링 ERD & 플로우차트
<details>
  <summary>모델링 ERD 보기</summary>
  <img src = "https://github.com/http-kjs/SecondProject/assets/124488773/b087ff25-2745-4380-80df-bb12034f820f">
</details>  
<details>
  <summary>플로우차트 보기</summary>
  <img src = "https://github.com/http-kjs/SecondProject/assets/124488773/6715f77e-0f6a-45d5-9db9-ac5d3960e23d">
</details>  

---  
### 🧑담당 역할
<details>
  <summary>요구사항 분석</summary>
  <img src = "https://github.com/http-kjs/SecondProject/assets/124488773/3295bfcc-38ab-4adc-8d64-ac69f663bb93"><br>
 <img src = "https://github.com/http-kjs/SecondProject/assets/124488773/9c0808c7-ebc3-4608-8227-87c4734ed8e9"><br>
 <img src = "https://github.com/http-kjs/SecondProject/assets/124488773/f77bd3cf-a6d1-4e53-93b9-ce8f925703d9">
</details>
  
1. **회원가입, 로그인, 아이디/비밀번호 찾기** 
2. **카테고리별 여행 검색** 
3. **여행 코스 추천** 
4. **자유게시판 CRUD**
5. **마이페이지**
6. **데이터 스크래핑**

---  
### 👨‍💻개별 소스  
  
<details>
 <summary>VO</summary>
 <ul>
  <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/vo/MemberVO.java">MemberVO</a> : 회원 관련</li>
  <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/vo/TravelVO.java">TravelVO</a> : 여행 검색 페이지 관련</li>
  <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/vo/CourseCategoryVO.java">CourseCategory</a> : 여행 코스 상세 페이지 관련</li>
  <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/vo/CourseDetailVO.java">CourseDetialVO</a> : 여행 코스 카테고리 관련</li>
  <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/vo/CourseJJimVO.java">CourseJJimVO</a> : 여행 코스 찜/추천 관련</li>
  <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/vo/FreeboardVO.java">FreeboardVO</a> : 자유게시판 관련</li>
  <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/vo/FreeBoardReplyVO.java">FreeboardReplyVO</a> : 자유게시판 댓글/대댓글 관련</li>
  
 </ul>
</details>
<details>
 <summary>DAO</summary>
 <ul>
  <li><a href ="https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/dao/MemberDAO.java">MemberDAO</a> : 회원 관련(회원가입, 로그인, 아이디/비밀번호 찾기,마이페이지)</li>
  <li><a href ="https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/dao/TravelDAO.java">TravelDAO</a>: 여행 검색 관련</li>
 <li><a href ="https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/dao/CourseDAO.java">CourseDAO</a>: 여행 코스 추천 관련</li>
 <li><a href ="https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/dao/CourseJJimRecommendDAO.java">CourseJJimRecommendDAO</a>: 추천 여행 코스 찜/추천 관련</li>
 <li><a href ="https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/dao/FreeBoardDAO.java">FreeBoardDAO</a>: 자유게시판CRUD 관련</li>
 <li><a href ="https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/dao/FreeBoardReplyDAO.java">FreeBoardReplyDAO</a>: 자유게시판 댓글/대댓글 관련</li>
 <li><a href ="https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/dao/MypageDAO.java">MypageDAO</a>: 마이페이지 관련</li>
 
 </ul>
</details>
<details>
 <summary>Model</summary>
 <ul>
 <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/model/MemberModel.java">MemberModel</a> : 회원가입, 로그인, 아이디/비밀번호 찾기</li>
 <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/model/TravelModel.java">TravelModel</a> : 여행 검색, 상세</li>
 <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/model/CourseModel.java">CourseModel</a> : 여행 코스 추천 페이지</li>
 <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/model/CourseJJimRecommendModel.java">CourseJJimRecommendModel</a> : 여행 코스 찜/추천</li>
 <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/model/FreeBoardModel.java">FreeBoardModel</a> : 자유게시판 CRUD</li> 
  <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/model/FreeBoardReplyModel.java">FreeBoardReplyModel</a> : 자유게시판 댓글/대댓글</li> 
  <li><a href = "https://github.com/http-kjs/FirstProject/blob/master/FirstProject/src/main/java/com/sist/model/MyPageModel.java">MyPageModel</a> : 마이페이지</li> 
  
 </ul>
</details>
<details>
 <summary>View</summary>
 <ul>
  <li><a href = "https://github.com/http-kjs/FirstProject/tree/master/FirstProject/src/main/webapp/member">member</a></li>
  <li><a href = "https://github.com/http-kjs/FirstProject/tree/master/FirstProject/src/main/webapp/travel">travel</a></li>
  <li><a href = "https://github.com/http-kjs/FirstProject/tree/master/FirstProject/src/main/webapp/freeboard">freeboard</a></li>
  <li><a href = "https://github.com/http-kjs/FirstProject/tree/master/FirstProject/src/main/webapp/mypage">mypage</a></li>
 </ul>
</details>
