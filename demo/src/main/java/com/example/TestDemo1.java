package com.example;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//@RestController的意思就是controller里面的方法都以json格式输出，不用再写什么jackjson配置的了！
@RestController
public class TestDemo1 {

	@RequestMapping("/hello")
	public String testDemo(){
		System.out.println("hello word");
		String str = "这是测试git提交";
		String str2 = "分支提交与合并";
		String str3 = "最后一次分支提交";
		return "hello";
	}
}

