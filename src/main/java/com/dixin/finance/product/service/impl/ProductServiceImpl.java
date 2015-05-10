/**
 * 
 */
package com.dixin.finance.product.service.impl;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dixin.finance.product.dao.ProductMapper;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.vo.ProductQueryParameter;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.finance.product.web.ProductController;

/**
 * @author Administrator
 *
 */
@Service("productServiceImpl")
public class ProductServiceImpl implements IProductService{

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource
	private ProductMapper productMapper;
	
	/* (non-Javadoc)
	 * @see com.dixin.finance.product.service.impl.IProductService#queryProductList()
	 */
	@Override
	public List<ProductVO> queryProductList(ProductQueryParameter parameter) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productType", parameter.getProductType());	
		map.put("searchText", parameter.getSearchText());
		map.put("state", parameter.getState());
		map.put("minAmount", parameter.getMinAmount());
		map.put("term", parameter.getTerm());
		map.put("rate", parameter.getRate());
		map.put("direction", parameter.getDirection());
		map.put("profitType", parameter.getProfitType());
		return productMapper.queryProductList(map);
	}
	
	@Override
	public ProductVO queryProduct(int productId)
	{
		return productMapper.queryProduct(productId);
	}

	@Override
	public void updateViewNum(int productId) {
		
		productMapper.updateViewNum(productId);
	}

	@Override
	public void addProduct(ProductVO product) {
		productMapper.addProduct(product);
	}
	
	@Override
	public void addProductList(List<ProductVO> productList){
		productMapper.addProductList(productList);
	}
	
	public List<ProductVO> readProductListFromExcel(String fileName){
		List<ProductVO> products = new ArrayList<ProductVO>();
		boolean bBreak = false;
		try {
			InputStream file = new FileInputStream(fileName);
			POIFSFileSystem poiFile = new POIFSFileSystem(file);
			HSSFWorkbook wb = new HSSFWorkbook(poiFile);
			HSSFSheet sheet = wb.getSheetAt(0);
			int type = -1;
			
	        // 得到总行数
	        int rowNum = sheet.getLastRowNum();
	        HSSFRow row = sheet.getRow(0);
	        HSSFCell cell = row.getCell(4);
	        int colNum = row.getPhysicalNumberOfCells();
	        if(colNum == 20)
	        {
	        	String title = cell.getStringCellValue();
		        if(title.contains("封闭"))
		        	type = 43;//浮动收益
		        else
		        	type = 42; //固定收益
	        }
	        
	        if(type != -1){        
		        String strValue = "";
		        // 正文内容应该从第三行开始,前二行为表头的标题
		        for (int nIndex = 2; nIndex <= rowNum; nIndex++) {
		            row = sheet.getRow(nIndex);
		            int nCol = 0;
		            ProductVO product = new ProductVO();
		            product.setProfitId(type);
		            while (nCol < colNum) {
		            	
		            	strValue = getCellFormatValue(row.getCell(nCol)).trim();
		            	
		            	if(!product.SetValue(strValue,nCol,type))
		            	{
		            		logger.info("readProductListFromExcel" + fileName + " 内容异常," + nIndex + ":" +  nCol + strValue);
		            		bBreak= true;
		            		break;
		            	}
		            	
		                nCol++;
		            }
		            if(bBreak)
		            	break;
		            products.add(product);
		        }     
	        }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			products.clear();
		}

		return products;
	}
	
	   /**
     * 获取单元格数据内容为字符串类型的数据
     * 
     * @param cell Excel单元格
     * @return String 单元格数据内容
     */
    private String getStringCellValue(HSSFCell cell) {
        String strCell = "";
        switch (cell.getCellType()) {
        case HSSFCell.CELL_TYPE_STRING:
            strCell = cell.getStringCellValue();
            break;
        case HSSFCell.CELL_TYPE_NUMERIC:
            strCell = String.valueOf(cell.getNumericCellValue());
            break;
        case HSSFCell.CELL_TYPE_BOOLEAN:
            strCell = String.valueOf(cell.getBooleanCellValue());
            break;
        case HSSFCell.CELL_TYPE_BLANK:
            strCell = "";
            break;
        default:
            strCell = "";
            break;
        }
        if (strCell.equals("") || strCell == null) {
            return "";
        }
        if (cell == null) {
            return "";
        }
        return strCell;
    }

    /**
     * 根据HSSFCell类型设置数据
     * @param cell
     * @return
     */
    private String getCellFormatValue(HSSFCell cell) {
        String cellvalue = "";
        if (cell != null) {
            // 判断当前Cell的Type
            switch (cell.getCellType()) {
            // 如果当前Cell的Type为NUMERIC
            case HSSFCell.CELL_TYPE_NUMERIC:
            case HSSFCell.CELL_TYPE_FORMULA: {
                // 判断当前的cell是否为Date
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    // 如果是Date类型则，转化为Data格式
                    
                    //方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
                    //cellvalue = cell.getDateCellValue().toLocaleString();
                    
                    //方法2：这样子的data格式是不带带时分秒的：2011-10-12
                    Date date = cell.getDateCellValue();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    cellvalue = sdf.format(date);
                    
                }
                // 如果是纯数字
                else {
                    // 取得当前Cell的数值
                    cellvalue = String.valueOf(cell.getNumericCellValue());
                    String[]  strValues = cellvalue.split("\\.");
                    if(strValues.length  == 2)
                    {
                    	String strValue = strValues[1];
                    	if(strValue.length() > 7)
                    		strValue = strValues[1].substring(0, 6);
                    	int iValue = Integer.valueOf(strValue);
                    	if(iValue == 0)
                    	{
                    		cellvalue = strValues[0];
                    	}
                    }
                }
                break;
            }
            // 如果当前Cell的Type为STRIN
            case HSSFCell.CELL_TYPE_STRING:
                // 取得当前的Cell字符串
                cellvalue = cell.getRichStringCellValue().getString();
                break;
            // 默认的Cell值
            default:
            	cellvalue = cell.getStringCellValue();
            }
        } else {
            cellvalue = "";
        }
        return cellvalue;

    }

	@Override
	public void deleteProduct(int productId) {
		productMapper.deleteProduct(productId);
	}
    
}
