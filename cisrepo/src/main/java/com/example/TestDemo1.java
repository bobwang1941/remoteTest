
package com.example;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.domain.BuildType;
import com.domain.Response;
import com.iflytek.ydhl.jenkins.common.model.BusinessLine;
import com.iflytek.ydhl.jenkins.common.model.Department;

//@RestController的意思就是controller里面的方法都以json格式输出，不用再写什么jackjson配置的了！
@Controller
@RequestMapping("/repo")
public class TestDemo1 {
    
    //判断用户名是否存在
    //项目英文名
    @RequestMapping("/project/judge/{groupName}")
    @ResponseBody
    public Response queryByProjectName(@PathVariable("groupName") String groupName){
        System.out.println("测试用："+groupName);
        Response response = new Response();
        response.setSuccess(true);
        response.setErrorMessage(StringUtils.EMPTY);
        response.setData(true);
        return response;
        
    }

    // 项目组新建
    @RequestMapping("/project")
    public String addProjectGroup(Model model) {
        // 事业群加载
        Department department = new Department();
        department.setId(1);
        department.setName("测试专用事业群");
        department.setCnname("YHZ");
        List<Department> departments = new ArrayList<Department>();
        departments.add(department);

        // 业务线
        BusinessLine bl = new BusinessLine();
        bl.setId(1);
        bl.setName("测试专用业务线");
        bl.setEnname("YHZ");
        ArrayList<BusinessLine> businessLines = new ArrayList<BusinessLine>();
        businessLines.add(bl);

        // 返回页面
        model.addAttribute("businessLines", businessLines);
        model.addAttribute("departments", departments);

        return "/templates/project/add_project_group.jsp";
    }

    // 服务端
    @RequestMapping("/queryAllBSType")
    @ResponseBody
    public Response queryAllBSType() {
        
        ArrayList<BusinessLine> business = new ArrayList<BusinessLine>();
//        business.add(bl);
        Response response = new Response();
        response.setData(business);
        response.setSuccess(true);
        response.setErrorMessage(StringUtils.EMPTY);
        return response;
    }

    // 客户端
    @RequestMapping("/queryAllBuildType")
    @ResponseBody
    public Response queryAllBuildType() {
        BuildType bt = new BuildType();
        bt.setId(1L);
        bt.setBuildType("Normal");
        bt.setBuildTypeDesc("普通");
        ArrayList<BuildType> list = new ArrayList<BuildType>();
        list.add(bt);

        Response response = new Response();
        response.setErrorMessage(StringUtils.EMPTY);
        response.setSuccess(true);
        response.setData(list);
        // "id":1,"buildType":"Normal","buildTypeDesc":"普通"
        return response;
    }

    // 首页
    @RequestMapping("/index/{userName}")
    public String testDemo(@PathVariable("userName") String userName) {
        System.out.println("首页" + userName);
        return "redirect:/templates/project/index.jsp";
    }

}
