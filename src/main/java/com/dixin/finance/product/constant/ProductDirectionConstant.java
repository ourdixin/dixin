/**
 * 
 */
package com.dixin.finance.product.constant;

/**
 * @author john
 *
 */
public interface ProductDirectionConstant {
	
	public class DirectionTypeItem{
		DirectionTypeItem(String name,int id)
		{
			Name = name;
			Id = id;
		}
		public String Name;

		public int Id;
		
		public String getName() {
			return Name;
		}
		public void setName(String name) {
			Name = name;
		}
		public int getId() {
			return Id;
		}
		public void setId(int id) {
			Id = id;
		}
	};
	
	final DirectionTypeItem[] DirectionTypeString = new DirectionTypeItem[]{
			new DirectionTypeItem("金融市场",49),new DirectionTypeItem("公益",50),new DirectionTypeItem("金融机构",51),new DirectionTypeItem("房地产",52),new DirectionTypeItem("工商企业",53),new DirectionTypeItem("基础设施",54),new DirectionTypeItem("实业企业",55),new DirectionTypeItem("保障房",56),new DirectionTypeItem("酒店类",57),new DirectionTypeItem("其它",58)
			,new DirectionTypeItem("货币型",77),new DirectionTypeItem("债券型",78),new DirectionTypeItem("股票型",79),new DirectionTypeItem("私募股权",80),new DirectionTypeItem("定向增发",81),new DirectionTypeItem("海外市场",82),new DirectionTypeItem("量化对冲",83),new DirectionTypeItem("指数型",84),new DirectionTypeItem("新三版",85),new DirectionTypeItem("结构型",86),new DirectionTypeItem("混合型",87),new DirectionTypeItem("FOF",88)
			};
	/**
	 * 所有
	 */
	final int ALL = 30;	
	
	/**
	 * 金融市场
	 */	
	final int FinacalMarket = 49;
	
	/**
	 * 公益
	 */	
	final int PublicWelfare = 50;
	
	/**
	 * 金融机构
	 */		
	final int FinancalInstitution = 51;
	
	/**
	 * 房地产
	 */	
	final int RealEstate = 52;
	
	/**
	 * 工商企业
	 */		
	final int BusinessEnterprises = 53;
	
	/**
	 * 基础设施
	 */		
	final int Infrastructure = 54;
	
	/**
	 * 实业企业
	 */		
	final int IndustrialEnterprises = 55;
	
	/**
	 * 保障房
	 */		
	final int AffordableHousing = 56;
	
	/**
	 * 酒店类
	 */		
	final int Hotel = 57;
	
	/**
	 * 其它
	 */		
	final int Others = 58;
	
	/**
	 * 货币型
	 */		
	final int Currency = 77;		
	
	/**
	 * 债券型
	 */		
	final int Bond = 78;	
	
	/**
	 * 股票型
	 */		
	final int Stock = 79;	
	
	/**
	 * 私募股权
	 */		
	final int privateEquity = 80;	
	
	/**
	 * 定向增发
	 */		
	final int privatePlacement = 81;		
	
	/**
	 * 海外市场
	 */		
	final int overseasMarket = 82;	
	
	/**
	 * 量化对冲
	 */		
	final int Hedge = 83;	
	
	/**
	 * 指数型
	 */		
	final int Index = 84;	
	
	/**
	 * 新三版
	 */		
	final int XinSanBan = 85;	
	
	/**
	 * 结构型
	 */		
	final int StructureFund  = 86;
	
	/**
	 * 混合型
	 */		
	final int HybridFund = 87;
	
	/**
	 * FOF
	 */		
	final int FOFund = 88;	
}
