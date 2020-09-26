Create Table QUIZ_Test
(
  Q_NUM int  primary key,
  Q_QUESTION varchar2(200) ,  -- 문제
  Q_EX1 varchar2(20) ,             --  보기
  Q_EX2 varchar2(20) ,             --  보기
  Q_EX3 varchar2(20) ,            --  보기
  Q_EX4 varchar2(20) ,            --  보기
  Q_ANSWER varchar2(20)      --  정답
 );

 SELECT * FROM QUIZ_Test 
 
 Insert  into QUIZ_Test(Q_NUM, Q_QUESTION,  Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(1, '1+1= 무엇인가  ?',  '1', '2', '3', '4', '2');

 Insert  into QUIZ_Test(Q_NUM, Q_QUESTION,  Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(2, '대한민국 수도는  ?',  '서울', '베이징', '부산', '인천', '서울');

 Insert  into QUIZ_Test(Q_NUM, Q_QUESTION,  Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(3, '1년을 몇 개월  ?',  '3', '6', '9', '12', '12');

 Insert  into QUIZ_Test(Q_NUM, Q_QUESTION,  Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(4, '가장 더운 계절은  ?',  '봄', '여름', '가을', '겨울', '여름');

 DELETE FROM QUIZ_Test WHERE Q_NUM=2;
 
 Create Table QUIZ
(
  Q_NUM int  primary key,
  Q_QUESTION varchar2(200) ,  -- 문제
  Q_TYPE varchar2(5) ,   
     -- TT (문제 T 보기 T ) , TI (문제 T 보기 I )  , IT (문제 I 보기 T )
  Q_IMAGE varchar2(50) , 
  Q_EX1 varchar2(100) ,   --  보기
  Q_EX2 varchar2(100) ,    --  보기
  Q_EX3 varchar2(100) ,   --  보기
  Q_EX4 varchar2(100) ,   --  보기
  Q_ANSWER varchar2(100)    --  정답
 );

  Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
  Values(1, '이 사람은 누구인가? <br> <img src="image/jws.jpg" height = "100" widht ="100">', 'IT', '정우성', '유승호', '유재석', '박나래', '정우성');
  
  Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
  Values(2, '이 음식은? <br> <img src="image/tteock.jpg" height = "100" widht ="100">', 'IT', '순대', '떡볶이', '초밥', '김밥', '떡볶이');

  
  Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
  Values(3, '어느 곳인가? <br> <img src="image/p1.jpg" height = "100" widht ="100">', 'IT', '에펠탑', '흥인지문', '서대문', '숭례문', '숭례문');
  
  Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
  Values(4, '무엇인가? <br> <img src="image/apple.jpg" height = "100" widht ="100">', 'IT', '사과', '바나나', '키위', '파인애플', '사과');
  
   Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
   Values(5, '다음 중 초밥은 ?', 'TI', 'sushi.jpg', 'apple.jpg', 'jws.jpg', 'p1.jpg', 'sushi.jpg');
   
   Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
   Values(6, '다음 중 사과는 ?', 'TI', 'whitetteock.jpg', 'apple.jpg', 'tteock.jpg', 'p1.jpg', 'apple.jpg');

   Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
   Values(7, '유승호는 ?', 'TI', 'sushi.jpg', 'ysh.jpg', 'jws.jpg', 'apple.jpg', 'ysh.jpg');
 
      Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
   Values(8, '음식이 아닌 것은 ?', 'TI', 'sushi.jpg', 'ysh.jpg', 'whitetteock.jpg', 'apple.jpg', 'ysh.jpg');
 
   
   Insert  into QUIZ(Q_NUM, Q_QUESTION,  Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(9, '1+1= 무엇인가  ?','TT',  '1', '2', '3', '4', '2');

 Insert  into QUIZ(Q_NUM, Q_QUESTION,Q_TYPE,  Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(10, '대한민국 수도는  ?', 'TT', '서울', '베이징', '부산', '인천', '서울');

 Insert  into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(11, '1년을 몇 개월  ?', 'TT', '3', '6', '9', '12', '12');

 Insert  into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(12, '가장 더운 계절은  ?', 'TT', '봄', '여름', '가을', '겨울', '여름');
 select * from QUIZ;
 
 
 Create Table SCORE
(
  S_NUM varchar2(100)  primary key,   --  학번
  S_NAME varchar2(100) ,                  --  이름
  S_GRADE varchar2(10) ,                  --  점수
  Q_INDATE   date default sysdate    -- 시험날짜
);

SELECT * FROM SCORE;

