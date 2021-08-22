package com.mycompany.vo;

import java.util.Date;
public class MgtGoodsCalVO {

	String goods_b_cd;
	String goods_cd;
	String goods_nm;
	int goods_price;
	int goods_qty;
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
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
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
		return "MgtGoodsCalVO [goods_b_cd=" + goods_b_cd + ", goods_cd=" + goods_cd + ", goods_nm=" + goods_nm
				+ ", goods_price=" + goods_price + ", goods_qty=" + goods_qty + ", goods_reg_user_id=" + goods_reg_user_id
				+ ", goods_reg_tm=" + goods_reg_tm + "]";
	}

}

