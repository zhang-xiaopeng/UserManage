package edu.uestc.bos.service.impl;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.uestc.bos.dao.IDecidedzoneDao;
import edu.uestc.bos.dao.INoticebillDao;
import edu.uestc.bos.dao.IWorkbillDao;
import edu.uestc.bos.domain.Decidedzone;
import edu.uestc.bos.domain.Noticebill;
import edu.uestc.bos.domain.Staff;
import edu.uestc.bos.domain.User;
import edu.uestc.bos.domain.Workbill;
import edu.uestc.bos.service.INoticebillService;
import edu.uestc.bos.utils.BOSUtils;
import edu.uestc.crm.ICustomerService;

@Service
@Transactional
public class NoticebillServiceImpl implements INoticebillService {

	@Autowired
	private INoticebillDao noticebillDao ;
	@Autowired
	private ICustomerService customerService ;
	@Autowired
	private IDecidedzoneDao decidedzoneDao ;
	@Autowired
	private IWorkbillDao workbillDao ;
	
	/**
	 * 保存业务通知单，还有尝试自动分单
	 */
	@Override
	public void save(Noticebill model) {
		User user = BOSUtils.getLoginUser();
		model.setUser(user) ;
		noticebillDao.save(model);
		
		//获取客户的取件地址
		String pickaddress = model.getPickaddress();
		//远程调用crm服务，根据取件地址查询定区id
		String decidedzoneId = customerService.findDecidedzoneIdByAddress(pickaddress);
		
		if(decidedzoneId != null){
			//查询到了定区id,可以完成自动分单
			Decidedzone decidedzone = decidedzoneDao.findById(decidedzoneId) ;
			Staff staff = decidedzone.getStaff();
			//关联取派员对象
			model.setStaff(staff);
			//设置分单类型为自动分单
			model.setOrdertype(Noticebill.ORDERTYPE_AUTO);
			//为取派员产生工单
			Workbill workbill = new Workbill() ;
			workbill.setAttachbilltimes(0) ;  //追单次数
			workbill.setBuildtime(new Timestamp(System.currentTimeMillis())); //创建时间，系统当前时间
			workbill.setNoticebill(model) ;  //工单关联业务通知单
			workbill.setPickstate(Workbill.PICKSTATE_NO);  //取件状态
			workbill.setRemark(model.getRemark());  //备注
			workbill.setStaff(staff);  //取派员
			workbill.setType(Workbill.TYPE_1) ; //工单类型
			
			workbillDao.save(workbill) ;
			
			//调用短信平台，发送短信
			
		}else{
			//没有查询到定区id,不能完成自动分单,人工分单
			model.setOrdertype(Noticebill.ORDERTYPE_MAN);
		}
	}

}
