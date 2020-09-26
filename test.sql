Create Table QUIZ_Test
(
  Q_NUM int  primary key,
  Q_QUESTION varchar2(200) ,  -- ����
  Q_EX1 varchar2(20) ,             --  ����
  Q_EX2 varchar2(20) ,             --  ����
  Q_EX3 varchar2(20) ,            --  ����
  Q_EX4 varchar2(20) ,            --  ����
  Q_ANSWER varchar2(20)      --  ����
 );

 SELECT * FROM QUIZ_Test 
 
 Insert  into QUIZ_Test(Q_NUM, Q_QUESTION,  Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(1, '1+1= �����ΰ�  ?',  '1', '2', '3', '4', '2');

 Insert  into QUIZ_Test(Q_NUM, Q_QUESTION,  Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(2, '���ѹα� ������  ?',  '����', '����¡', '�λ�', '��õ', '����');

 Insert  into QUIZ_Test(Q_NUM, Q_QUESTION,  Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(3, '1���� �� ����  ?',  '3', '6', '9', '12', '12');

 Insert  into QUIZ_Test(Q_NUM, Q_QUESTION,  Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(4, '���� ���� ������  ?',  '��', '����', '����', '�ܿ�', '����');

 DELETE FROM QUIZ_Test WHERE Q_NUM=2;
 
 Create Table QUIZ
(
  Q_NUM int  primary key,
  Q_QUESTION varchar2(200) ,  -- ����
  Q_TYPE varchar2(5) ,   
     -- TT (���� T ���� T ) , TI (���� T ���� I )  , IT (���� I ���� T )
  Q_IMAGE varchar2(50) , 
  Q_EX1 varchar2(100) ,   --  ����
  Q_EX2 varchar2(100) ,    --  ����
  Q_EX3 varchar2(100) ,   --  ����
  Q_EX4 varchar2(100) ,   --  ����
  Q_ANSWER varchar2(100)    --  ����
 );

  Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
  Values(1, '�� ����� �����ΰ�? <br> <img src="image/jws.jpg" height = "100" widht ="100">', 'IT', '���켺', '����ȣ', '���缮', '�ڳ���', '���켺');
  
  Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
  Values(2, '�� ������? <br> <img src="image/tteock.jpg" height = "100" widht ="100">', 'IT', '����', '������', '�ʹ�', '���', '������');

  
  Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
  Values(3, '��� ���ΰ�? <br> <img src="image/p1.jpg" height = "100" widht ="100">', 'IT', '����ž', '��������', '���빮', '���ʹ�', '���ʹ�');
  
  Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
  Values(4, '�����ΰ�? <br> <img src="image/apple.jpg" height = "100" widht ="100">', 'IT', '���', '�ٳ���', 'Ű��', '���ξ���', '���');
  
   Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
   Values(5, '���� �� �ʹ��� ?', 'TI', 'sushi.jpg', 'apple.jpg', 'jws.jpg', 'p1.jpg', 'sushi.jpg');
   
   Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
   Values(6, '���� �� ����� ?', 'TI', 'whitetteock.jpg', 'apple.jpg', 'tteock.jpg', 'p1.jpg', 'apple.jpg');

   Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
   Values(7, '����ȣ�� ?', 'TI', 'sushi.jpg', 'ysh.jpg', 'jws.jpg', 'apple.jpg', 'ysh.jpg');
 
      Insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) 
   Values(8, '������ �ƴ� ���� ?', 'TI', 'sushi.jpg', 'ysh.jpg', 'whitetteock.jpg', 'apple.jpg', 'ysh.jpg');
 
   
   Insert  into QUIZ(Q_NUM, Q_QUESTION,  Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(9, '1+1= �����ΰ�  ?','TT',  '1', '2', '3', '4', '2');

 Insert  into QUIZ(Q_NUM, Q_QUESTION,Q_TYPE,  Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(10, '���ѹα� ������  ?', 'TT', '����', '����¡', '�λ�', '��õ', '����');

 Insert  into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(11, '1���� �� ����  ?', 'TT', '3', '6', '9', '12', '12');

 Insert  into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(12, '���� ���� ������  ?', 'TT', '��', '����', '����', '�ܿ�', '����');
 select * from QUIZ;
 
 
 Create Table SCORE
(
  S_NUM varchar2(100)  primary key,   --  �й�
  S_NAME varchar2(100) ,                  --  �̸�
  S_GRADE varchar2(10) ,                  --  ����
  Q_INDATE   date default sysdate    -- ���賯¥
);

SELECT * FROM SCORE;

