package com.study.hrms.common;

import java.util.List;

/**
 * 结果分页
 */
public class PageCommonResult extends CommonResult{

    //每页数量
    private int limit=10;

    //当前页面
    private int page=1;

    //总条数
    private long count;

    //分页返回结果封装类
    public static <T extends Object> PageCommonResult success(List<T> data,long count){
        PageCommonResult pageCommonResult = new PageCommonResult();
        pageCommonResult.setCount(count);//设置总条数
        pageCommonResult.setCode(CommonCode.SUCCESS);//设置状态码
        pageCommonResult.setData(data);//设置返回数据列表
        return pageCommonResult;
    }

    public PageCommonResult() {
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
