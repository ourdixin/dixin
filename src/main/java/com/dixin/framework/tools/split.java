package com.dixin.framework.tools;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class split {
	
	private static StringTokenizer tokenizer;
	/**
	 * 将格式为“int，int”，例如“6,7”类型的字符串分割，并将分割的结果用List保存起来
	 * @param str
	 * @return
	 */
	public static  List<Integer> pickUpString(String str,String delim){
		tokenizer = new StringTokenizer(str,delim);
		List<Integer> list=new ArrayList<Integer>();
		while(tokenizer.hasMoreElements()){
			int i=Integer.parseInt(tokenizer.nextElement().toString());
			list.add(i);
		}
		return list;	
	}
	/**
	 * 将格式为{"int,int","int1,int2"}，例如{"1,2","3,4"}的字符数组分割，
	 * 并根据第二个操作数得出最大的值，分别将index和value添加进List进行保存
	 * @param string
	 * @return
	 */
	public static List<Integer> pickUpArray(String[] string,String delim){
		int maxGrade=0;
		int maxIndex=0;
		List<Integer> finalList = new ArrayList<Integer>();
		if(string.length==1){
			finalList = pickUpString(string[0],delim);
			
		}else{
			for(int i=0;i<string.length;i++){
				List<Integer> list = pickUpString(string[i],delim);
				if(list.get(1)>=maxGrade){
					maxGrade = list.get(1);
					maxIndex =list.get(0);
				}
			}
			finalList.add(maxIndex);
			finalList.add(maxGrade);
			
		}
		return finalList;
	}
	
}

