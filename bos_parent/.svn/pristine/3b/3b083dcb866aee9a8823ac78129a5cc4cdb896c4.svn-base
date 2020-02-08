package edu.uestc.bos.dao.base;

import java.io.Serializable;
import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import edu.uestc.bos.utils.PageBean;

public interface IBaseDao<T> {
    public void save(T entity) ;
    public void delete(T entity) ;
    public void update(T entity) ;
	public void saveOrUpdate(T entity);
    public T findById(Serializable id) ;
    public List<T> findAll() ;
    public List<T> findByCriteria(DetachedCriteria detachedCriteria) ;
    public void executeUpdate(String queryName,Object ...objects) ;
    public void pageQuery(PageBean pageBean) ;  //返回数据放到pageBean中
}
