package mgr;

import java.util.Random;

public class MailSend {
	public boolean sendPwd(String userId, String userEmail) {//������ 10�� ���ڸ� �����Ͽ� �н����带 �����ϰ� ���Ϸ� ������
		boolean flag=false;
		UserMgr mgr=new UserMgr();
		String pwd=mgr.findPwd(userId, userEmail);
		StringBuffer tempPwd=new StringBuffer();
		Random rnd=new Random();
		for(int i=0; i<10; i++) {
			int rIndex=rnd.nextInt(3);
			switch(rIndex) {
			case 0:
				tempPwd.append((char)((int)(rnd.nextInt(26))+97));
				break;
			case 1:
				tempPwd.append((char)((int)(rnd.nextInt(26))+65));
				break;
			case 2:
				tempPwd.append(rnd.nextInt(10));
				break;
			}
		}
		if(pwd!=null&&!pwd.contentEquals("")) {
			mgr.changePwd(userId, tempPwd.toString());
			String title="����Ŀ���Ϳ��� �ӽ� �н����带 �����մϴ�.";
			String content="�ӽ� �н����� : "+tempPwd;
			MailSendMgr.send(title,content,userEmail);
			flag=true;
		}
		return flag;
	}

}
