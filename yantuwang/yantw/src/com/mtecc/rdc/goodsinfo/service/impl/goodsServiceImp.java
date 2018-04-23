package com.mtecc.rdc.goodsinfo.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.mtecc.rdc.goodsinfo.condition.goodsCondition;
import com.mtecc.rdc.goodsinfo.dao.goodsDao;
import com.mtecc.rdc.goodsinfo.service.goodsService;
import com.mtecc.rdc.pojo.Goods;
import com.mtecc.rdc.pojo.SysUser;
import com.mtecc.rdc.system.login.dao.UserDao;
import com.mtecc.rdc.system.login.service.UserService;

@Service
@Transactional
public class goodsServiceImp implements goodsService {

	@Autowired
	private goodsDao dao;
	
	public Integer save(Goods goods) throws  Exception{
		return (Integer) dao.save(goods);
	}
	public boolean update(Goods goods) throws  Exception{
		return dao.update(goods);
	}
	
	public boolean  delete( Goods goods) throws Exception{
		return dao.delete(goods);
	}
	
	public Goods getObjectById(Integer goodsid) throws  Exception{
		return  (Goods) dao.get(Goods.class, goodsid);
	}
	public List queryGoods(goodsCondition condition, int start, int page) throws Exception{
		return dao.queryGoods(condition, start, page);
	}
	public int count(goodsCondition condition) throws Exception{
		return dao.count(condition);
	}
	



	
}
