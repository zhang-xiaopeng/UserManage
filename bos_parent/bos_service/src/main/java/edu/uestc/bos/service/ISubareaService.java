package edu.uestc.bos.service;

import java.util.List;

import edu.uestc.bos.domain.Subarea;
import edu.uestc.bos.utils.PageBean;

public interface ISubareaService {

	public void save(Subarea model);

	public void pageQuery(PageBean pageBean);

	public List<Subarea> findAll();

	public List<Subarea> findListNotAssociation();

	public List<Subarea> findListByDecidedzoneId(String decidedzoneId);

	public List<Object> findSubareasGroupByProvince();

}
