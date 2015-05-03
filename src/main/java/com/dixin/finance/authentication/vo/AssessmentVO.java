package com.dixin.finance.authentication.vo;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;
public class AssessmentVO extends BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;//内部唯一id
	private int userId;//用户id
	private int option1;//问题1
	private int option2;//问题2
	private int option3;//问题3
	private int option4;//问题4
	private int option5;//问题5
	private int option6;//问题6
	private int option7;//问题7
	private int option8;//问题8
	private int option9;//问题9
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date createTime;//创建时间
	private int grade;//总分
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getOption1() {
		return option1;
	}
	public void setOption1(int option1) {
		this.option1 = option1;
	}
	public int getOption2() {
		return option2;
	}
	public void setOption2(int option2) {
		this.option2 = option2;
	}
	public int getOption3() {
		return option3;
	}
	public void setOption3(int option3) {
		this.option3 = option3;
	}
	public int getOption4() {
		return option4;
	}
	public void setOption4(int option4) {
		this.option4 = option4;
	}
	public int getOption5() {
		return option5;
	}
	public void setOption5(int option5) {
		this.option5 = option5;
	}
	public int getOption6() {
		return option6;
	}
	public void setOption6(int option6) {
		this.option6 = option6;
	}
	public int getOption7() {
		return option7;
	}
	public void setOption7(int option7) {
		this.option7 = option7;
	}
	public int getOption8() {
		return option8;
	}
	public void setOption8(int option8) {
		this.option8 = option8;
	}
	public int getOption9() {
		return option9;
	}
	public void setOption9(int option9) {
		this.option9 = option9;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	

}
