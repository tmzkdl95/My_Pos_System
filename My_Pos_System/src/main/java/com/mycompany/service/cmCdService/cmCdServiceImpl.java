package com.mycompany.service.cmCdService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.dao.CmCdDAO.CmCdDAO;
import com.mycompany.vo.CmCd_VO;

@Service
public class cmCdServiceImpl implements CmCdService{

	@Inject
	CmCdDAO cmCdDAO;
	
	@Override
	//retrieve Box Code
	public List<CmCd_VO> retrieve_CmCd_SelectBox() {
		CmCd_VO CmCd_VO = new CmCd_VO();
		CmCd_VO.setCm_typ("CODENAME");
		
		List<CmCd_VO> ret_CmCd = cmCdDAO.getRetrieve_CmCd(CmCd_VO);
		
		return ret_CmCd;
	}
	
	//update last_cm_cd
	@Override
	public void update_LastCmCd(CmCd_VO CmCd_VO) {
		
		CmCd_VO.setCm_typ("CODENAME");		
		cmCdDAO.update_LastCmCd(CmCd_VO);
		
	}
	

}
