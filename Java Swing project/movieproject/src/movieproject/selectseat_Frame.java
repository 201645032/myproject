package movieproject;

import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
/*
 영화 번호 1.걸캅스  2.기생충 3.악인전 4.어벤져스 
 이 화면에서는 전에 있던 화면에서 넘어올 때 두자리 숫자를 같이 받아온다. 그 두자리 숫자의 의미는 다음과 같다.
 11 = 토요일 오전에 상영하는 걸캅스  12 = 토요일 오후에 상영하는 걸캅스
 13 = 일요일 오전에 상영하는 걸캅스  14 = 일요일 오후에 상영하는 걸캅스
 
 21 = 토요일 오전에 상영하는 기생충  22 = 토요일 오후에 상영하는 기생충
 23 = 일요일 오전에 상영하는 기생충  24 = 일요일 오후에 상영하는 기생충
 
 31 = 토요일 오전에 상영하는 악인전  32 = 토요일 오후에 상영하는 악인전
 33 = 일요일 오전에 상영하는 악인전  34 = 일요일 오후에 상영하는 악인전
 
 41 = 토요일 오전에 상영하는 어벤져스  42 = 토요일 오후에 상영하는 어벤져스
 43 = 일요일 오전에 상영하는 어벤져스  44 = 일요일 오후에 상영하는 어벤져스
 
 이 화면에서는 넘어오는 숫자들을 이용해 좌석 선택을 표현한다. 만약 21가 넘어왔다고 치자 21은 토요일 오전에 상영하는 기생충이다.
 이 영화의 좌석은 25/30이므로 좌석 5개를 선택 불가로 만들어주어야 한다. 그 과정들은 아래 함수 설명에서 하겠다. 
 */


public class selectseat_Frame extends JFrame implements ActionListener, ItemListener{
	DB_Conn dc = new DB_Conn(); // DB 호출
	int seatnum;
	ImageIcon icon = new ImageIcon("img/seat.jpg");
	ImageIcon seat = new ImageIcon("img/seat.png");
	ImageIcon r_seat = new ImageIcon("img/seat_on.png");
	ImageIcon d_seat = new ImageIcon("img/seat_dead.png");
	ImageIcon back = new ImageIcon("img/back2.png");
	ImageIcon back_on = new ImageIcon("img/back2_on.png");
	ImageIcon pay = new ImageIcon("img/pay.png");
	ImageIcon pay_on = new ImageIcon("img/pay_on.png");
	JCheckBox[] btnseat = new JCheckBox[30];
	JButton btnback;
	JButton btnpay;
	String userid;
	String seatnumbertext ="";
	String seatstring = ""; //DB에 들어갈 스트링 변수
	String[] seattext = new String[30]; //좌석의 값을 넣어줄 변수
	String[] r_seattext = new String[30]; //좌석의 값을 넣어줄 변수
	int[] seatcheck = new int[30];
	int custid;
	ResultSet rs;
	private String sql;
	private String updatesql;
	
	// 위에꺼 : 좌석 선택 프레임에 사용할 버튼과 이미지 등을 선언 좌석은 총 30개이므로 체크박스는 30개 만들어줬다.
	

