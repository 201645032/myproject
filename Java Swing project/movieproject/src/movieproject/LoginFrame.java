package movieproject;

import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.AbstractButton;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.text.JTextComponent;

import movieproject.NewIdFrame;


public class LoginFrame extends JFrame implements ActionListener{
	private JButton login;
	private JButton findid;
	private JButton newid;
	private JTextField id;
	private JPasswordField pw;
	private int custidcount;
	

	public LoginFrame(String title) {
		setTitle(title);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setSize(400,243);
		setLocationRelativeTo(null);
		JPanel pn1 = new JPanel();
		pn1.setLayout(null);
		pn1.setBounds(0,0,400,500);
		
		
		
		
		JLabel idlbl = new JLabel("  id  :   ");
		idlbl.setOpaque(true);
		idlbl.setBackground(Color.GRAY);
		idlbl.setForeground(Color.WHITE);
		idlbl.setHorizontalAlignment(idlbl.CENTER);
		idlbl.setBounds(50, 20, 70, 40);
		
		
		id = new JTextField(15);
		id.setBounds(130, 20, 200, 40);
		
		JLabel pwlbl = new JLabel("  pw  :   ");
		pwlbl.setOpaque(true);
		pwlbl.setBackground(Color.GRAY);
		pwlbl.setForeground(Color.WHITE);
		pwlbl.setHorizontalAlignment(pwlbl.CENTER);
		pwlbl.setBounds(50, 70, 70, 40);
		
		pw = new JPasswordField(15);
		pw.setBounds(130, 70, 200, 40);
		
//		id.setMargin(new Insets(10,10,10,10));
//		pw.setMargin(new Insets(10,10,10,10));
		
		login = new JButton("로그인");
		login.setBounds(50 , 125 , 280 , 30);
		login.addActionListener(this);
		newid = new JButton("회원가입");
		newid.setBounds(50, 160, 130, 20);
		newid.addActionListener(this);
		findid = new JButton("아이디 찾기");
		findid.setBounds(200, 160, 130, 20);
		findid.addActionListener(this);
		
		
		pn1.add(idlbl);
		pn1.add(id);
		pn1.add(pwlbl);
		pn1.add(pw);
		pn1.add(login);
		pn1.add(newid);
		pn1.add(findid);
		
		
		
		add(pn1);
		
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new LoginFrame("인하공전 영화예매시스템");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		DB_Conn dc = new DB_Conn();
		if(obj == login) {
			String sql = "select * from movieuser where id ='"+id.getText()+"' and pw = '"+pw.getText()+"'";
			System.out.println(sql);
			ResultSet rs = dc.executeQuery(sql);
			try {
				if(rs.next())
				{
					String userid = rs.getString("id");
					String userpw = rs.getString("pw");
					System.out.println(userid+userpw);
					if(id.getText().equals(userid)&&pw.getText().equals(userpw))
					{
						String sql2 = "select count(custid) from result";
						ResultSet rs3 = dc.executeQuery(sql2);
						try {
							while(rs3.next())
							{
								custidcount = rs3.getInt(1);
								custidcount++;
								String sql3 = "insert into result(custid, username) values("+custidcount+", '"+userid+"')";
								dc.executeUpdate(sql3);
							}
							
						} catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
						new selectMovie_Frame("인하공전 영화예매시스템",custidcount++, userid); // 다음화면 넘어가는 자리
						this.setVisible(false);
					}
				}
				else
				{
					JOptionPane.showMessageDialog(null, "로그인 실패! 아이디 혹은 비밀번호를 확인해주세요!");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("오류");
			}
			
		}
		else if(obj == newid) {
			new NewIdFrame("회원가입");
			this.setVisible(false);
		}
		else if(obj == findid) {
			new FindIdFrame("아이디 찾기");
			this.setVisible(false);
		}
	}
}
