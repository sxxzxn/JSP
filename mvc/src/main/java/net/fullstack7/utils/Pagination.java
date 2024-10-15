package net.fullstack7.utils;

public class Pagination {
    private int totalPosts;     // 총 게시글 수
    private int pageNo;         // 현재 페이지
    private int pageSize;       // 한 페이지에 보여질 게시글 수
    private int totalPages;     // 총 페이지 수
    private int startPage;      // 시작 페이지
    private int endPage;        // 끝 페이지

    public Pagination(int totalPosts, int pageNo, int pageSize) {
        this.totalPosts = totalPosts;
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.totalPages = (int) Math.ceil((double) totalPosts / pageSize);

        // 페이지 범위 설정 (현재 페이지를 기준으로 -5 ~ +4 페이지 보여주기)
        this.startPage = Math.max(1, pageNo - 5);
        this.endPage = Math.min(totalPages, startPage + 9);
    }

    public int getTotalPosts() {
        return totalPosts;
    }

    public int getPageNo() {
        return pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public boolean hasPrev() {
        return pageNo > 6;
    }

    public boolean hasNext() {
        return pageNo < totalPages - 4;
    }

    public boolean hasFirst() {
        return pageNo > 6;
    }

    public boolean hasLast() {
        return pageNo < totalPages - 1;
    }
}