	public selectseat_Frame(String title, int movienum,String id) //넘어오는 movienum안에 위에서 얘기한 영화의 번호가 들어있다(11,21 등)
	{
		setTitle(title);
		setSize(815,640);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
		setLocationRelativeTo(null);
		seatnum = movienum;
		userid = id;
		
		
		JPanel panel = new JPanel() {
			public void paintComponent(Graphics g)
			{	g.drawImage(icon.getImage(), 0,0,null); // 배경이미지 설정 ->seat.jpg가 배경 이미지임
				setOpaque(false);
				super.paintComponent(g);			
			}
	}; 
	
	
	panel.setLayout(null);
	
	btnback = new JButton(back);
	btnback.setRolloverIcon(back_on);
	btnback.setBorderPainted(false);
	btnback.setFocusPainted(false);
	btnback.setContentAreaFilled(false);
	
	btnback.setLocation(0,0);
	btnback.setSize(btnback.getPreferredSize());
	
	btnpay = new JButton(pay);
	btnpay.setRolloverIcon(pay_on);
	btnpay.setBorderPainted(false);
	btnpay.setFocusPainted(false);
	btnpay.setContentAreaFilled(false);
	
	btnpay.setLocation(655,0);
	btnpay.setSize(btnpay.getPreferredSize());
	
	btnpay.addActionListener(this);
	btnback.addActionListener(this);  // 뒤로가기 버튼 생성
	
	
	seatsetting(); // 의자 체크박스와 선택불가 좌석을 초기화해주는 함수
	seatset(); // 좌석 선택 체크박스(30개)를 깔아주는 함수
	availableSeat(); // 이미 예매된 좌석은 선택불가로 만들어주는 함수. 
	seatblank();
	
//	String a = "A1A2A3";
//	String b;
//	b = a.substring(0, 2);
//	System.out.println(a.length());
	
	for(int i =0; i<30;i++)
	{
		panel.add(btnseat[i]); //좌석을 출력하기 위에 panel에 붙여줬음(30개이므로 반복문 사용)
	}
	panel.add(btnpay);
	panel.add(btnback);
	JScrollPane j = new JScrollPane(panel);
	setContentPane(j);
	setVisible(true); // 출력 부분
	
	}
	
private void seatblank() { //블랭크 함수에서는 좌석 이름을 모두 공백으로 초기화해놓는다. 또한 좌석 체크변수도 0으로 해놓음
		for(int i = 0; i<30; i++) {
			seattext[i] = "";
			seatcheck[i] = 0;
		}
		
	}

/* void availableSeat() :
 위에서 말했던 넘어온 숫자에 해당되는 영화의 좌석정보를 이용해서 의자 체크박스를 선택 불가로 만들어 주는 함수이다.
 아래 함수의 case 21를 예로 들자면 21은 토요일 오전에 상영하는 기생충이다. 
 따라서 5개의 좌석을 선택 불가로 만들어야하는데  btnseat[좌석번호].setEnabled(false); 이 구문이 해당 좌석번호의 
 체크박스를 선택불가로 만들어주는 구문이다. 좌석번호는 아무 번호나 적었으며 이 구문을 5번 적어주므로써 의자 5개가 선택불가가 된다.
 이런식으로 16개의 영화 정보에 맞는 좌석 선택 화면을 구성하였다.
 
 후에 예매내역 DB와 연동되어 사용자가 추가로 선택한 좌석도 선택불가상태가 될 것이다.(아직 구현 안됨)
 */
	
