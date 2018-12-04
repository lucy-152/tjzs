package com.zs.pms.vo;

public class QueryPage {
	protected int start;//起始数，可以继承
	protected int end;//截止数
	protected int page;//当前页
	
	public int getStart() {
		//(当前页-1)*每页条数+1
		return (page-1)* Constants.PAGECOUNT+1;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		//当前页*每页条数
		return page*Constants.PAGECOUNT;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	
}
