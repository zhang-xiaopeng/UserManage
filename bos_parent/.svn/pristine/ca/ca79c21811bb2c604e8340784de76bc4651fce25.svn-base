package edu.uestc.bos.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.uestc.bos.dao.ISubareaDao;
import edu.uestc.bos.dao.base.impl.BaseDaoImpl;
import edu.uestc.bos.domain.Subarea;

@Repository
public class SubareaDaoImpl extends BaseDaoImpl<Subarea> implements ISubareaDao {

	@Override
	public List<Object> findSubareasGroupByProvince() {
		String hql = "SELECT r.province , count(*) FROM Subarea s LEFT OUTER JOIN s.region r GROUP BY r.province" ;
		return 	(List<Object>) this.getHibernateTemplate().find(hql) ;
	}

}
