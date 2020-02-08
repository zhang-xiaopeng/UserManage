package edu.uestc.bos.service;

import java.util.List;

import edu.uestc.bos.domain.Staff;
import edu.uestc.bos.utils.PageBean;

public interface IStaffService {

	public void save(Staff model);

	public void pageQuery(PageBean pageBean);

	public void deleteBatch(String ids);

	public Staff findById(String id);

	public void update(Staff staff);

	public List<Staff> findListNotDelete();

}
