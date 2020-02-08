package edu.uestc.bos.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.uestc.bos.dao.IStaffDao;
import edu.uestc.bos.domain.Staff;
import edu.uestc.bos.service.IStaffService;
import edu.uestc.bos.utils.PageBean;

@Service
@Transactional
public class StaffServiceImpl implements IStaffService{
	
	@Autowired
	private IStaffDao staffDao ;

	@Override
	public void save(Staff model) {
		staffDao.save(model);
	}

	@Override
	public void pageQuery(PageBean pageBean) {
		staffDao.pageQuery(pageBean);
	}

	/**
	 * 取派员的逻辑删除
	 * 将deltag改为1
	 */
	@Override
	public void deleteBatch(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String staffIds[] = ids.split(",") ;
			for (int i = 0; i < staffIds.length; i++) {
				staffDao.executeUpdate("staff.delete", staffIds[i]);
			}
		}
	}

	/**
	 * 根据id查询取派员
	 */
	@Override
	public Staff findById(String id) {
		return staffDao.findById(id) ;
	}

	/**
	 * 根据id修改取派员
	 */
	@Override
	public void update(Staff staff) {
		staffDao.update(staff) ;
	}

	/**
	 * 查找所有未删除的取派员
	 */
	@Override
	public List<Staff> findListNotDelete() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Staff.class) ;
		//添加过滤条件，deltag等于0
		detachedCriteria.add(Restrictions.eq("deltag", "0")) ;
		return staffDao.findByCriteria(detachedCriteria) ;
	}
}
