package com.mycompany.vo;

import java.util.Date;
public class CmCd_VO {
	
	String cm_cd;
	String cm_nm;
	String cm_full_cd;
	String cm_typ;
	String last_cm_cd;


	public String getCm_cd() {
		return cm_cd;
	}
	public void setCm_cd(String cm_cd) {
		this.cm_cd = cm_cd;
	}
	public String getCm_nm() {
		return cm_nm;
	}
	public void setCm_nm(String cm_nm) {
		this.cm_nm = cm_nm;
	}
	public String getCm_full_cd() {
		return cm_full_cd;
	}
	public void setCm_full_cd(String cm_full_cd) {
		this.cm_full_cd = cm_full_cd;
	}
	public String getCm_typ() {
		return cm_typ;
	}
	public void setCm_typ(String cm_typ) {
		this.cm_typ = cm_typ;
	}
	public String getLast_cm_cd() {
		return last_cm_cd;
	}
	public void setLast_cm_cd(String last_cm_cd) {
		this.last_cm_cd = last_cm_cd;
	}
	
	@Override
	public String toString() {
		return "CmCd_VO [cm_cd=" + cm_cd + ", cm_nm=" + cm_nm + ", cm_full_cd=" + cm_full_cd + ", cm_typ=" + cm_typ
				+ ", last_cm_cd=" + last_cm_cd + "]";
	}
		

}

