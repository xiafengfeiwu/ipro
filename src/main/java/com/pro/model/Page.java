package com.pro.model;

public class Page {
	private int start;
	private int length;

	public Page() {
		super();
	}

	public Page(int page, int length) {
		super();
		this.start = (page - 1) * length;
		this.length = length;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

}
