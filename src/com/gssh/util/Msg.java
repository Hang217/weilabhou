package com.gssh.util;
/**
 * 消息对象
 * @author thinkpad
 *
 * @param <T>
 */
public class Msg<T> {
	/**
	 * 消息状态  0：错误   1：成功
	 */
	private int msgstatus;
	/**
	 * 消息内容 :消息提示内容
	 */
	private String msg;
	/**
	 * 数据信息，泛型数据类型
	 */
	private T data;

	public int getMsgstatus() {
		return msgstatus;
	}

	public void setMsgstatus(int msgstatus) {
		this.msgstatus = msgstatus;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
