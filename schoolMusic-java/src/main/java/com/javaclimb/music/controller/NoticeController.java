package com.javaclimb.music.controller;

import com.alibaba.fastjson.JSONObject;
import com.javaclimb.music.domain.Notice;
import com.javaclimb.music.service.NoticeService;
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
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    /**
     * 添加公告
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object addNotice(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String updateTime = request.getParameter("updateTime");
        String endTime = request.getParameter("endTime");

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date beginData = new Date();
        Date endData = new Date();
        try {
            beginData = dateFormat.parse(updateTime);
            endData = dateFormat.parse(endTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Notice notice = new Notice();
        notice.setUserId(Integer.parseInt(userId));
        notice.setTitle(title);
        notice.setContent(content);
        notice.setUpdateTime(beginData);
        notice.setEndTime(endData);
        boolean flag = noticeService.insert(notice);
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
     * 根据noticeId删除公告
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public Object deleteNotice(HttpServletRequest request) {
        String noticeId = request.getParameter("noticeId").trim();
        String[] ids = noticeId.split(",");
        List<Integer> list = new ArrayList<>();
        for(String str:ids){
            list.add(Integer.parseInt(str));
        }
        boolean flag = noticeService.delete(list);
        return flag;
    }

    /**
     * 修改公告
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Object updateUserPassword(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String noticeId = request.getParameter("noticeId").trim();
        String userId = request.getParameter("userId").trim();
        String title = request.getParameter("title").trim();
        String content = request.getParameter("content").trim();
        String updateTime = request.getParameter("updateTime").trim();
        String endTime = request.getParameter("endTime").trim();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date beginData = new Date();
        Date endData = new Date();
        try {
            beginData = dateFormat.parse(updateTime);
            endData = dateFormat.parse(endTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Notice notice = new Notice();
        notice.setNoticeId(Integer.parseInt(noticeId));
        notice.setUserId(Integer.parseInt(userId));
        notice.setTitle(title);
        notice.setContent(content);
        notice.setUpdateTime(beginData);
        notice.setEndTime(endData);
        boolean flag = noticeService.update(notice);
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
     * 查询所有公告
     */
    @RequestMapping(value = "/allNotice", method = RequestMethod.GET)
    public Object allNotice(HttpServletRequest request) {
        String title = request.getParameter("title").trim();
        return noticeService.allNotice(title);
    }

}
