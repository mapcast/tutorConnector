package bean;

public class QNABean {
	private int inqNum; //���� ��ȣ
	private int fromNum; //������(ȸ��������ȣ)
	private String inqTitle; //��������
	private String inqContent; //���ǳ���
	private String inqDate; //��������
	private int pos; //����� ���°����
	private int ref; //����� �� ��
	private int depth;//����� ���
	private String secret; // ��б�0,1
	private String filename; //÷������ �̸�
	
	
	
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getInqContent() {
		return inqContent;
	}
	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}
	public int getInqNum() {
		return inqNum;
	}
	public void setInqNum(int inqNum) {
		this.inqNum = inqNum;
	}
	public int getFromNum() {
		return fromNum;
	}
	public void setFromNum(int fromNum) {
		this.fromNum = fromNum;
	}
	public String getInqTitle() {
		return inqTitle;
	}
	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}
	public String getInqDate() {
		return inqDate;
	}
	public void setInqDate(String inqDate) {
		this.inqDate = inqDate;
	}
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}