	private void availableSeat() { 
		switch(seatnum)
		{
		case 11:
			sql = "select seatnumber from result where watchingtime = '10:00' and movieday = '토요일'";
			divide();
			break;
		case 21:
			sql = "select seatnumber from result where watchingtime = '11:00'and movieday = '토요일'";
			divide();
			btnseat[7].setEnabled(false);
			btnseat[8].setEnabled(false);
			btnseat[9].setEnabled(false);
			btnseat[20].setEnabled(false);
			btnseat[21].setEnabled(false);
			break;
		case 31:
			sql = "select seatnumber from result where watchingtime = '12:00'and movieday = '토요일'";
			divide();
			btnseat[13].setEnabled(false);
			btnseat[14].setEnabled(false);
			break;
		case 41:
			sql = "select seatnumber from result where watchingtime = '13:00'and movieday = '토요일'";
			divide();
			btnseat[12].setEnabled(false);
			btnseat[13].setEnabled(false);
			btnseat[14].setEnabled(false);
			btnseat[19].setEnabled(false);
			btnseat[5].setEnabled(false);
			btnseat[7].setEnabled(false);
			btnseat[8].setEnabled(false);
			btnseat[9].setEnabled(false);
			btnseat[20].setEnabled(false);
			btnseat[21].setEnabled(false);
			break;
		case 12:
			sql = "select seatnumber from result where watchingtime = '10:00'and movieday = '토요일'";
			divide();
			btnseat[1].setEnabled(false);
			btnseat[2].setEnabled(false);
			btnseat[3].setEnabled(false);
			btnseat[10].setEnabled(false);
			btnseat[11].setEnabled(false);
			btnseat[12].setEnabled(false);
			btnseat[15].setEnabled(false);
			btnseat[16].setEnabled(false);
			btnseat[17].setEnabled(false);
			btnseat[19].setEnabled(false);
			break;
		case 22:
			sql = "select seatnumber from result where watchingtime = '20:00'and movieday = '토요일'";
			divide();
			btnseat[12].setEnabled(false);
			btnseat[13].setEnabled(false);
			btnseat[14].setEnabled(false);
			btnseat[19].setEnabled(false);
			btnseat[5].setEnabled(false);
			break;
		case 32:
			sql = "select seatnumber from result where watchingtime = '18:30'and movieday = '토요일'";
			divide();
			btnseat[1].setEnabled(false);
			btnseat[2].setEnabled(false);
			btnseat[3].setEnabled(false);
			btnseat[10].setEnabled(false);
			btnseat[11].setEnabled(false);
			btnseat[12].setEnabled(false);
			btnseat[15].setEnabled(false);
			btnseat[16].setEnabled(false);
			btnseat[17].setEnabled(false);
			btnseat[19].setEnabled(false);
			btnseat[20].setEnabled(false);
			btnseat[21].setEnabled(false);
			btnseat[22].setEnabled(false);
			btnseat[23].setEnabled(false);
			btnseat[24].setEnabled(false);
			btnseat[25].setEnabled(false);
			btnseat[26].setEnabled(false);
			btnseat[27].setEnabled(false);
			btnseat[28].setEnabled(false);
			btnseat[29].setEnabled(false);
			break;
		case 42:
			sql = "select seatnumber from result where watchingtime = '19:00'and movieday = '토요일'";
			divide();
			btnseat[1].setEnabled(false);
			btnseat[2].setEnabled(false);
			btnseat[3].setEnabled(false);
			btnseat[4].setEnabled(false);
			btnseat[5].setEnabled(false);
			btnseat[10].setEnabled(false);
			btnseat[11].setEnabled(false);
			btnseat[12].setEnabled(false);
			btnseat[15].setEnabled(false);
			btnseat[16].setEnabled(false);
			btnseat[17].setEnabled(false);
			btnseat[19].setEnabled(false);
			btnseat[20].setEnabled(false);
			btnseat[21].setEnabled(false);
			btnseat[22].setEnabled(false);
			btnseat[23].setEnabled(false);
			btnseat[24].setEnabled(false);
			btnseat[25].setEnabled(false);
			btnseat[26].setEnabled(false);
			btnseat[27].setEnabled(false);
			btnseat[28].setEnabled(false);
			btnseat[29].setEnabled(false);
			break;
		case 13:
			sql = "select seatnumber from result where watchingtime = '10:00'and movieday = '일요일'";
			divide();
			btnseat[17].setEnabled(false);
			btnseat[19].setEnabled(false);
			break;
		case 23:
			sql = "select seatnumber from result where watchingtime = '11:00'and movieday = '일요일'";
			divide();
			btnseat[11].setEnabled(false);
			btnseat[19].setEnabled(false);
			btnseat[5].setEnabled(false);
			btnseat[6].setEnabled(false);
			btnseat[10].setEnabled(false);
			btnseat[12].setEnabled(false);
			btnseat[17].setEnabled(false);
			break;
		case 33:
			sql = "select seatnumber from result where watchingtime = '12:00'and movieday = '일요일'";
			divide();
			btnseat[1].setEnabled(false);
			btnseat[2].setEnabled(false);
			btnseat[3].setEnabled(false);
			btnseat[10].setEnabled(false);
			btnseat[11].setEnabled(false);
			btnseat[12].setEnabled(false);
			btnseat[15].setEnabled(false);
			btnseat[16].setEnabled(false);
			btnseat[17].setEnabled(false);
			btnseat[19].setEnabled(false);
			break;
		case 43:
			sql = "select seatnumber from result where watchingtime = '13:00'and movieday = '일요일'";
			divide();
			btnseat[12].setEnabled(false);
			btnseat[13].setEnabled(false);
			btnseat[14].setEnabled(false);
			btnseat[19].setEnabled(false);
			btnseat[5].setEnabled(false);
			btnseat[7].setEnabled(false);
			btnseat[8].setEnabled(false);
			btnseat[9].setEnabled(false);
			btnseat[20].setEnabled(false);
			btnseat[21].setEnabled(false);
			btnseat[22].setEnabled(false);
			btnseat[23].setEnabled(false);
			btnseat[25].setEnabled(false);
			btnseat[26].setEnabled(false);
			break;
		case 14:
			sql = "select seatnumber from result where watchingtime = '19:30'and movieday = '일요일'";
			divide();
			btnseat[1].setEnabled(false);
			btnseat[2].setEnabled(false);
			btnseat[3].setEnabled(false);
			btnseat[10].setEnabled(false);
			btnseat[11].setEnabled(false);
			btnseat[12].setEnabled(false);
			btnseat[15].setEnabled(false);
			break;
		case 24:
			sql = "select seatnumber from result where watchingtime = '20:00'and movieday = '일요일'";
			divide();
			btnseat[1].setEnabled(false);
			btnseat[2].setEnabled(false);
			btnseat[3].setEnabled(false);
			btnseat[4].setEnabled(false);
			btnseat[5].setEnabled(false);
			btnseat[10].setEnabled(false);
			btnseat[11].setEnabled(false);
			btnseat[12].setEnabled(false);
			btnseat[15].setEnabled(false);
			btnseat[16].setEnabled(false);
			btnseat[17].setEnabled(false);
			btnseat[19].setEnabled(false);
			btnseat[20].setEnabled(false);
			btnseat[21].setEnabled(false);
			btnseat[22].setEnabled(false);
			btnseat[23].setEnabled(false);
			btnseat[24].setEnabled(false);
			btnseat[25].setEnabled(false);
			btnseat[26].setEnabled(false);
			btnseat[27].setEnabled(false);
			btnseat[28].setEnabled(false);
			btnseat[29].setEnabled(false);
			btnseat[6].setEnabled(false);
			btnseat[7].setEnabled(false);
			btnseat[8].setEnabled(false);
			btnseat[9].setEnabled(false);
			btnseat[18].setEnabled(false);
			btnseat[13].setEnabled(false);
			btnseat[14].setEnabled(false);
			break;
		case 34:
			sql = "select seatnumber from result where watchingtime = '18:30'and movieday = '일요일'";
			divide();
			btnseat[5].setEnabled(false);
			btnseat[10].setEnabled(false);
			btnseat[11].setEnabled(false);
			btnseat[12].setEnabled(false);
			btnseat[15].setEnabled(false);
			btnseat[16].setEnabled(false);
			btnseat[17].setEnabled(false);
			btnseat[19].setEnabled(false);
			btnseat[20].setEnabled(false);
			btnseat[21].setEnabled(false);
			btnseat[22].setEnabled(false);
			btnseat[23].setEnabled(false);
			btnseat[24].setEnabled(false);
			btnseat[25].setEnabled(false);
			btnseat[26].setEnabled(false);
			btnseat[27].setEnabled(false);
			btnseat[28].setEnabled(false);
			btnseat[29].setEnabled(false);
			btnseat[6].setEnabled(false);
			btnseat[7].setEnabled(false);
			btnseat[8].setEnabled(false);
			btnseat[9].setEnabled(false);
			btnseat[18].setEnabled(false);
			btnseat[13].setEnabled(false);
			btnseat[14].setEnabled(false);
			break;
		case 44:
			sql = "select seatnumber from result where watchingtime = '19:00'and movieday = '일요일'";
			divide();
			btnseat[1].setEnabled(false);
			btnseat[2].setEnabled(false);
			btnseat[3].setEnabled(false);
			btnseat[4].setEnabled(false);
			btnseat[5].setEnabled(false);
			btnseat[10].setEnabled(false);
			btnseat[11].setEnabled(false);
			btnseat[12].setEnabled(false);
			btnseat[15].setEnabled(false);
			btnseat[16].setEnabled(false);
			btnseat[17].setEnabled(false);
			btnseat[19].setEnabled(false);
			btnseat[20].setEnabled(false);
			btnseat[21].setEnabled(false);
			btnseat[22].setEnabled(false);
			btnseat[23].setEnabled(false);
			btnseat[24].setEnabled(false);
			btnseat[25].setEnabled(false);
			btnseat[26].setEnabled(false);
			btnseat[27].setEnabled(false);
			btnseat[28].setEnabled(false);
			btnseat[29].setEnabled(false);
			break;
		}
		
		
	}

