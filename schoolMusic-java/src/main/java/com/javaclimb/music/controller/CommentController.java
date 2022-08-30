package com.javaclimb.music.controller;

import com.alibaba.fastjson.JSONObject;
import com.javaclimb.music.domain.Comment;
import com.javaclimb.music.service.CommentService;
import com.javaclimb.music.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 评论控制类
 */
@RestController
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    /**
     * 添加评论
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object addComment(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId");
        String type = request.getParameter("type");
        String songId = request.getParameter("songId");
        String content = request.getParameter("content");

//        保存到评论的对象中
        Comment comment = new Comment();
        comment.setUserId(Integer.parseInt(userId));
        comment.setType(new Byte(type));
        if (new Byte(type) == 0){
            comment.setSongId(Integer.parseInt(songId));
        }
        comment.setContent(content);
        boolean flag = commentService.insert(comment);
        if (flag) {
            jsonObject.put(Consts.CODE, 1);
            jsonObject.put(Consts.MSG, "评论成功");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE, 0);
        jsonObject.put(Consts.MSG, "评论失败");
        return jsonObject;
    }

    /**
     * 修改评论
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Object updateComment(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String commentId = request.getParameter("commentId").trim();
        String userId = request.getParameter("userId").trim();
        String type = request.getParameter("type").trim();
        String songId = request.getParameter("songId").trim();
        String content = request.getParameter("content").trim();

        Comment comment = new Comment();
        comment.setCommentId(Integer.parseInt(commentId));
        comment.setUserId(Integer.parseInt(userId));
        comment.setType(new Byte(type));
        comment.setSongId(Integer.parseInt(songId));
        comment.setContent(content);

        boolean flag = commentService.update(comment);
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
     * 删除评论
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public Object deleteComment(HttpServletRequest request) {
        String commentId = request.getParameter("commentId").trim();
        String[] ids = commentId.split(",");
        List<Integer> list = new ArrayList<>();
        for(String str:ids){
            list.add(Integer.parseInt(str));
        }
        boolean flag = commentService.delete(list);
        return flag;
    }

    /**
     * 根据主键查询整个对象
     */
    @RequestMapping(value = "/selectByPrimaryKey", method = RequestMethod.GET)
    public Object selectByPrimaryKey(HttpServletRequest request) {
        String commentId = request.getParameter("commentId").trim();
        return commentService.selectByPrimaryKey(Integer.parseInt(commentId));
    }

    /**
     * 查询所有评论
     */
    @RequestMapping(value = "/allComment", method = RequestMethod.GET)
    public Object allComment(HttpServletRequest request) {
        return commentService.allComment();
    }

    /**
     * 查询某歌曲下的所有评论
     */
    @RequestMapping(value = "/commentOfSongId", method = RequestMethod.GET)
    public Object commentOfSongId(HttpServletRequest request) {
        String songId = request.getParameter("songId").trim();
        return commentService.commentOfSongId(Integer.parseInt(songId));
    }

    /**
     * 给某个评论点赞
     */
    @RequestMapping(value = "/like", method = RequestMethod.POST)
    public Object like(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String commentId = request.getParameter("commentId").trim();
        String up = request.getParameter("up").trim();

        Comment comment = new Comment();
        comment.setCommentId(Integer.parseInt(commentId));
        comment.setUp(Integer.parseInt(up));

        boolean flag = commentService.update(comment);
        if (flag) {
            jsonObject.put(Consts.CODE, 1);
            jsonObject.put(Consts.MSG, "点赞成功");
            return jsonObject;
        } else {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "点赞失败");
            return jsonObject;
        }
    }

}
