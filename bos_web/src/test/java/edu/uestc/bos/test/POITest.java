package edu.uestc.bos.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.junit.Test;

public class POITest {
	
	//如何使用POI解析文件
	//@Test
	public void test1() throws FileNotFoundException, IOException{
		String filePath = "D:\\File\\Programming\\BOS物流系统\\BOS-day05\\BOS-day05\\资料\\区域导入测试数据.xls" ;
		//包装一个Excel文件对象
		HSSFWorkbook workBook = new HSSFWorkbook(new FileInputStream(new File(filePath))) ;
		//读取文件中第一个Sheet标签页
		HSSFSheet sheet = workBook.getSheetAt(0);
		//遍历标签页中所有的行
		for (Row row : sheet) {
			int rowNum = row.getRowNum();  //行号
			if(rowNum == 0){           //第一行是标题行，不需要显示
				continue ;
			}
			for (Cell cell : row) {
				String value = cell.getStringCellValue();
				System.out.print(value + " ");
			}
			System.out.println();
		}
	}
}
