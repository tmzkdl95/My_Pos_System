package com.mycompany.vo;

public class testPage {
	String id;
	String user_name;
	String content;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "testPage [id=" + id + ", user_name=" + user_name + ", context=" + content + "]";
	}

}
