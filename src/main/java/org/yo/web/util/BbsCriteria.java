package org.yo.web.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class BbsCriteria extends Snippet implements Criteria {
	private int cnt;		//? μ²? κΈ? κ°μ
	private int startPage;		//?? ??΄μ§?	
	private int endPage;		//? ??΄μ§?
	private int currentBlock;	//??¬ λΈλ‘
	private int totalPage;		//? μ²? ??΄μ§?
	private int totalBlock;		//? μ²? λΈλ‘
	private int currentPage;	//??¬ ??΄μ§?


	private int startRecord;	//?? ? μ½λ
	private int endRecord;		//? ? μ½λ

	private String category;	//μΉ΄νκ³ λ¦¬
	private String keyword;		//?€??
	
	private Map<String, String> crimap;	//????΄? ?€?? ?€?΄??κ±?.

	private Map<String, String> colMap;	//μ°Ύκ³ ?Ά?? μ»¬λΌλͺ?

	private List<String> values;	//sql ?΄?¬λ§΅μ²λ¦¬ν ? ??.
	
	

	
	public BbsCriteria() {
		crimap = new HashMap<String, String>();
		colMap = new HashMap<String, String>();
		//μ»¬λΌλͺ? map? λ§λ€?΄μ€??€
		colMap.put("t", "title");
		colMap.put("w", "writer");
		colMap.put("c", "content");
		
	}
	
	public String getSql(){
		//λ¬Έμ?΄ ?¬?©?μ§? λ§κ³   stringbuilder? λ²νΌ ?¨?Ό.
		StringBuilder builder = new StringBuilder(" AND ");
		
		Iterator<String> it = crimap.keySet().iterator();
		this.values = new ArrayList<String>();
		
		for (int i = 0; i < crimap.size(); i++) {
			this.values.add("DUMMY");
		}
		
		while(it.hasNext()){
			
			String key = it.next();
			this.values.add(crimap.get(key));
			
			builder.append(colMap.get(key) +" like '%' ||#{key}||'%'");
			builder.append(" AND ");
			
		}	
		System.out.println(builder.substring(0, builder.length()-4));
		return builder.substring(0, builder.length()-4);
	}
	
	public String getKey(){
		System.out.println("SIZE : " + this.values.size());
		return this.values.remove(0);
	}
	
	public void addCri(String key, String value){
		
		crimap.put(key, value);
		
	}
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
		
		totalPage = (int)(Math.floor((cnt-1)/pageSize))+1;
		
		totalBlock =(int)Math.ceil((totalPage/blockSize));
		
		
		currentBlock = (int)(Math.floor((currentPage-1)/blockSize))+1;
		
		startPage = (currentBlock-1)*blockSize + 1;
	
		endPage = startPage+(blockSize-1);
		
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		endRecord= currentPage*15;
		startRecord = ((currentPage-1)*15)+1;
		if(endRecord > cnt){
			endRecord = cnt;
		}
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCurrentBlock() {
		return currentBlock;
	}
	public void setCurrentBlock(int currentBlock) {
		this.currentBlock = currentBlock;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRecord() {
		return startRecord;
	}
	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}
	public int getEndRecord() {
		return endRecord;
	}
	public void setEndRecord(int endRecord) {
		this.endRecord = endRecord;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public boolean hasPrev() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean hasNext() {
		// TODO Auto-generated method stub
		return false;
	}
	
	public String selected(String type){
		
		if(category == null || category == ""){
			return "";
		}

		if(category.equals(type)){
			return "selected";
		}

		return "";
		
	}

	@Override
	public String toString() {
		return "BbsCriteria [cnt=" + cnt + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", currentBlock=" + currentBlock
				+ ", totalPage=" + totalPage + ", totalBlock=" + totalBlock
				+ ", currentPage=" + currentPage + ", startRecord="
				+ startRecord + ", endRecord=" + endRecord + ", category="
				+ category + ", keyword=" + keyword + ", crimap=" + crimap
				+ ", colMap=" + colMap + ", values=" + values + "]";
	}
	
	
}
