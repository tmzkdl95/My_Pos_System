package com.mycompany.dao.CmCdDAO;

import java.util.List;

import com.mycompany.vo.CmCd_VO;
import com.mycompany.vo.MgtGoodsRegVO;

public interface CmCdDAO {
	
	//retrieve
	public List<CmCd_VO> getRetrieve_CmCd(CmCd_VO CmCd_VO);
	
	//update last_cm_cd
	public void update_LastCmCd(CmCd_VO CmCd_VO);

}
