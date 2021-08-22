package com.mycompany.vo;

import java.util.Date;
public class MgtGoodsCal_insert_VO {

	String ord_no;
	String goods_row;
	String goods_b_cd;
	String goods_cd;
	String goods_nm;
	String goods_sale_req;
	int goods_price;
	int goods_qty;
	int goods_sale_qty;
	int goods_total_price;
	String sale_date;
	String sale_status;
	String goods_reg_user_id;
	Date goods_reg_tm;
	
	public String getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(String ord_no) {
		this.ord_no = ord_no;
	}
	
	public String goods_row() {
		return goods_row;
	}
	public void goods_row(String goods_row) {
		this.goods_row = goods_row;
	}
	
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
	public int getGoods_sale_qty() {
		return goods_sale_qty;
	}
	public void setGoods_sale_qty(int goods_sale_qty) {
		this.goods_sale_qty = goods_sale_qty;
	}
	public String getSale_date() {
		return sale_date;
	}
	public int getGoods_total_price() {
		return goods_total_price;
	}
	public void setGoods_total_price(int goods_total_price) {
		this.goods_total_price = goods_total_price;
	}
	public void setSale_date(String sale_date) {
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
		return "MgtGoodsCal_insert_VO [ord_no=" + ord_no + ", goods_row=" + goods_row + ", goods_b_cd=" + goods_b_cd + ", goods_cd=" + goods_cd
				+ ", goods_nm=" + goods_nm + ", goods_sale_req=" + goods_sale_req + ", goods_price=" + goods_price
				+ ", goods_qty=" + goods_qty + ", goods_sale_qty=" + goods_sale_qty + ", goods_total_price="
				+ goods_total_price + ", sale_date=" + sale_date + ", sale_status=" + sale_status + ", goods_reg_user_id="
				+ goods_reg_user_id + ", goods_reg_tm=" + goods_reg_tm + "]";
	}
	
}

