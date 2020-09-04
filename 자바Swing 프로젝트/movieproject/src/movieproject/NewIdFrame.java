package movieproject;


import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.text.JTextComponent;

import movieproject.DB_Conn;

public class NewIdFrame extends JFrame implements ActionListener{
	private JButton login;
	private JButton findid;
	private JButton newid;
	private JTextField nametf;
	private JTextField idtf;
	private JPasswordField pwtf;
	private JTextField calltf;
	private JButton okbtn;
	private JButton idbtn;
	private int chk = 1;
	private int chk2 = 1;

	public NewIdFrame(String title) {
		setTitle(title);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setSize(430,200);
		setLocationRelativeTo(null);
		setLayout(new FlowLayout());
		
		JPanel pn1 = new JPanel();
		pn1.setLayout(new GridLayout(4,0));
		
		JLabel namelb = new JLabel("이름 : ");
		namelb.setOpaque(true);
		namelb.setBackground(Color.BLUE);
		namelb.setForeground(Color.WHITE);
		
		JLabel idlb = new JLabel("ID(학번) : ");
		idlb.setOpaque(true);
		idlb.setBackground(Color.BLUE);
		idlb.setForeground(Color.WHITE);
		
		JLabel pwlb = new JLabel("비밀번호 : ");
		pwlb.setOpaque(true);
		pwlb.setBackground(Color.BLUE);
		pwlb.setForeground(Color.WHITE);
		
		JLabel calllb = new JLabel("전화번호 : ");
		calllb.setOpaque(true);
		calllb.setBackground(Color.BLUE);
		calllb.setForeground(Color.WHITE);
		
		JPanel pn2 = new JPanel();
		pn2.setLayout(new GridLayout(4,0));
		
		nametf = new JTextField(20);
		idtf = new JTextField(20);
		pwtf = new JPasswordField(20);
		calltf = new JTextField(20);
		
		JPanel pn3 = new JPanel();
		pn3.setLayout(new GridLayout(4,0));
		
		JLabel lb = new JLabel();
		idbtn = new JButton("중복 확인");
		idbtn.addActionListener(this);
		JLabel lb2 = new JLabel("숫자,문자 포함 4 이상");
		JLabel lb3 = new JLabel();
		
		
		
		pn1.add(namelb);
		pn1.add(idlb);
		pn1.add(pwlb);
		pn1.add(calllb);
		
		pn2.add(nametf);
		pn2.add(idtf);
		pn2.add(pwtf);
		pn2.add(calltf);
		
		pn3.add(lb);
		pn3.add(idbtn);
		pn3.add(lb2);
		pn3.add(lb3);
		
		okbtn = new JButton("회원 가입");
		okbtn.addActionListener(this);
		JPanel pn4 = new JPanel();
		pn4.setLayout(new BorderLayout());
		
		pn4.add(pn1,BorderLayout.WEST);
		pn4.add(pn2,BorderLayout.CENTER);
		pn4.add(pn3,BorderLayout.EAST);
		
		add(pn4);
		add(okbtn);
		
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new NewIdFrame("회원가입");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		
		Object obj = e.getSource();
		DB_Conn dc = new DB_Conn();
		if(obj == okbtn) {
			chk2 = 0;
			String username = nametf.getText();
			String userpw = pwtf.getText();
			String usercall = calltf.getText();
			
			if(username.equals("") || userpw.equals("") || usercall.equals("")) {
					chk2 = 1;
			}
			
			if(chk == 0 && chk2 == 0) {
			String sql = "insert into movieuser(name, id, pw, call)" + " values('"+nametf.getText() 
							+"', '"+idtf.getText() +"', '"+pwtf.getText()+"', '"+calltf.getText() +"')";
			System.out.println(sql);
			dc.executeUpdate(sql);
			new LoginFrame("인하공전 영화예매시스템");
			this.setVisible(false);
			}
			else if(chk == 1){
				JOptionPane.showMessageDialog(null, "중복확인을 해주세요!");
			}
			else if(chk == 0 && chk2 == 1) {
				JOptionPane.showMessageDialog(null, "이름 ,비밀번호,전화번호가 입력되었는지 확인해주세요!");
			}
		}
		else if(obj == idbtn) {
			if(idtf.getText().equals("")) {
				JOptionPane.showMessageDialog(null, "아이디를 입력해주세요.");
			}else {
				chk = 0;
				String sql = "SELECT * FROM movieuser WHERE id=" + idtf.getText();
				System.out.println(sql);
				ResultSet rs = dc.executeQuery(sql);
			 
			 	try {
						if(rs.next())
						{
							String userid = rs.getString("id");
							if(idtf.getText().equals(userid))
							{
								chk = 1;
							}
						}
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			 	if(chk == 1) {
				 	JOptionPane.showMessageDialog(null, "아이디가 중복입니다!");
			 	}
			 	else{
				 	JOptionPane.showMessageDialog(null, "아이디가 사용가능!");
			 	}
			}
		}
	}
	

}
