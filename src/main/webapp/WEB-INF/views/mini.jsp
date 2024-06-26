<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="css/minihome/font.css" />
    <link rel="stylesheet" href="css/minihome/layout.css" />
    <link rel="stylesheet" href="css/minihome/home.css" />
    
    <%
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   String currentDate = sdf.format(new Date());

   Cookie[] cookies = request.getCookies();
   String savedDate = null;
   int dailyVisitCount = 0;

   if (cookies != null) {
      for (Cookie cookie : cookies) {
         if ("visitDate".equals(cookie.getName())) {
            savedDate = cookie.getValue();
         }
         if ("dailyVisitCount".equals(cookie.getName())) {
            dailyVisitCount = Integer.parseInt(cookie.getValue());
         }
      }
   }

   if (!currentDate.equals(savedDate)) {
      dailyVisitCount = 1;
   } else {
      dailyVisitCount++;
   }
   
   Cookie dateCookie = new Cookie("visitDate", currentDate);
   dateCookie.setMaxAge(24 * 60 * 60);
   response.addCookie(dateCookie);

   Cookie countCookie = new Cookie("dailyVisitCount", String.valueOf(dailyVisitCount));
   countCookie.setMaxAge(24 * 60 * 60);
   response.addCookie(countCookie);

   String path = application.getRealPath("/") + "totalVisitCount.txt";
   int totalVisitCount = 0;
   File file = new File(path);

   if (file.exists()) {
      try (BufferedReader br = new BufferedReader(new FileReader(file))) {
         totalVisitCount = Integer.parseInt(br.readLine());
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
        
   try (BufferedWriter bw = new BufferedWriter(new FileWriter(file))) {
      if (!currentDate.equals(savedDate)) {
      totalVisitCount++;
      }
         bw.write(String.valueOf(totalVisitCount));
      } catch (Exception e) {
         e.printStackTrace();
      }
   %>
</head>
<body>
   <div class="mainhome">
      <div class="dot">
        <div class="page">
          <div class="profile-container">
            <div class="profile-title">
              TODAY &nbsp;<span class="color-red"> <%= dailyVisitCount %> </span> &nbsp; | TOTAL <%= totalVisitCount %>
            </div>
            <div class="box profile-box">
              <div class="profile-image">
                <img class="profile-image-img" src="images/minihome/x.jpg" alt="프로필" />
              </div>
              <div class="profile-text font-kyobohand">
               ㅎb들ズl 않ㅇr… つㅓ친 정글øłl 뛰øł든 건 ㄴrLI까..
              </div>
              
              <!-- 날씨 및 시간 프레임 -->
              <div>
                <h5>현재 날씨</h5>
                <div id="weather"></div>
                <h5>현재 시간</h5>
                <div id="time"></div>
              </div>

              <div class="profile-username font-kyobohand">
                <span style="color: #0f1b5c"> 일조짱 </span> (♪♬)
              </div>
              <div class="profile-dropdown">
                <div class="dropdown-button">
                  <div class="dropdown-title"> 파도타기 </div>
                  <div class="triangle-down"></div>
                </div>
                <div class="dropdown-content">
                  <a href="https://www.youtube.com" target="_blank"> 유튜브 바로가기 </a>
                  <a href="https://www.facebook.com" target="_blank"> 페이스북 바로가기 </a>
                  <a href="https://www.instagram.com" target="_blank"> 인스타그램 바로가기 </a>
                </div>
              </div>
            </div>
          </div>
          <div class="content-container">
            <div class="header content-title">
              <div class="content-title-name"> ♂우zl으lАŁㄹБ포러l버♀★ </div>
              <div class="content-title-url"> https://url주소/나중에입력 </div>
            </div>
            <div class="box content-box">
              <div class="box-title"> Updated News </div>
              <div class="news-flex-box">
                <div class="news-box">
                  <div class="news-row">
                    <div class="news-category category-pic"> 사진첩 </div>
                    <div class="news-title"> 일상...♥ </div>
                  </div>
                  <div class="news-row">
                    <div class="news-category category-post"> 게시판 </div>
                    <div class="news-title"> 프로젝트 T.T </div>
                  </div>
                  <div class="news-row">
                    <div class="news-category category-post"> 게시판 </div>
                    <div class="news-title"> 이게 맞나... =_= </div>
                  </div>
                  <div class="news-row">
                    <div class="news-category category-pic"> 사진첩 </div>
                    <div class="news-title"> 조 모임 ^0^ </div>
                  </div>
                </div>
                <div class="update-box">
                  <div class="menu-row">
                    <div class="menu-item"> 게시판 <span class="menu-num"> 0/25 </span></div>
                    <div class="menu-item"> 사진첩 <span class="menu-num"> 0/25 </span></div>
                  </div>
                  
                  <!-- BGM -->
            <div class="small-frames-contatiner">
               <div class="small-frame">
                  <div class="small-frame-title"> 🎧 BGM PLAYER 🎧 </div>
                  <audio id="audioPlayer" controls style="width: 250px; height: 30px;">
                     <source src="bgm/test.mp3" type="audio/mp3">
                     <source src="bgm/test2.mp3" type="audio/mp3">
                     <source src="bgm/test3.mp3" type="audio/mp3">
                     현재 브라우저가 노래재생기능을 지원하지 않습니다.
                     </audio>
                  <div class="play">
                     <button onclick="playSong('bgm/test.mp3')">⏪</button>
                     <button onclick="playSong('bgm/test2.mp3')">⏯️</button>
                     <button onclick="playSong('bgm/test3.mp3')">⏩</button>
                  </div>
               </div>
            </div>
                </div>
              </div>
             
              <div class="miniroom">
                <div class="box-title"> Miniroom </div>
                <div class="miniroom-gif-box">
                   <!-- 사진 출처 : https://lrl.kr/gyqJ -->
                  <img src="images/minihome/y.png" alt="미니룸" />
                </div>
              </div>
            </div>
          </div>
          <div class="menu-container">
            <div class="menu-button">
              <a href="gomini.do"><button> 홈 </button></a>
              <a href="goGallery.do"><button> 사진첩 </button></a>
              <a href="goBoard.do"><button> 게시판 </button></a>
            </div>
          </div>
        </div>
      </div>


    <script>
        function fetchWeather() {
            fetch('http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=인증키&numOfRows=10&pageNo=1')
                .then(response => response.json())
                .then(data => {
                    document.getElementById('weather').textContent = JSON.stringify(data, null, 4);
                })
                .catch(error => console.error('Error fetching weather data:', error));
        }

        function fetchTime() {
            const now = new Date();
            const timeString = now.toLocaleTimeString();
            document.getElementById('time').textContent = timeString;
        }
        
        function playSong(song) {
            const audioPlayer = document.getElementById('audioPlayer');
            audioPlayer.src = song;
            audioPlayer.play();
          }

        setInterval(fetchTime, 1000); // 1초마다 시간 업데이트
        fetchWeather(); // 페이지 로드 시 날씨 데이터 가져오기
    </script>
</body>
</html>
