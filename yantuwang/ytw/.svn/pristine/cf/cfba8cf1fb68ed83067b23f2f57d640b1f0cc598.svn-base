package com.mtecc.rdc.goodsinfo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.BeansException;
import org.springframework.stereotype.Repository;







import com.mtecc.base.MteccBaseDao;
import com.mtecc.rdc.base.MteccContext;
import com.mtecc.rdc.goodsinfo.condition.goodsCondition;
import com.mtecc.rdc.pojo.Goods;
import com.mtecc.rdc.pojo.SysUser;
import com.mtecc.rdc.pojo.SysUserGroup;
import com.mtecc.rdc.util.Base64;
import com.mtecc.rdc.util.EmptyUtil;

@Repository
public class goodsDao extends MteccBaseDao {

	public List queryGoods(goodsCondition condition, int start, int page) throws Exception{
		List<Goods> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from Goods g where 1=1");
		if (!EmptyUtil.isEmpty(condition.getName())) {
			buffer.append(" and g.name like '%"+condition.getName()+"%'");
		}if (!EmptyUtil.isEmpty(condition.getNumber())) {
			buffer.append(" and g.number like '%"+condition.getNumber()+"%'");
		}if (!EmptyUtil.isEmpty(condition.getBarcode())) {
			buffer.append(" and g.barcode like '%"+condition.getBarcode()+"%'");
		}
		buffer.append(" order by g.goodsid desc");
		list=(List<Goods>) this.findByHQLWithPage(buffer.toString(), start, page);
		return list;
	}
	public int count(goodsCondition condition) throws Exception{
		int count ;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" select count(*) from Goods g where 1=1");
		if (!EmptyUtil.isEmpty(condition.getName())) {
			buffer.append(" and g.name like '%"+condition.getName()+"%'");
		}if (!EmptyUtil.isEmpty(condition.getNumber())) {
			buffer.append(" and g.number like '%"+condition.getNumber()+"%'");
		}if (!EmptyUtil.isEmpty(condition.getBarcode())) {
			buffer.append(" and g.barcode like '%"+condition.getBarcode()+"%'");
		}
		count= this.countByHql(buffer.toString());
		return count;
	}
	
	
	
	
	



}
