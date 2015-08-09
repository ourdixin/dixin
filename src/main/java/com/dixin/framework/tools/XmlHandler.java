/**
 * 用SAX解析XML的Handler
 */
package com.dixin.framework.tools;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class XmlHandler extends DefaultHandler {
    //存储正在解析的元素的数据
    private Map<String,String> map=null;
    //存储所有解析的元素的数据
    private List<Map<String,String>> list=null;
    //正在解析的元素的名字
    String currentTag=null;
    //正在解析的元素的元素值
    String currentValue=null;
    //开始解析的元素
    String nodeName=null;
    

    public XmlHandler(String nodeName) {
        // TODO Auto-generated constructor stub
        this.nodeName=nodeName;
    }
    
    public List<Map<String, String>> getList() {
        return list;
    }

    //开始解析文档，即开始解析XML根元素时调用该方法
    @Override
    public void startDocument() throws SAXException {
        // TODO Auto-generated method stub
        System.out.println("--startDocument()--");
        //初始化Map
        list=new ArrayList<Map<String,String>>();
    }
    
    //开始解析每个元素时都会调用该方法
    @Override
    public void startElement(String uri, String localName, String qName,
            Attributes attributes) throws SAXException {
        // TODO Auto-generated method stub
        //判断正在解析的元素是不是开始解析的元素
        System.out.println("--startElement()--"+qName);
        if(qName.equals(nodeName)){
            map=new HashMap<String, String>();
        }
        
        //判断正在解析的元素是否有属性值,如果有则将其全部取出并保存到map对象中，如:<person id="00001"></person>
        if(attributes!=null&&map!=null){
            for(int i=0;i<attributes.getLength();i++){
                map.put(attributes.getQName(i), attributes.getValue(i));
            }
        }
        currentTag=qName;  //正在解析的元素
    }
    
    //解析到每个元素的内容时会调用此方法
    @Override
    public void characters(char[] ch, int start, int length)
            throws SAXException {
        // TODO Auto-generated method stub
        System.out.println("--characters()--");
        if(currentTag!=null&&map!=null){
            currentValue=new String(ch,start,length);
            //如果内容不为空和空格，也不是换行符则将该元素名和值和存入map中
            if(currentValue!=null&&!currentValue.trim().equals("")&&!currentValue.trim().equals("\n")){
                map.put(currentTag, currentValue);
                System.out.println("-----"+currentTag+" "+currentValue);
            }
            //当前的元素已解析过，将其置空用于下一个元素的解析
            currentTag=null;
            currentValue=null;
        }
    }
    
    //每个元素结束的时候都会调用该方法
    @Override
    public void endElement(String uri, String localName, String qName)
            throws SAXException {
        // TODO Auto-generated method stub
        System.out.println("--endElement()--"+qName);
        //判断是否为一个节点结束的元素标签
        if(qName.equals(nodeName)){
            list.add(map);
            map=null;
        }
    }
    
    //结束解析文档，即解析根元素结束标签时调用该方法
    @Override
    public void endDocument() throws SAXException {
        // TODO Auto-generated method stub
        System.out.println("--endDocument()--");
        super.endDocument();
    }
    
    public List<Map<String,String>> ReadXML(String uri,String NodeName){
        try {
            //创建一个解析XML的工厂对象
            SAXParserFactory parserFactory=SAXParserFactory.newInstance();
            //创建一个解析XML的对象
            SAXParser parser=parserFactory.newSAXParser();
            //创建一个解析助手类
            XmlHandler myhandler=new XmlHandler("stu");
            parser.parse(uri, myhandler);
            return myhandler.getList();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            
        }
        return null;
        
    }
    
}

