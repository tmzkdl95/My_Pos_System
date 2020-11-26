package com.mycompany.vo;

import java.util.Date;
public class MgtGoodsCal_insert_VO {

	String goods_b_cd;
	String goods_cd;
	String goods_nm;
	String goods_sale_req;
	int goods_pri;
	int goods_qty;
	int goods_sale_qty;
	Date sale_date;
	String sale_status;
	String goods_reg_user_id;
	Date goods_reg_tm;
	
	
	public String getGoods_b_cd() {
		return goods_b_cd;
	}
	public void setGoods_b_cd(String goods_b_cd) {
		this.goods_b_cd = goods_b_cd;
	}
	public String getGoods_cd() {
		return goods_cd;
	}
	public void setGoods_cd(String goods_cd) {
		this.goods_cd = goods_cd;
	}
	public String getGoods_nm() {
		return goods_nm;
	}
	public void setGoods_nm(String goods_nm) {
		this.goods_nm = goods_nm;
	}
	public String getGoods_sale_req() {
		return goods_sale_req;
	}
	public void setGoods_sale_req(String goods_sale_req) {
		this.goods_sale_req = goods_sale_req;
	}
	public int getGoods_pri() {
		return goods_pri;
	}
	public void setGoods_pri(int goods_pri) {
		this.goods_pri = goods_pri;
	}
	public int getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
	}
	public int getGoods_sale_qty() {
		return goods_sale_qty;
	}
	public void setGoods_sale_qty(int goods_sale_qty) {
		this.goods_sale_qty = goods_sale_qty;
	}
	public Date getSale_date() {
		return sale_date;
	}
	public void setSale_date(Date sale_date) {
		this.sale_date = sale_date;
	}
	public String getSale_status() {
		return sale_status;
	}
	public void setSale_status(String sale_status) {
		this.sale_status = sale_status;
	}
	public String getGoods_reg_user_id() {
		return goods_reg_user_id;
	}
	public void setGoods_reg_user_id(String goods_reg_user_id) {
		this.goods_reg_user_id = goods_reg_user_id;
	}
	public Date getGoods_reg_tm() {
		return goods_reg_tm;
	}
	public void setGoods_reg_tm(Date goods_reg_tm) {
		this.goods_reg_tm = goods_reg_tm;
	}
	
	@Override
	public String toString() {
		return "MgtGoodsCal_insert_VO [goods_b_cd=" + goods_b_cd + ", goods_cd=" + goods_cd + ", goods_nm=" + goods_nm
				+ ", goods_sale_req=" + goods_sale_req + ", goods_pri=" + goods_pri + ", goods_qty=" + goods_qty
				+ ", goods_sale_qty=" + goods_sale_qty + ", sale_date=" + sale_date + ", sale_status=" + sale_status
				+ ", goods_reg_user_id=" + goods_reg_user_id + ", goods_reg_tm=" + goods_reg_tm + "]";
	}
	
}

