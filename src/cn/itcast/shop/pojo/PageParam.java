package cn.itcast.shop.pojo;

public class PageParam {
	private int totalCount;// �ܼ�¼��
	private Integer totalPage;// ��ҳ��
	private Integer pageSize;// ҳ���С
	private Integer current;// ��ǰ�ڼ�ҳ
	private Integer queryPage;// Ҫ��ѯҳ��
	private int offset;//��ҳ�ڼ�����ʼ
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getCurrent() {
		return current;
	}

	public void setCurrent(Integer current) {
		this.current = current;
	}

	public Integer getQueryPage() {
		return queryPage;
	}

	public void setQueryPage(Integer queryPage) {
		this.queryPage = queryPage;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}
	
}
