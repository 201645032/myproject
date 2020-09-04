package movieproject;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

public class moviebuy_Frame extends JFrame implements ActionListener{
	JButton btnback;
	JButton btnbuy;JButton btnbuy1;JButton btnbuy2;JButton btnbuy3;
	JLabel seat; JLabel seat1; JLabel seat2; JLabel seat3;
	ImageIcon icon = new ImageIcon("img/girlbuy.jpg");
	ImageIcon icon1 = new ImageIcon("img/bugbuy.jpg");
	ImageIcon icon2 = new ImageIcon("img/badbuy.jpg");
	ImageIcon icon3 = new ImageIcon("img/avgbuy.jpg");
	ImageIcon back = new ImageIcon("img/back.png");
	ImageIcon back_on = new ImageIcon("img/back_on.png");
	ImageIcon buy = new ImageIcon("img/buy.png");
	ImageIcon buy_on = new ImageIcon("img/buy_on.png");
	int movienum;
	int[] a = new int[4];
	DB_Conn dc = new DB_Conn();
	private String sql;
	private ResultSet rs;
	String userid;
	
	public moviebuy_Frame(String title, int num,String id)
	{
		setTitle(title);
		setSize(520,640);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 전체 페이지를 끄게 하므로 필요한 페이지에만 쓰자
		setLocationRelativeTo(null);
		movienum = num;
		userid = id;
		
		JPanel panel = new JPanel() {
			public void paintComponent(Graphics g)
			{	switch(movienum)
				{
				case 1:
					g.drawImage(icon.getImage(), 0,0,null);
					break;
				case 2:
					g.drawImage(icon1.getImage(), 0,0,null);
					break;
				case 3:
					g.drawImage(icon2.getImage(), 0,0,null);
					break;
				case 4:
					g.drawImage(icon3.getImage(), 0,0,null);
					break;
					default:
					g.drawImage(icon.getImage(), 0,0,null);
					break;
				}
				
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
		
		btnback.setLocation(5,550);
		btnback.setSize(btnback.getPreferredSize());
		
		btnbuy = new JButton(buy); 			btnbuy1 = new JButton(buy);
		btnbuy2 = new JButton(buy); 		btnbuy3 = new JButton(buy);
		btnbuy.setRolloverIcon(buy_on); 	btnbuy1.setRolloverIcon(buy_on);
		btnbuy2.setRolloverIcon(buy_on); 	btnbuy3.setRolloverIcon(buy_on);
		btnbuy.setBorderPainted(false); 	btnbuy1.setBorderPainted(false);;
		btnbuy2.setBorderPainted(false);; 	btnbuy3.setBorderPainted(false);;
		btnbuy.setFocusPainted(false);		btnbuy1.setFocusPainted(false);
		btnbuy2.setFocusPainted(false);		btnbuy3.setFocusPainted(false);
		btnbuy.setContentAreaFilled(false); btnbuy1.setContentAreaFilled(false);
		btnbuy2.setContentAreaFilled(false); btnbuy3.setContentAreaFilled(false);
		
		btnbuy.setLocation(400,145); btnbuy1.setLocation(400,220);
		btnbuy2.setLocation(400,377); btnbuy3.setLocation(400,457);
		btnbuy.setSize(btnbuy.getPreferredSize()); btnbuy1.setSize(btnbuy1.getPreferredSize());
		btnbuy2.setSize(btnbuy2.getPreferredSize()); btnbuy3.setSize(btnbuy3.getPreferredSize());
		
		btnbuy.addActionListener(this);btnbuy1.addActionListener(this);
		btnbuy2.addActionListener(this);btnbuy3.addActionListener(this);
		
		seat = new JLabel("20 / 30");
		seat.setFont(new Font("Gothic",Font.BOLD,20));
		seat.setLocation(330,199);
		seat.setForeground(Color.BLACK);
		seat.setSize(seat.getPreferredSize()); //레이아웃이 null일 때 텍스트의 크기를 잡아주는 방법 값을 직접 넣어주니 절 때 구할 수 없었다.
		
		seat1 = new JLabel("20 / 30");
		seat1.setFont(new Font("Gothic",Font.BOLD,20));
		seat1.setLocation(330,267);
		seat1.setForeground(Color.BLACK);
		seat1.setSize(seat.getPreferredSize());
		
		seat2 = new JLabel("20 / 30");
		seat2.setFont(new Font("Gothic",Font.BOLD,20));
		seat2.setLocation(330,433);
		seat2.setForeground(Color.BLACK);
		seat2.setSize(seat.getPreferredSize());
		
		seat3 = new JLabel("20 / 30");
		seat3.setFont(new Font("Gothic",Font.BOLD,20));
		seat3.setLocation(330,501);
		seat3.setForeground(Color.BLACK);
		seat3.setSize(seat.getPreferredSize());
		
		switch(movienum)
		{
		
		case 1:
			sql = "select seat from movie where name = '걸캅스'";
			System.out.println(sql);
			 rs = dc.executeQuery(sql);
			try {
				while(rs.next())
				{
					if(rs.getRow() == 1)
					{
						a[0] = rs.getInt(1);
						System.out.println(a[0]);
						seat.setText(a[0]+" / 30"); // 현재좌석은 DB에서 가져온다. (현재좌석 / 총 좌석)형태
					}
					else if(rs.getRow() == 2)
					{
						a[1] = rs.getInt(1);
						System.out.println(a[1]);
						seat1.setText(a[1]+" / 30");
					}
					else if(rs.getRow() == 3)
					{
						a[2] = rs.getInt(1);
						System.out.println(a[2]);
						seat2.setText(a[2]+" / 30");
					}
					else if(rs.getRow() == 4)
					{
						a[3] = rs.getInt(1);
						System.out.println(a[3]);
						seat3.setText(a[3]+" / 30");
					}
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			break;
			
		case 2:
			sql = "select seat from movie where name = '기생충'";
			System.out.println(sql);
			 rs = dc.executeQuery(sql);
			try {
				while(rs.next())
				{
					if(rs.getRow() == 1)
					{
						a[0] = rs.getInt(1);
						System.out.println(a[0]);
						seat.setText(a[0]+" / 30"); // 현재좌석은 DB에서 가져온다. (현재좌석 / 총 좌석)형태
					}
					else if(rs.getRow() == 2)
					{
						a[1] = rs.getInt(1);
						System.out.println(a[1]);
						seat1.setText(a[1]+" / 30");
					}
					else if(rs.getRow() == 3)
					{
						a[2] = rs.getInt(1);
						System.out.println(a[2]);
						seat2.setText(a[2]+" / 30");
					}
					else if(rs.getRow() == 4)
					{
						a[3] = rs.getInt(1);
						System.out.println(a[3]);
						seat3.setText(a[3]+" / 30");
					}
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			break;
			
		case 3:
			sql = "select seat from movie where name = '악인전'";
			System.out.println(sql);
			 rs = dc.executeQuery(sql);
			try {
				while(rs.next())
				{
					if(rs.getRow() == 1)
					{
						a[0] = rs.getInt(1);
						System.out.println(a[0]);
						seat.setText(a[0]+" / 30"); // 현재좌석은 DB에서 가져온다. (현재좌석 / 총 좌석)형태
					}
					else if(rs.getRow() == 2)
					{
						a[1] = rs.getInt(1);
						System.out.println(a[1]);
						seat1.setText(a[1]+" / 30");
					}
					else if(rs.getRow() == 3)
					{
						a[2] = rs.getInt(1);
						System.out.println(a[2]);
						seat2.setText(a[2]+" / 30");
					}
					else if(rs.getRow() == 4)
					{
						a[3] = rs.getInt(1);
						System.out.println(a[3]);
						seat3.setText(a[3]+" / 30");
					}
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			break;
			
		case 4:
			sql = "select seat from movie where name = '어벤져스'";
			System.out.println(sql);
			 rs = dc.executeQuery(sql);
			try {
				while(rs.next())
				{
					if(rs.getRow() == 1)
					{
						a[0] = rs.getInt(1);
						System.out.println(a[0]);
						seat.setText(a[0]+" / 30"); // 현재좌석은 DB에서 가져온다. (현재좌석 / 총 좌석)형태
					}
					else if(rs.getRow() == 2)
					{
						a[1] = rs.getInt(1);
						System.out.println(a[1]);
						seat1.setText(a[1]+" / 30");
					}
					else if(rs.getRow() == 3)
					{
						a[2] = rs.getInt(1);
						System.out.println(a[2]);
						seat2.setText(a[2]+" / 30");
					}
					else if(rs.getRow() == 4)
					{
						a[3] = rs.getInt(1);
						System.out.println(a[3]);
						seat3.setText(a[3]+" / 30");
					}
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			break;
			
			default: System.out.println("답없음");

		}
		

		btnback.addActionListener(this);
		
		
		panel.add(btnback); panel.add(btnbuy); 
		panel.add(btnbuy1); panel.add(btnbuy2); panel.add(btnbuy3);
		panel.add(seat);panel.add(seat1);panel.add(seat2);panel.add(seat3);
		JScrollPane j = new JScrollPane(panel);
		setContentPane(j);
		setVisible(true);
	};
public static void main(String[] args) {
	new moviebuy_Frame("인하공전 영화예매시스템",0,"201645032");
}
@Override
public void actionPerformed(ActionEvent e) {
	// TODO Auto-generated method stub
	Object obj = e.getSource();
	if(obj == btnback)
	{
		new movieinfo_Frame("인하공전 영화예매시스템",movienum,userid);
		setVisible(false);
	}
	else if(obj == btnbuy)
	{
		switch(movienum)
		{
		case 1:
			new selectseat_Frame("인하공전 영화예매시스템",11,userid);
			setVisible(false);
			break;
		case 2:
			new selectseat_Frame("인하공전 영화예매시스템",21,userid);
			setVisible(false);
			break;
		case 3:
			new selectseat_Frame("인하공전 영화예매시스템",31,userid);
			setVisible(false);
			break;
		case 4:
			new selectseat_Frame("인하공전 영화예매시스템",41,userid);
			setVisible(false);
			break;
		}
	}
	else if(obj == btnbuy1)
	{
		switch(movienum)
		{
		case 1:
			new selectseat_Frame("인하공전 영화예매시스템",12,userid);
			setVisible(false);
			break;
		case 2:
			new selectseat_Frame("인하공전 영화예매시스템",22,userid);
			setVisible(false);
			break;
		case 3:
			new selectseat_Frame("인하공전 영화예매시스템",32,userid);
			setVisible(false);
			break;
		case 4:
			new selectseat_Frame("인하공전 영화예매시스템",42,userid);
			setVisible(false);
			break;
		}
	}
	else if(obj == btnbuy2)
	{
		switch(movienum)
		{
		case 1:
			new selectseat_Frame("인하공전 영화예매시스템",13,userid);
			setVisible(false);
			break;
		case 2:
			new selectseat_Frame("인하공전 영화예매시스템",23,userid);
			setVisible(false);
			break;
		case 3:
			new selectseat_Frame("인하공전 영화예매시스템",33,userid);
			setVisible(false);
			break;
		case 4:
			new selectseat_Frame("인하공전 영화예매시스템",43,userid);
			setVisible(false);
			break;
		}
	}
	else if(obj == btnbuy3)
	{
		switch(movienum)
		{
		case 1:
			new selectseat_Frame("인하공전 영화예매시스템",14,userid);
			setVisible(false);
			break;
		case 2:
			new selectseat_Frame("인하공전 영화예매시스템",24,userid);
			setVisible(false);
			break;
		case 3:
			new selectseat_Frame("인하공전 영화예매시스템",34,userid);
			setVisible(false);
			break;
		case 4:
			new selectseat_Frame("인하공전 영화예매시스템",44,userid);
			setVisible(false);
			break;
		}
	}
	
}
}
