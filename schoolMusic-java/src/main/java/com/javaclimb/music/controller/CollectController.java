package com.javaclimb.music.controller;

import com.alibaba.fastjson.JSONObject;
import com.javaclimb.music.domain.Collect;
import com.javaclimb.music.service.CollectService;
import com.javaclimb.music.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 收藏控制类
 */
@RestController
@RequestMapping("/collect")
public class CollectController {
    @Autowired
    private CollectService collectService;

    /**
     * 添加收藏
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object addCollect(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId");
        String type = request.getParameter("type");
        String songId = request.getParameter("songId");
        if(songId == null || songId.equals("")){
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "收藏歌曲为空");
            return jsonObject;
        }
        if(collectService.exitSongId(Integer.parseInt(userId),Integer.parseInt(songId))){
            boolean isDelete = collectService.deleteByUserIdSongId(Integer.parseInt(userId),Integer.parseInt(songId));
            if (isDelete) {
                jsonObject.put(Consts.CODE, 2);
                jsonObject.put(Consts.MSG, "已取消收藏！");
                return jsonObject;
            }
        } else if (collectService.isDeleted(Integer.parseInt(userId),Integer.parseInt(songId))){
            boolean againCol = collectService.update(Integer.parseInt(userId),Integer.parseInt(songId));
            if (againCol) {
                jsonObject.put(Consts.CODE, 1);
                jsonObject.put(Consts.MSG, "再次收藏成功！");
                return jsonObject;
            }
        } else {
            //        保存到收藏的对象中
            Collect collect = new Collect();
            collect.setUserId(Integer.parseInt(userId));
            collect.setType(new Byte(type));
            collect.setSongId(Integer.parseInt(songId));
            boolean flag = collectService.insert(collect);
            if (flag) {
                jsonObject.put(Consts.CODE, 1);
                jsonObject.put(Consts.MSG, "收藏成功");
                return jsonObject;
            }
        }
        jsonObject.put(Consts.CODE, 0);
        jsonObject.put(Consts.MSG, "收藏失败");
        return jsonObject;
    }

    /**
     * 根据collectId删除收藏
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public Object deleteCollect(HttpServletRequest request) {
        String collectId = request.getParameter("collectId").trim();
        boolean flag = collectService.delete(Integer.parseInt(collectId));
        return flag;
    }

    /**
     * 删除收藏
     */
    @RequestMapping(value = "/deleteByUserIdSongId", method = RequestMethod.GET)
    public Object deleteByUserIdSongId(HttpServletRequest request) {
        String userId = request.getParameter("userId");
        String songId = request.getParameter("songId");
        boolean flag = collectService.deleteByUserIdSongId(Integer.parseInt(userId),Integer.parseInt(songId));
        return flag;
    }

    /**
     * 查询所有收藏
     */
    @RequestMapping(value = "/allCollect", method = RequestMethod.GET)
    public Object allCollect(HttpServletRequest request) {
        return collectService.allCollect();
    }

    /**
     * 查询某个用户的收藏列表
     */
    @RequestMapping(value = "/collectOfUserId", method = RequestMethod.GET)
    public Object collectOfUserId(HttpServletRequest request) {
        String userId = request.getParameter("userId").trim();
        return collectService.collectOfUserId(Integer.parseInt(userId));
    }

    /**
     * 查询某个用户的收藏列表
     */
    @RequestMapping(value = "/isCollect", method = RequestMethod.GET)
    public Object isCollect(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId").trim();
        String songId = request.getParameter("songId").trim();
        if(collectService.exitSongId(Integer.parseInt(userId),Integer.parseInt(songId))){
            jsonObject.put(Consts.CODE, 1);
            jsonObject.put(Consts.MSG, "已收藏");
            return jsonObject;
        } else {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "未收藏");
            return jsonObject;
        }
    }
}
