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

public class search_Frame extends JFrame implements ActionListener {
	DB_Conn dc = new DB_Conn();
	String userid;
	int custid;
	String name, place, time, seatnumber,day;
	ImageIcon icon = new ImageIcon("img/selectback.jpg");
	ImageIcon back = new ImageIcon("img/back.png");
	ImageIcon back_on = new ImageIcon("img/back_on.png");
	JLabel[] info = new JLabel[5];
	JButton btnback;
	int count;

	public search_Frame(String title, int cust, String id) {
	userid = id;
	custid = cust;
	setTitle(title);
	setSize(815,640);
	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 전체 페이지를 끄게 하므로 필요한 페이지에만 쓰자
	setLocationRelativeTo(null);
	
	
	JPanel panel = new JPanel() {
		public void paintComponent(Graphics g)
		{	g.drawImage(icon.getImage(), 0,0,null);
			setOpaque(false);
			super.paintComponent(g);			
		}
	};
	
	panel.setLayout(null);
	JLabel user = new JLabel(userid);
	
	user.setFont(new Font("Dotum",Font.BOLD,25));
	user.setForeground(Color.blue);
	user.setLocation(115, 115);
	user.setSize(user.getPreferredSize());
	
	getinfo();
	if(info[0]!=null)
	{
	info[0].setFont(new Font("Dotum",Font.BOLD,25));
	info[0].setForeground(Color.blue);
	info[0].setLocation(115, 210);
	info[0].setSize(info[0].getPreferredSize());
	}
	if(info[1]!=null)
	{
	info[1].setFont(new Font("Dotum",Font.BOLD,25));
	info[1].setForeground(Color.blue);
	info[1].setLocation(115, 300);
	info[1].setSize(info[1].getPreferredSize());
	}
	if(info[2]!=null)
	{
	info[2].setFont(new Font("Dotum",Font.BOLD,25));
	info[2].setForeground(Color.blue);
	info[2].setLocation(115, 380);
	info[2].setSize(info[2].getPreferredSize());
	}
	if(info[3]!=null)
	{
	info[3].setFont(new Font("Dotum",Font.BOLD,25));
	info[3].setForeground(Color.blue);
	info[3].setLocation(115, 460);
	info[3].setSize(info[3].getPreferredSize());
	}
	if(info[4]!=null)
	{
	info[4].setFont(new Font("Dotum",Font.BOLD,25));
	info[4].setForeground(Color.blue);
	info[4].setLocation(115, 540);
	info[4].setSize(info[4].getPreferredSize());
	}
	for(int i=0; i<count;i++)
	{
		panel.add(info[i]);
	}
	
	btnback = new JButton(back);
	btnback.setRolloverIcon(back_on);
	btnback.setBorderPainted(false);
	btnback.setFocusPainted(false);
	btnback.setContentAreaFilled(false);
	
	btnback.setLocation(8,5);
	btnback.setSize(btnback.getPreferredSize());
	btnback.addActionListener(this);
	
	panel.add(user); panel.add(btnback);
	JScrollPane j = new JScrollPane(panel);
	setContentPane(j);
	setVisible(true);
		
}
	private void getinfo() {
		String sql2 = "select count(custid) from result where username = '"+userid+"'";
		ResultSet rs2 = dc.executeQuery(sql2);
		try {
			while(rs2.next())
			{
				count = rs2.getInt(1);
				
				for(int i=1;i<count+1;i++)
				{
				String sql = "select movieday,watchingtime, moviename, watchingplace,seatnumber  from result where username = '"+userid+"'";
				ResultSet rs = dc.executeQuery(sql);
				
			try {
				while(rs.next())
				{
					
					if(rs.getRow()==i)
					{
						day = rs.getString("movieday"); time = rs.getString("watchingtime"); name = rs.getString("moviename");
						place = rs.getString("watchingplace"); seatnumber = rs.getString("seatnumber");
						info[i-1] = new JLabel(i+". "+day+" "+time+" "+name+" "+place+" "+seatnumber+"열");
					}
	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			}
 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		new search_Frame("인하공전 영화예매시스템",2,"201645032");
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if(obj == btnback)
		{
			new selectMovie_Frame("인하공전 영화예매시스템",custid,userid);
			setVisible(false);
		}
		
	}
}
