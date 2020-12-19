package com.mycompany.service.cmCdService;

import java.util.List;

import com.mycompany.vo.CmCd_VO;

public interface CmCdService {
	// select 
	public List<CmCd_VO> retrieve_CmCd_SelectBox();
	
	// update last_cm_cd
	public void update_LastCmCd(CmCd_VO CmCd_VO);
	
	
}
