package cn.hlj.crm.orm;

import java.util.List;

public class Page<T> {

	private int pageNo;
	private int pageSize = 2;

	private long totalElements;
	private List<T> content;

	public void setPageNo(int pageNo) {
		if (pageNo < 1) {
			pageNo = 1;
		}
		this.pageNo = pageNo;
	}

	public int getPageNo() {
		if (pageNo > getTotalPages()) {
			pageNo = getTotalPages();
		}

		return pageNo;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public long getTotalElements() {
		return totalElements;
	}

	public void setTotalElements(long totalElements) {
		this.totalElements = totalElements;
	}

	public List<T> getContent() {
		return content;
	}

	public void setContent(List<T> content) {
		this.content = content;
	}

	public int getTotalPages() {
		long totalPages = totalElements / pageSize;

		if (totalElements % pageSize != 0) {
			totalPages++;
		}

		return (int) totalPages;
	}

	public boolean isHasNext() {
		return pageNo < getTotalPages();
	}

	public boolean isHasPrev() {
		return pageNo > 1;
	}

	public int getNext() {
		if (isHasNext()) {
			return pageNo + 1;
		}

		return getTotalPages();
	}

	public int getPrev() {
		if (isHasPrev()) {
			return pageNo - 1;
		}

		return 1;
	}
}
