package com.study.hrms.common;
import java.util.List;

/**
 * 用于封装接口返回结果的通用格式,包括状态码,消息和数据
 */
public class CommonResult {

    public int code;//状态码
    public String msg;
    public Object data;

    /**
     * 不同参数的构造函数
     */
    public CommonResult(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public CommonResult(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public CommonResult() {
    }

    /**
     * 静态方法,创建对象并返回结果的通用格式
     */
    public static <T extends Object> CommonResult success(List<T> list){
        CommonResult commonResult = new CommonResult();
        commonResult.setCode(CommonCode.SUCCESS);
        commonResult.setData(list);
        return commonResult;
    }

    public static <T extends Object> CommonResult success(Object data){
        CommonResult commonResult = new CommonResult();
        commonResult.setCode(CommonCode.SUCCESS);
        commonResult.setData(data);
        return commonResult;
    }
    public static <T extends Object> CommonResult success(){
        CommonResult commonResult = new CommonResult();
        commonResult.setCode(CommonCode.SUCCESS);
        return commonResult;
    }
    public static CommonResult fail(String msg){
        CommonResult commonResult = new CommonResult();
        commonResult.setCode(CommonCode.SUCCESS);
        commonResult.setMsg(msg);
        return commonResult;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
