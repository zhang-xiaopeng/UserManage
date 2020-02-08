package edu.uestc.bos.dao;

import java.util.List;

import edu.uestc.bos.dao.base.IBaseDao;
import edu.uestc.bos.domain.Subarea;

public interface ISubareaDao extends IBaseDao<Subarea>{

	public List<Object> findSubareasGroupByProvince();

}
