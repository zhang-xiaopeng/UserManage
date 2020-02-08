package edu.uestc.bos.dao.base.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import edu.uestc.bos.dao.base.IBaseDao;
import edu.uestc.bos.utils.PageBean;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements IBaseDao<T> {
	
	//某个类的类型
	private Class<T> entityClass ;
	
	@Resource //根据类型注入Spring工厂中的sessionFactory
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	//在父类（BaseDaoImpl）的构造方法中动态获得entityClass
	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		ParameterizedType superclass = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] actualTypeArguments = superclass.getActualTypeArguments();  //获得父类上声明的泛型数组
		this.entityClass = (Class<T>) actualTypeArguments[0] ;
	}

	@Override
	public void save(T entity) {
		this.getHibernateTemplate().save(entity) ;
	}

	@Override
	public void delete(T entity) {
		this.getHibernateTemplate().delete(entity);
	}

	@Override
	public void update(T entity) {
		this.getHibernateTemplate().update(entity);
	}

	@Override
	public T findById(Serializable id) {
		return this.getHibernateTemplate().get(entityClass, id) ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> findAll() {
		String hql = "FROM " + entityClass.getSimpleName() ;
		return (List<T>)this.getHibernateTemplate().find(hql) ;
	}

	/**
	 * 执行更新
	 */
	@Override
	public void executeUpdate(String queryName, Object... objects) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.getNamedQuery(queryName);
		//为HQL语句中的？赋值
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]) ;
		}
		//执行更新
		query.executeUpdate() ;
	}

	/**
	 * 通用分页查询方法
	 */
	@Override
	public void pageQuery(PageBean pageBean) {
		int currentPage = pageBean.getCurrentPage() ;
		int pageSize = pageBean.getPageSize() ;
		DetachedCriteria detachedCriteria = pageBean.getDetachedCriteria() ;
		
		//查询total
		detachedCriteria.setProjection(Projections.rowCount()) ; //指定hibernate框架发出sql的形式 select count(*) from bc_staff ;
		List<Long> countList = (List<Long>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
		Long count = countList.get(0);
		pageBean.setTotal(count.intValue());
		
		//查询rows
		detachedCriteria.setProjection(null) ; //指定hibernate框架发出sql的形式 select * from bc_staff ;
		detachedCriteria.setResultTransformer(DetachedCriteria.ROOT_ENTITY) ;  //指定hibernate封装对象的方式（用户多表查询，返回的数据封装为一个对象）
		List rows = this.getHibernateTemplate().findByCriteria(detachedCriteria, (currentPage - 1) * pageSize, pageSize);
		pageBean.setRows(rows) ;
	}

	/**
	 * 保存或更新
	 */
	@Override
	public void saveOrUpdate(T entity) {
		this.getHibernateTemplate().saveOrUpdate(entity);
	}

	/**
	 * 根据条件查询
	 */
	@Override
	public List<T> findByCriteria(DetachedCriteria detachedCriteria) {
		return (List<T>) this.getHibernateTemplate().findByCriteria(detachedCriteria) ;
	}

}
