package net.chinaott.cms.core.common.base;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Page<T> implements Serializable {

    private int currentPage;
    private int numPerPage;
    private int totalCount;
    private int totalPage;
    private List<T> rows;

    public Page() {
        totalCount = 0;
        totalPage = 1;
        currentPage = 1;
        rows = Collections.emptyList();
    }

    public Page instanceByPageNo(List<T> data, int total, int currentPage, int pageSize) {
        this.numPerPage = pageSize;
        this.totalCount = total;
        this.currentPage = currentPage;
        if (data != null){
            rows = data;
        }

        int k = total % pageSize;
        if (k == 0){
            this.totalPage = total / pageSize;
        } else {
            this.totalPage = total / pageSize + 1;
        }

        return this;
    }

    public Page instanceByStartRow(List<T> data, int total, int startRow, int offset) {
        if (offset != 0) {
            currentPage = startRow / offset + 1;
            numPerPage = offset;
            totalPage = total / offset + 1;
        } else {
            currentPage = 1;
            numPerPage = total;
            totalPage = 1;
        }
        if (data != null){
            rows = data;
        }
        this.totalCount = total;
        return this;
    }

    public int getStartRow() {
        return (currentPage - 1) * numPerPage;
    }

    public int getOffset() {
        return numPerPage;
    }

    public int getNumPerPage() {
        return numPerPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public int getPageNumber() {
        return currentPage;
    }

    public List<T> getData() {
        return rows;
    }

    public List<T> getRows() {
        return rows;
    }

    public List<Integer> getShow(){
        List<Integer> show = new ArrayList<Integer>();
        if (this.getTotalPage() <= 5){
            for (int i = 1; i <=this.getTotalPage(); i++ ){
                show.add(i);
            }
        } else {
            int l = 2;
            int r = 2;
            if (this.getCurrentPage() == 1){
                l = 0;
                r = 4;
            } else if(this.getCurrentPage() == 2){
                l =1;
                r = 3;
            } else if(this.getCurrentPage() == this.getTotalPage()){
                l =4;
                r = 0;
            } else if(this.getCurrentPage() == this.getTotalPage() - 1){
                l =3;
                r = 1;
            }
            for (int i = this.getCurrentPage() - l; i <= this.getCurrentPage() + r; i++ ){
                show.add(i);
            }

        }
        return  show;
    }
}

