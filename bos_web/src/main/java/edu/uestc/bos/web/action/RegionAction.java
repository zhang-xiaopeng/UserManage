package edu.uestc.bos.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import edu.uestc.bos.domain.Region;
import edu.uestc.bos.service.IRegionService;
import edu.uestc.bos.utils.PageBean;
import edu.uestc.bos.utils.PinYin4jUtils;
import edu.uestc.bos.web.action.base.BaseAction;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 区域管理
 * @author HIPAA
 *
 */

@Controller
@Scope("prototype")
public class RegionAction extends BaseAction<Region>{

	//属性驱动，接收上传文件
	private File regionFile ;

	@Autowired
	private IRegionService regionService ;
	
	/**
	 * 区域导入
	 * @return
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public String importXls() throws FileNotFoundException, IOException{
		List<Region> list = new ArrayList<Region> () ;
		
		//使用POI解析Excel文件
		HSSFWorkbook workBook = new HSSFWorkbook(new FileInputStream(regionFile)) ;
		HSSFSheet sheet = workBook.getSheetAt(0) ;
		for (Row row : sheet) {
			int rowNum = row.getRowNum();  //行号
			if(rowNum == 0){           //第一行是标题行，不需要显示
				continue ;
			}
			String id  = row.getCell(0).getStringCellValue() ;
			String province  = row.getCell(1).getStringCellValue() ;
			String city  = row.getCell(2).getStringCellValue() ;
			String district  = row.getCell(3).getStringCellValue() ;
			String postcode  = row.getCell(4).getStringCellValue() ;
			
			
			//包装成一个区域对象
			Region region = new Region(id,province,city,district,postcode,null,null,null) ;
			
			//生成简码-----HBSJZQX
			
			province = province.substring(0,province.length() - 1) ;
			city = city.substring(0,city.length() - 1) ;
			district = district.substring(0,district.length() - 1) ;
			
			String info = province + city + district ;
			String[] headByString = PinYin4jUtils.getHeadByString(info);
			String shortcode = StringUtils.join(headByString);
			
			//生成城市编码shijiazhuang
			String citycode = PinYin4jUtils.hanziToPinyin(city,""); //分隔符为空字符串
			
			region.setShortcode(shortcode);
			region.setCitycode(citycode);
			
			list.add(region) ;
		}
		regionService.saveBatch(list) ;
		return NONE ;
	}

	/**
	 * 分页查询
	 * @return
	 * @throws IOException 
	 */
	public String pageQuery() throws IOException{
		
		regionService.pageQuery(pageBean) ;
		
		this.javaToJson(pageBean, new String[]{"currentPage","pageSize","detachedCriteria","subareas"});
		
		return NONE ;
	}
	
	private String q ;
	
	/**
	 * 查询所有区域，写回json数据
	 * @return
	 */
	public String listajax(){
		List<Region> list = null ;
		if(StringUtils.isNotBlank(q)){
			list = regionService.findListByQ(q) ;
		}else{
			list = regionService.findAll() ;
		}
		this.javaToJson(list, new String[]{"subareas"});
		return NONE ;
	}
	
	public File getRegionFile() {
		return regionFile;
	}

	public void setRegionFile(File regionFile) {
		this.regionFile = regionFile;
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}
	


	
}
