package com.intfocus.hdk.controller;
import java.io.IOException;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.intfocus.hdk.dao.JsapiTicketMapper;
import com.intfocus.hdk.dao.JsapiTokenMapper;
import com.intfocus.hdk.dao.SalesDataMapper;
import com.intfocus.hdk.dao.UsersMapper;
import com.intfocus.hdk.util.JuheDemo;
import com.intfocus.hdk.util.StaticVariableUtil;
import com.intfocus.hdk.util.WeiXinUserInfoUtil;
import com.intfocus.hdk.vo.SalesData;
import com.intfocus.hdk.vo.Users;

@Controller
@RequestMapping("/project")
public class InstallController implements ApplicationContextAware {
    private final static Logger log =  Logger.getLogger(InstallController.class);
    private static ApplicationContext applicationContext; 
	@Override
	public void setApplicationContext(ApplicationContext ctx)
			throws BeansException {
		applicationContext = ctx;
	}   

}