	// 문자열을 나눠준다. 
	private void divide() {
		rs = dc.executeQuery(sql);
		try {
			if(rs.next())
			{
				seatnumbertext = rs.getString("seatnumber");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i=0;i<seatnumbertext.length()-1;i++)
		{	
		    r_seattext[i] = seatnumbertext.substring(i,i+2); //좌석번호가 2자리이므로 2자리씩 나눠서 해당 값을 스위치 문으로 비교합니다.
		    System.out.println(seatnumbertext);
			
		
		 switch(r_seattext[i])
		 {
		 case "A1": 
			 btnseat[0].setEnabled(false);
			 break;
		 case "A2":
			 btnseat[1].setEnabled(false);
			 break;
		 case "A3":
			 btnseat[2].setEnabled(false);
			 break;
		 case "A4":
			 btnseat[3].setEnabled(false);
			 break;
		 case "A5":
			 btnseat[4].setEnabled(false);
			 break;
		 case "B1":
			 btnseat[5].setEnabled(false);
			 break;
		 case "B2":
			 btnseat[6].setEnabled(false);
			 break;
		 case "B3":
			 btnseat[7].setEnabled(false);
			 break;
		 case "B4":
			 btnseat[8].setEnabled(false);
			 break;
		 case "B5":
			 btnseat[9].setEnabled(false);
			 break;
		 case "C1":
			 btnseat[10].setEnabled(false);
			 break;
		 case "C2":
			 btnseat[11].setEnabled(false);
			 break;
		 case "C3":
			 btnseat[12].setEnabled(false);
			 break;
		 case "C4":
			 btnseat[13].setEnabled(false);
			 break;
		 case "C5":
			 btnseat[14].setEnabled(false);
			 break;
		 case "D1":
			 btnseat[15].setEnabled(false);
			 break;
		 case "D2":
			 btnseat[16].setEnabled(false);
			 break;
		 case "D3":
			 btnseat[17].setEnabled(false);
			 break;
		 case "D4":
			 btnseat[18].setEnabled(false);
			 break;
		 case "D5":
			 btnseat[19].setEnabled(false);
			 break;
		 case "E1":
			 btnseat[20].setEnabled(false);
			 break;
		 case "E2":
			 btnseat[21].setEnabled(false);
			 break;
		 case "E3":
			 btnseat[22].setEnabled(false);
			 break;
		 case "E4":
			 btnseat[23].setEnabled(false);
			 break;
		 case "E5":
			 btnseat[24].setEnabled(false);
			 break;
		 case "F1":
			 btnseat[25].setEnabled(false);
			 break;
		 case "F2":
			 btnseat[26].setEnabled(false);
			 break;
		 case "F3":
			 btnseat[27].setEnabled(false);
			 break;
		 case "F4":
			 btnseat[28].setEnabled(false);
			 break;
		 case "F5":
			 btnseat[29].setEnabled(false);
			 break;
		 }
		}
	
}

	/* void seatsetting() :
	 	체크박스 좌석 30개를 구현하는 함수이다. 
	 	아래 구문을 30번씩 칠 수 없으므로 반복문을 이용했다.
	 	아래 옵션값을 모두 작성해야 이미지 체크박스가 만들어진다.
	 */

	private void seatsetting() {
		for(int i=0; i<30;i++) // 의자는 5개씩 6줄 총 30개 만든다.
		{
			btnseat[i] = new JCheckBox(seat);
			btnseat[i].setSelectedIcon(r_seat);
			btnseat[i].setDisabledIcon(d_seat);
			btnseat[i].setBorderPainted(false);
			btnseat[i].setFocusPainted(false);
			btnseat[i].setContentAreaFilled(false);
			btnseat[i].setSize(btnseat[i].getPreferredSize());
			btnseat[i].addItemListener(this);

		}
		
	}

/* private void seatset() :
  바로 위 함수에서 만들었던 체크박스 좌석 30개의 위치를 각각 잡아주는 함수이다. 
  레이아웃으로는 배치가 불가능하므로 하나하나 위치 값을 넣어서 작업하였다.
  좌석 번호도 보기 좋게 나누어놓았다.
  btnseat[0] ~ [4]가 a1~a5, btnseat[5]~[9]가 b1~b5이다. 나머지 좌석도 이런식으로 이해하면 된다.
 */

	private void seatset() {
		btnseat[0].setLocation(252, 207); 
		btnseat[1].setLocation(308, 207); 
		btnseat[2].setLocation(363, 207);
		btnseat[3].setLocation(418, 207);
		btnseat[4].setLocation(474, 207); // a열
		
		btnseat[5].setLocation(252, 270); 
		btnseat[6].setLocation(308, 270); 
		btnseat[7].setLocation(363, 270);
		btnseat[8].setLocation(418, 270);
		btnseat[9].setLocation(474, 270); // b열
		
		btnseat[10].setLocation(252, 333); 
		btnseat[11].setLocation(308, 333); 
		btnseat[12].setLocation(363, 333);
		btnseat[13].setLocation(418, 333);
		btnseat[14].setLocation(474, 333); // c열
		
		btnseat[15].setLocation(252, 396); 
		btnseat[16].setLocation(308, 396); 
		btnseat[17].setLocation(363, 396);
		btnseat[18].setLocation(418, 396);
		btnseat[19].setLocation(474, 396); // d열
		
		btnseat[20].setLocation(252, 460); 
		btnseat[21].setLocation(308, 460); 
		btnseat[22].setLocation(363, 460);
		btnseat[23].setLocation(418, 460);
		btnseat[24].setLocation(474, 460); // e열
		
		btnseat[25].setLocation(252, 522); 
		btnseat[26].setLocation(308, 522); 
		btnseat[27].setLocation(363, 522);
		btnseat[28].setLocation(418, 522);
		btnseat[29].setLocation(474, 522); // f열
		
		
	}



	public static void main(String[] args) {
		new selectseat_Frame("인하공전 영화예매시스템",0,"201645032");
	}

/* 액션 이벤트 : 
 예매 버튼은 사용자 DB와 연동되어야 하므로 아직 구현이 안된 상태이다.
 
 현재 뒤로가기 버튼만 구현된 상태인데 앞에 숫자가 1이면 걸캅스, 2이면 기생충, 3이면 악인전, 4면 어벤져스 인 점을 이용해서 앞에 숫자가 같은 것들을
 모두 묶고 뒤에 프레임으로 넘어가게 만들었다.
 */

	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if(obj == btnback) // 뒤로 가는 버튼  seatnum의 앞 숫자에 따라 돌아갈 페이지의 영화가 달라진다.1걸캅스,2기생충,3악인전,4어벤져스
		{
			
			if(seatnum == 11 ||seatnum == 12 || seatnum == 13 || seatnum == 14)
			{
				new moviebuy_Frame("인하공전 영화예매시스템", 1,userid);
				setVisible(false);
			}
			else if(seatnum == 21 ||seatnum == 22 || seatnum == 23 || seatnum == 24)
			{
				new moviebuy_Frame("인하공전 영화예매시스템", 2,userid);
				setVisible(false);
			}
			else if(seatnum == 31 ||seatnum == 32 || seatnum == 33 || seatnum == 34)
			{
				new moviebuy_Frame("인하공전 영화예매시스템", 3,userid);
				setVisible(false);
			}
			else if(seatnum == 41 ||seatnum == 42 || seatnum == 43 || seatnum == 44)
			{
				new moviebuy_Frame("인하공전 영화예매시스템", 4,userid);
				setVisible(false);
			}
		}
		else if(obj == btnpay)
		{
			for(int i=0;i<5;i++) // 좌석이 5개씩 6줄이므로 for문 5개로 촤석번호를 저장한다.
			{
				if(seatcheck[i] == 1)
				{	
					seattext[i] ="A"+Integer.toString(i+1);
					System.out.println(seattext[i]);
				}
			}
			for(int i=5;i<10;i++)
			{
				if(seatcheck[i] == 1)
				{
					seattext[i] ="B"+Integer.toString(i-4);
					System.out.println(seattext[i]);
				}
			}
			for(int i=10;i<15;i++)
			{
				if(seatcheck[i] == 1)
				{
					seattext[i] ="C"+Integer.toString(i-9);
					System.out.println(seattext[i]);
				}
			}
			for(int i=15;i<20;i++)
			{
				if(seatcheck[i] == 1)
				{
					seattext[i] ="D"+Integer.toString(i-14);
					System.out.println(seattext[i]);
				}
			}
			for(int i=20;i<25;i++)
			{
				if(seatcheck[i] == 1)
				{
					seattext[i] ="E"+Integer.toString(i-19);
					System.out.println(seattext[i]);
				}
			}
			for(int i=25;i<30;i++)
			{
				if(seatcheck[i] == 1)
				{
					seattext[i] ="F"+Integer.toString(i-24);
					System.out.println(seattext[i]);
				}
			}
			
			for(int i=0;i<30;i++)
			{
				if(seattext[i]!="")
				{
					seatstring +=seattext[i]; //위에서 얻은 체크된 좌석 번호들을 seatstring에 최종적으로 넣는다.
					
				}
			}
			
			getcust();
	
			if(seatnum == 11)
			{	
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '걸캅스', movieday = '토요일', watchingplace = '3관', watchingtime ='10:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);
				
			}
			else if(seatnum == 21)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '기생충', movieday = '토요일', watchingplace = '4관', watchingtime ='11:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 31)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '악인전', movieday = '토요일', watchingplace = '1관', watchingtime ='12:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 41)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '어벤져스', movieday = '토요일', watchingplace = '2관', watchingtime ='13:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 12)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '걸캅스', movieday = '토요일', watchingplace = '3관', watchingtime ='19:30' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 22)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '기생충', movieday = '토요일', watchingplace = '4관', watchingtime ='20:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 32)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '악인전', movieday = '토요일', watchingplace = '1관', watchingtime ='18:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 42)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '어벤져스', movieday = '토요일', watchingplace = '2관', watchingtime ='19:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 13)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '걸캅스', movieday = '일요일', watchingplace = '3관', watchingtime ='10:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 23)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '기생충', movieday = '일요일', watchingplace = '4관', watchingtime ='11:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 33)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '악인전', movieday = '일요일', watchingplace = '1관', watchingtime ='12:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 43)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '어벤져스', movieday = '일요일', watchingplace = '2관', watchingtime ='13:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 14)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '걸캅스', movieday = '일요일', watchingplace = '3관', watchingtime ='19:30' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 24)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '기생충', movieday = '일요일', watchingplace = '4관', watchingtime ='20:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 34)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '악인전', movieday = '일요일', watchingplace = '1관', watchingtime ='18:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			else if(seatnum == 44)
			{
				String updatesql = "update result set seatnumber='"+seatstring+"', moviename = '어벤져스', movieday = '일요일', watchingplace = '2관', watchingtime ='19:00' where custid = '"+custid+"'";
				dc.executeUpdate(updatesql);

			}
			
			
			new confirmovie_Frame("인하공전 영화예매시스템",seatnum,custid, userid,seatstring);
			setVisible(false);
	
		}
		
}



	




private void getcust() {
	String sql =("select count(custid) from result");
	rs = dc.executeQuery(sql);
	try {
		while(rs.next())
		{
			custid = rs.getInt(1);
			System.out.println("주문번호 : "+custid);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}

@Override
public void itemStateChanged(ItemEvent e) {
	Object obj = e.getItem();
	for(int i = 0; i<30; i++)
	{
	if(obj == btnseat[i])
	{	if(btnseat[i].isSelected()) 
	    {
		seatcheck[i] = 1;
		System.out.println(i+1+"번 좌석 체크");
	    }
	else if(!btnseat[i].isSelected())
	{
		seatcheck[i] = 0;
		System.out.println(i+1+"번 좌석 체크해제");
	}
	}
	}
	
}
}

