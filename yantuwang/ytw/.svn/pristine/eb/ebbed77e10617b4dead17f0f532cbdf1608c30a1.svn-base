package com.mtecc.rdc.util;

public class PaginationUtil {
	private int num;
	private int size;
	private int rowCount;
	private int pageCount; 
	private int startRow;
	private int first = 1;
	private int last;
	private int next;
	private int prev;
	private int start;
	private int end;
	private int numCount = 10;

	public PaginationUtil(int size, String str_num, int rowCount) {

		int num = 1;
		if (str_num != null) {
			try {
				num = Integer.parseInt(str_num);
			} catch (Exception e) {
				num = 1;
			}
		}
		this.num = num;
		this.size = size;
		this.rowCount = rowCount;
		this.pageCount = (int) Math.ceil((double) rowCount / size);

		this.num = Math.min(this.num, pageCount);
		this.num = Math.max(1, this.num);

		this.startRow = (this.num - 1) * size;
		this.last = this.pageCount;
		this.next = Math.min(this.pageCount, this.num + 1);
		this.prev = Math.max(1, this.num - 1);

		start = Math.max(this.num - numCount / 2, first);
		end = Math.min(start + numCount, last);
		if (end - start < numCount) {
			start = Math.max(end - numCount, 1);
		}
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getNumCount() {
		return numCount;
	}

	public void setNumCount(int numCount) {
		this.numCount = numCount;
	}

}

