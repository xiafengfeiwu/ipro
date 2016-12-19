package com.pro.model;

public class RequestPage {
	private String searchWord;
	private String field;
	private String order;
	private Integer page;
	private Integer length;

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Integer getPage() {
		if (this.page == null) {
			this.page = 1;
		}
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getLength() {
		if (this.length == null) {
			this.length = 20;
		}
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

}
