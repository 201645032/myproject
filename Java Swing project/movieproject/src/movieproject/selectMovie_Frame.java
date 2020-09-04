package movieproject;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;

import java.*;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;

public class selectMovie_Frame extends JFrame implements ActionListener{
	int movienum = 0;
	int custid = 0;
	DB_Conn dc = new DB_Conn();
	ImageIcon icon = new ImageIcon("img/background.jpg");
	ImageIcon girl = new ImageIcon("img/girl.jpg");
	ImageIcon r_girl = new ImageIcon("img/girl_on.jpg");
	ImageIcon avg = new ImageIcon("img/avg.jpg");
	ImageIcon r_avg = new ImageIcon("img/avg_on.jpg");
	ImageIcon bug = new ImageIcon("img/bug.jpg");
	ImageIcon r_bug = new ImageIcon("img/bug_on.jpg");
	ImageIcon bad = new ImageIcon("img/bad.jpg");
	ImageIcon r_bad = new ImageIcon("img/bad_on.jpg");
	ImageIcon logout = new ImageIcon("img/logout.png");
	ImageIcon r_logout = new ImageIcon("img/logout_on.png");
	ImageIcon list = new ImageIcon("img/list.png");
	ImageIcon r_list = new ImageIcon("img/lsit_on.png");
	
	
	JButton btngirl;
	JButton btnavg;
	JButton btnbug;
	JButton btnbad;
	JButton btnlogout;
	JButton btnlist;
	String userid;
	
	
	public selectMovie_Frame(String title, int custnum,String id)
	{	userid = id;
		custid = custnum;
		setTitle(title);
		setSize(815,640);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 전체 페이지를 끄게 하므로 필요한 페이지에만 쓰자
		setLocationRelativeTo(null);
		System.out.println("주문번호 :" + custid);
		
		JPanel panel = new JPanel() {
			public void paintComponent(Graphics g)
			{	g.drawImage(icon.getImage(), 0,0,null);
				setOpaque(false);
				super.paintComponent(g);			
			}
			
		
	};
	
	panel.setLayout(null);
	
	btngirl = new JButton(girl);
	btngirl.setRolloverIcon(r_girl);
	btngirl.setBorderPainted(false);
	btngirl.setFocusPainted(false);
	btngirl.setContentAreaFilled(false);
	
	btngirl.setLocation(11,89);
	btngirl.setSize(174,245);
	
	btnbug = new JButton(bug);
	btnbug.setRolloverIcon(r_bug);
	btnbug.setBorderPainted(false);
	btnbug.setFocusPainted(false);
	btnbug.setContentAreaFilled(false);

	btnbug.setLocation(395,90);
	btnbug.setSize(174,245);
	
	
	btnbad = new JButton(bad);
	btnbad.setRolloverIcon(r_bad);
	btnbad.setBorderPainted(false);
	btnbad.setFocusPainted(false);
	btnbad.setContentAreaFilled(false);

	btnbad.setLocation(11,342);
	btnbad.setSize(174,245);
	
	btnavg = new JButton(avg);
	btnavg.setRolloverIcon(r_avg);
	btnavg.setBorderPainted(false);
	btnavg.setFocusPainted(false);
	btnavg.setContentAreaFilled(false);

	btnavg.setLocation(394,342);
	btnavg.setSize(176,247);
	
	btngirl.addActionListener(this);
	btnbug.addActionListener(this);
	btnbad.addActionListener(this);
	btnavg.addActionListener(this);
	
	btnlogout = new JButton(logout);
	btnlogout.setRolloverIcon(r_logout);
	btnlogout.setBorderPainted(false);
	btnlogout.setFocusPainted(false);
	btnlogout.setContentAreaFilled(false);
	
	btnlogout.setLocation(670,0);
	btnlogout.setSize(btnlogout.getPreferredSize());
	btnlogout.addActionListener(this);
	
	btnlist = new JButton(list);
	btnlist.setRolloverIcon(r_list);
	btnlist.setBorderPainted(false);
	btnlist.setFocusPainted(false);
	btnlist.setContentAreaFilled(false);
	
	btnlist.setLocation(0,8);
	btnlist.setSize(btnlist.getPreferredSize());
	btnlist.addActionListener(this);

	
	panel.add(btngirl);
	panel.add(btnavg);
	panel.add(btnbug);
	panel.add(btnbad);
	panel.add(btnlogout);
	panel.add(btnlist);
	JScrollPane j = new JScrollPane(panel);
	setContentPane(j);
	setVisible(true);

		
	}


	public static void main(String[] args) {
		new selectMovie_Frame("인하공전 영화예매시스템",1,"201645032");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if (obj == btngirl)
		{
			new movieinfo_Frame("인하공전 영화예매시스템", 1,userid);
			setVisible(false);
		}
		else if (obj == btnbug)
		{
			new movieinfo_Frame("인하공전 영화예매시스템", 2,userid);
			setVisible(false);
		}
		else if (obj == btnbad)
		{
			new movieinfo_Frame("인하공전 영화예매시스템", 3,userid);
			setVisible(false);
		}
		else if (obj == btnavg)
		{
			new movieinfo_Frame("인하공전 영화예매시스템", 4,userid);
			setVisible(false);
		}
		else if (obj == btnlogout)
		{
			int result = JOptionPane.showConfirmDialog(null, "로그아웃 하시겠습니까?", "Confirm", JOptionPane.YES_NO_OPTION);
			if(result == JOptionPane.YES_OPTION)
			{	
			String sql = "select moviename from result where custid = '"+custid+"'";
			ResultSet rs = dc.executeQuery(sql);
			try {
				while(rs.next())
				{
					String think = rs.getString(1);
					if(think ==null) 
					{
						String sql2 = "delete from result where custid = '"+custid+"'";
						dc.executeUpdate(sql2);
						new LoginFrame("인하공전 영화예매시스템");
						setVisible(false);
						JOptionPane.showMessageDialog(this, "로그아웃 되었습니다.");
					}
					else 
					{	
						new LoginFrame("인하공전 영화예매시스템");
						setVisible(false);
						JOptionPane.showMessageDialog(this, "로그아웃 되었습니다.");
					}
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		 }
			
		}
		else if(obj == btnlist)
		{
			new search_Frame("인하공전 영화예매시스템", custid, userid);
			setVisible(false);
		}
	}
}
