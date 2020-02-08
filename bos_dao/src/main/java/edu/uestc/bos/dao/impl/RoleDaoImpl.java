package edu.uestc.bos.dao.impl;

import org.springframework.stereotype.Repository;

import edu.uestc.bos.dao.IRoleDao;
import edu.uestc.bos.dao.base.impl.BaseDaoImpl;
import edu.uestc.bos.domain.Role;

@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role> implements IRoleDao{

}
