package com.example;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


//@RestController的意思就是controller里面的方法都以json格式输出，不用再写什么jackjson配置的了！
@RestController
public class TestDemo1 {
    @Resource
    private JdbcTemplate jdbcTemple;

	@RequestMapping("/hello")
	@ResponseBody
	public String testDemo(){
//		List<DeliveryStatus> list = testService.findAllBuildProject();
	    List<Map<String, Object>> list = jdbcTemple.queryForList("select * from auto_build_status");
	    
		return list.toString();
	}
}

