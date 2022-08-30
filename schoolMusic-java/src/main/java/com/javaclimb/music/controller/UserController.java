package com.javaclimb.music.controller;

import com.alibaba.fastjson.JSONObject;
import com.javaclimb.music.domain.User;
import com.javaclimb.music.service.UserService;
import com.javaclimb.music.util.Consts;
import com.javaclimb.music.util.CreateImageCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 前端用户控制类
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 添加用户
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object addUser(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String sex = request.getParameter("sex").trim();
        String phoneNum = request.getParameter("phoneNum").trim();
        String email = request.getParameter("email").trim();
        String birth = request.getParameter("birth").trim();
        String introduction = request.getParameter("introduction").trim();
        String location = request.getParameter("location").trim();
        String avator = request.getParameter("avator").trim();
        String school = request.getParameter("school").trim();
        String identity = request.getParameter("identity").trim();
        if(username == null || username.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"用户名不能为空");
            return jsonObject;
        }

        if(userService.getByUsername(username,null) != null){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"用户名已存在");
            return jsonObject;
        }

        if(userService.ifExistPhoneNum(phoneNum,null)){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"该手机号已注册过");
            return jsonObject;
        }

        if(userService.ifExistEmail(email,null)){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"该邮箱已注册过");
            return jsonObject;
        }

        if(password == null || password.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"密码不能为空");
            return jsonObject;
        }
//        把生日转换成Date格式
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = new Date();
        try {
            birthDate = dateFormat.parse(birth);
        } catch (ParseException e) {
            e.printStackTrace();
        }
