package cn.itcast.shop.pojo;

public class PageParam {
	private int totalCount;// 总记录数
	private Integer totalPage;// 总页码
	private Integer pageSize;// 页面大小
	private Integer current;// 当前第几页
	private Integer queryPage;// 要查询页面
	private int offset;//分页第几条开始
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
