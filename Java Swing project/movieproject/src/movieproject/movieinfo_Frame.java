package movieproject;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
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
public class movieinfo_Frame extends JFrame implements ActionListener{
	int movienum;
	DB_Conn dc = new DB_Conn();
	int custidcount = 0;
	JButton btnback;
	JButton btnselect;
	ImageIcon icon = new ImageIcon("img/girlinfo.jpg");
	ImageIcon icon1 = new ImageIcon("img/buginfo.jpg");
	ImageIcon icon2 = new ImageIcon("img/badinfo.jpg");
	ImageIcon icon3 = new ImageIcon("img/avginfo.jpg");
	ImageIcon back = new ImageIcon("img/back.png");
	ImageIcon back_on = new ImageIcon("img/back_on.png");
	ImageIcon select = new ImageIcon("img/select.png");
	ImageIcon select_on = new ImageIcon("img/select_on.png");
	String userid;
	public movieinfo_Frame(String title, int num,String id)
	{	String sql2 = "select count(custid) from result";
	ResultSet rs3 = dc.executeQuery(sql2);
	try {
		while(rs3.next())
		{
			custidcount = rs3.getInt(1);
			
		}
		
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
		setTitle(title);
		setSize(815,640);
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
	
	btnback.setLocation(20,550);
	btnback.setSize(btnback.getPreferredSize());
	
	btnselect = new JButton(select);
	btnselect.setRolloverIcon(select_on);
	btnselect.setBorderPainted(false);
	btnselect.setFocusPainted(false);
	btnselect.setContentAreaFilled(false);
	
	btnselect.setLocation(610,530);
	btnselect.setSize(btnselect.getPreferredSize());
	
	btnback.addActionListener(this);
	btnselect.addActionListener(this);

	panel.add(btnback);
	panel.add(btnselect);
	JScrollPane j = new JScrollPane(panel);
	setContentPane(j);
	setVisible(true);
};
	public static void main(String[] args) {
		new movieinfo_Frame("인하공전 영화예매시스템",0,"201645032");
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if(obj == btnback)
		{
			new selectMovie_Frame("인하공전 영화예매시스템",custidcount,userid);
			setVisible(false);
		}
		else if(obj == btnselect)
		{
			switch(movienum)
			{
			case 1:
				new moviebuy_Frame("인하공전 영화예매시스템",1,userid);
				setVisible(false);
				break;
			case 2:
				new moviebuy_Frame("인하공전 영화예매시스템",2,userid);
				setVisible(false);
				break;
			case 3:
				new moviebuy_Frame("인하공전 영화예매시스템",3,userid);
				setVisible(false);
				break;
			case 4:
				new moviebuy_Frame("인하공전 영화예매시스템",4,userid);
				setVisible(false);
				break;
			}
		}
		
	}

}