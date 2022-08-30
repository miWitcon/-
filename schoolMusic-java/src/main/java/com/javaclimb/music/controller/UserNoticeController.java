package com.javaclimb.music.controller;

import com.alibaba.fastjson.JSONObject;
import com.javaclimb.music.domain.Notice;
import com.javaclimb.music.domain.UserNotice;
import com.javaclimb.music.service.UserNoticeService;
import com.javaclimb.music.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/userNotice")
public class UserNoticeController {
    @Autowired
    private UserNoticeService userNoticeService;

    /**
     * 添加公告
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object addUserNotice(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId");

        String[] ids = userId.split(",");
        List<Integer> list = new ArrayList<>();
        for(String str:ids){
            list.add(Integer.parseInt(str));
        }
        boolean flag = userNoticeService.insert(list,userNoticeService.maxNoticeId(),null);
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
     * 查询该用户的所有公告信息
     */
    @RequestMapping(value = "/allNotice", method = RequestMethod.GET)
    public Object allNotice(HttpServletRequest request) {
        String userId = request.getParameter("userId").trim();
        return userNoticeService.noticeOfUser(Integer.parseInt(userId));
    }

    /**
     * 查询该用户的未读消息数
     */
    @RequestMapping(value = "/unReadNum", method = RequestMethod.GET)
    public Object unReadNum(HttpServletRequest request) {
        String userId = request.getParameter("userId").trim();
        return userNoticeService.unReadNum(Integer.parseInt(userId));
    }

    /**
     * 公告转成已读状态
     */
    @RequestMapping(value = "/turnRead", method = RequestMethod.GET)
    public Object turnRead(HttpServletRequest request) {
        String id = request.getParameter("id").trim();
        String[] ids = id.split(",");
        List<Integer> list = new ArrayList<>();
        for(String str:ids){
            list.add(Integer.parseInt(str));
        }
        return userNoticeService.turnRead(list);
    }

    /**
     * 删除个人公告消息
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public Object deleteNotice(HttpServletRequest request) {
        String id = request.getParameter("id").trim();
        return userNoticeService.delete(Integer.parseInt(id));
    }

}