//        保存到歌手的对象中
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setSex(new Byte(sex));
        user.setPhoneNum(phoneNum);
        user.setEmail(email);
        user.setBirth(birthDate);
        user.setIntroduction(introduction);
        user.setLocation(location);
        user.setAvator(avator);
        user.setSchool(school);
        user.setIdentity(new Byte(identity));
        boolean flag = userService.insert(user);
        if (flag) {
            jsonObject.put(Consts.CODE, 1);
            jsonObject.put(Consts.MSG, "添加成功");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE, 0);
        jsonObject.put(Consts.MSG, "添加失败");
        return jsonObject;
    }

    /**
     * 修改用户信息
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Object updateUser(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId").trim();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String sex = request.getParameter("sex").trim();
        String phoneNum = request.getParameter("phoneNum").trim();
        String email = request.getParameter("email").trim();
        String birth = request.getParameter("birth").trim();
        String introduction = request.getParameter("introduction").trim();
        String location = request.getParameter("location").trim();
        String school = request.getParameter("school").trim();
        String identity = request.getParameter("identity").trim();
        if(username == null || username.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"用户名不能为空");
            return jsonObject;
        }
        if(password == null || password.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"密码不能为空");
            return jsonObject;
        }
        if(userService.getByUsername(username,Integer.parseInt(userId)) != null){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"用户名已存在");
            return jsonObject;
        }
        if(userService.ifExistPhoneNum(phoneNum,Integer.parseInt(userId))){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"该手机号已注册过");
            return jsonObject;
        }
        if(userService.ifExistEmail(email,Integer.parseInt(userId))){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"该邮箱已注册过");
            return jsonObject;
        }
        //把生日格式转换成Date格式
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = new Date();
        try {
            birthDate = dateFormat.parse(birth);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        User user = new User();
        user.setUserId(Integer.parseInt(userId));
        user.setUsername(username);
        user.setPassword(password);
        user.setSex(new Byte(sex));
        user.setPhoneNum(phoneNum);
        user.setEmail(email);
        user.setBirth(birthDate);
        user.setIntroduction(introduction);
        user.setLocation(location);
        user.setSchool(school);
        user.setIdentity(new Byte(identity));
        boolean flag = userService.update(user);
        if (flag) {
            jsonObject.put(Consts.CODE, 1);
            jsonObject.put(Consts.MSG, "修改成功");
            return jsonObject;
        } else {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "修改失败");
            return jsonObject;
        }
    }

    /**
     * 修改用户密码
     */
    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    public Object updateUserPassword(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId").trim();
        String password = request.getParameter("password").trim();
        if(password == null || password.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"密码不能为空");
            return jsonObject;
        }
        User user = new User();
        user.setUserId(Integer.parseInt(userId));
        user.setPassword(password);
        boolean flag = userService.update(user);
        if (flag) {
            jsonObject.put(Consts.CODE, 1);
            jsonObject.put(Consts.MSG, "修改成功");
            return jsonObject;
        } else {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "修改失败");
            return jsonObject;
        }
    }

    /**
     * 删除用户信息
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public Object deleteUser(HttpServletRequest request) {
        String userId = request.getParameter("userId").trim();
        String[] ids = userId.split(",");
        List<Integer> list = new ArrayList<>();
        for(String str:ids){
            list.add(Integer.parseInt(str));
        }
        boolean flag = userService.delete(list);
        return flag;
    }

    /**
     * 根据主键查询用户信息
     */
    @RequestMapping(value = "/selectByPrimaryKey", method = RequestMethod.GET)
    public Object selectByPrimaryKey(HttpServletRequest request) {
        String userId = request.getParameter("userId").trim();
        User user = userService.selectByPrimaryKey(Integer.parseInt(userId));
        System.out.println("username=>"+user.getUsername());
        return userService.selectByPrimaryKey(Integer.parseInt(userId));
    }

    /**
     * 查询所有前端用户
     */
    @RequestMapping(value = "/allUser", method = RequestMethod.GET)
    public Object allUser(HttpServletRequest request) {
        String username = request.getParameter("username").trim();
        String phoneNum = request.getParameter("phoneNum").trim();
        String email = request.getParameter("email").trim();
        return userService.allUser(username,phoneNum,email);
    }

    /**
     * 更新前端用户图片
     */
    @RequestMapping(value = "/updateUserPic", method = RequestMethod.POST)
    public Object updateUserPic(@RequestParam("file") MultipartFile avatorFile, @RequestParam("userId") int userId) {
        JSONObject jsonObject = new JSONObject();
        if (avatorFile.isEmpty()) {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "文件上传失败");
            return jsonObject;
        }
        //文件名=当前事件到到毫秒+原文件名
        String fileName = System.currentTimeMillis() + avatorFile.getOriginalFilename();
        //文件路径
        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator") + "avatorImages";
        //如果文件路径不存在，新增该路径
        File file1 = new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }
        //实际的文件地址
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        //存储到数据库的相对文件地址
        String storeAvatorPath = "/avatorImages/"+fileName;
        try {
            avatorFile.transferTo(dest);
            User user = new User();
            user.setUserId(userId);
            user.setAvator(storeAvatorPath);
            boolean flag = userService.update(user);
            if (flag){
                jsonObject.put(Consts.CODE, 1);
                jsonObject.put(Consts.MSG, "上传成功");
                jsonObject.put("avator",storeAvatorPath);
                return jsonObject;
            }
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "上传失败");
            System.out.println("上传失败2 => "+flag);
            return jsonObject;
        } catch (IOException e) {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "上传失败"+e.getMessage());
            System.out.println("上传失败3");
        } finally {
            return jsonObject;
        }
    }

    /**
     * 前端用户登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Object login(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String code = request.getParameter("code");
        String key = request.getParameter("key");

        String keyCode = (String) request.getServletContext().getAttribute(key);

        if(username == null || username.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"用户名不能为空");
            return jsonObject;
        }
        if(password == null || password.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"密码不能为空");
            return jsonObject;
        }

        //不考虑大小写比较生成的验证码和输入的验证码是否相同
        if (code.equalsIgnoreCase(keyCode)) {
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            boolean flag = userService.verifyPassword(username,password);
            if (flag) {
                jsonObject.put(Consts.CODE, 1);
                jsonObject.put(Consts.MSG, "登录成功");
                jsonObject.put("userMsg",userService.getByUsername(username,null));
                return jsonObject;
            }
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "用户名或密码错误");
            return jsonObject;
        } else {
            jsonObject.put(Consts.CODE, 2);
            jsonObject.put(Consts.MSG, "验证码错误");
            return jsonObject;
        }
    }

    /**
     * 后台管理员登录
     */
    @RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
    public Object adminLogin(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        if(username == null || username.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"用户名不能为空");
            return jsonObject;
        }
        if(password == null || password.equals("")){
            jsonObject.put(Consts.CODE,0);
            jsonObject.put(Consts.MSG,"密码不能为空");
            return jsonObject;
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        boolean flag = userService.verifyAdminPassword(username,password);
        if (flag) {
            jsonObject.put(Consts.CODE, 200);
            jsonObject.put(Consts.MSG, "登录成功");
            jsonObject.put("userMsg",userService.getByUsername(username,null));
            return jsonObject;
        }
        jsonObject.put(Consts.CODE, 401);
        jsonObject.put(Consts.MSG, "用户名或密码错误");
        return jsonObject;
    }

    /**
     * 查询男女用户数
     */
    @RequestMapping(value = "/sexRatio", method = RequestMethod.GET)
    public Object getSexRatio(HttpServletRequest request) {
        return userService.sexRatio();
    }

    /**
     * 生成验证码
     *
     * @throws IOException
     */
    @RequestMapping(value = "/getImage", method = RequestMethod.GET)
    public Map<String, String> getImage(HttpServletRequest request) throws IOException {
        Map<String, String> result = new HashMap<>();
        CreateImageCode createImageCode = new CreateImageCode();
        //获取验证码
        String securityCode = createImageCode.getCode();
        //验证码存入session
        String key = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        request.getServletContext().setAttribute(key, securityCode);
        //生成图片
        BufferedImage image = createImageCode.getBuffImg();
        //进行base64编码
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ImageIO.write(image, "png", bos);
        String string = Base64Utils.encodeToString(bos.toByteArray());
        result.put("key", key);
        result.put("image", string);
        return result;
    }
}
