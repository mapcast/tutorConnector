package bean;

public class ReviewBean {
	private int num; //��ȣ
	private int fromNum; //�������
	private int toNum; //�޴»��
	private int reviewAvailable; //��������
	private String reviewContent; //���� ����
	private int reviewRate; //���� ����
	private String ip; //ip����
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getFromNum() {
		return fromNum;
	}
	public void setFromNum(int fromNum) {
		this.fromNum = fromNum;
	}
	public int getToNum() {
		return toNum;
	}
	public void setToNum(int toNum) {
		this.toNum = toNum;
	}
	public int getReviewAvailable() {
		return reviewAvailable;
	}
	public void setReviewAvailable(int reviewAvailable) {
		this.reviewAvailable = reviewAvailable;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewRate() {
		return reviewRate;
	}
	public void setReviewRate(int reviewRate) {
		this.reviewRate = reviewRate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	

}
