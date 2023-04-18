package com.em.controller;

import com.em.domain.User;
import com.em.service.UserService;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.em.util.CheckCodeUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {

	@Autowired
	UserService userService;

    // Login jump
    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String loginUI() throws Exception {
        return "../../login";
    }

    // Login form processing
    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String login(Model model,User user, HttpServletRequest request) throws Exception {

        //Shiro implements login
        UsernamePasswordToken token = new UsernamePasswordToken(user.getId(),user.getPassword());
        Subject subject = SecurityUtils.getSubject();

        // If the user name cannot be obtained, the login fails. If the login fails, an exception is thrown
        try {
			subject.login(token);
		} catch (Exception e) {
//			return "/login";
            model.addAttribute("message","The user name or password is incorrect");
            return "/error";
		}

        if (subject.hasRole("admin")) {
        	request.getSession().setAttribute("admin", user.getId());
        	request.getSession().setAttribute("usersession", userService.findUserById(user.getId()));
            return "redirect:/admin/showRoom";
        } else if (subject.hasRole("ordinary")) {
        	request.getSession().setAttribute("user", user.getId());
        	request.getSession().setAttribute("usersession", userService.findUserById(user.getId()));
            return "redirect:/ordinary/showRoom";
        }

        model.addAttribute("message","登录异常，请联系管理员");
        return "/error";
    }

    // Register the jump
    @RequestMapping(value = "/register",method = {RequestMethod.GET})
    public String registerUI() throws Exception{
        return "/register";
    }

    // Registration form processing
    @RequestMapping(value = "/register", method = {RequestMethod.POST})
    public String register(Model model,User user, HttpServletRequest request) throws Exception {

        // Obtain the verification code entered by the user
        String checkCode = request.getParameter("checkCode");

        // Compare the verification code. If the verification code is incorrect, it is returned
        String checkCodeGen = request.getSession().getAttribute("checkCodeGen").toString();

        if (!checkCodeGen.equalsIgnoreCase(checkCode)){
            model.addAttribute("message","The verification code is incorrect");
            return "redirect:/register";
        }

        if(user.getUsername()!=null && user.getUsername()!="" && user.getPassword()!=null && user.getPassword()!=""){
            user.setId(user.getUsername());

            // Check whether the user id exists
            User userById = userService.findUserById(user.getId());
            if (userById !=null){
                model.addAttribute("message","The user name already exists");
                return "redirect:/register";
            }

            userService.addNewUser(user);
            model.addAttribute("message","用户注册成功，请登录");
            return "redirect:/login";
        }else {
            model.addAttribute("message","用户名密码不能为空");
            return "redirect:/register";
        }
    }

        // 生成验证码
    @RequestMapping(value = "/checkcode",method = {RequestMethod.GET})
    public void checkcode(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception{

        // 生成验证码
        ServletOutputStream outputStream = response.getOutputStream();
        String checkcode = CheckCodeUtil.outputVerifyImage(100, 50, outputStream, 4);

        // 存储验证码
        request.getSession().setAttribute("checkCodeGen",checkcode);
//        model.addAttribute("checkCodeGen",checkcode);
    }

}
