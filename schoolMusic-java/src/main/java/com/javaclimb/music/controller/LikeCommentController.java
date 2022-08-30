package com.javaclimb.music.controller;

import com.alibaba.fastjson.JSONObject;
import com.javaclimb.music.domain.Comment;
import com.javaclimb.music.domain.LikeComment;
import com.javaclimb.music.service.CommentService;
import com.javaclimb.music.service.LikeCommentService;
import com.javaclimb.music.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/likeComment")
public class LikeCommentController {

    @Autowired
    private LikeCommentService likeCommentService;

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/allLikeComment", method = RequestMethod.GET)
    public Object addLikeComment(HttpServletRequest request) {
        String userId = request.getParameter("userId");
        return likeCommentService.allLike(Integer.parseInt(userId));
    }

    @RequestMapping(value = "/likeUp", method = RequestMethod.POST)
    public Object likeUp(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId");
        String commentId = request.getParameter("commentId");
        String up = request.getParameter("up").trim();

        Comment comment = new Comment();
        comment.setCommentId(Integer.parseInt(commentId));
        LikeComment likeComment = likeCommentService.select(Integer.parseInt(userId),Integer.parseInt(commentId));
        if(likeComment == null || likeComment.equals("")){
            LikeComment addLikeComment = new LikeComment();
            addLikeComment.setUserId(Integer.parseInt(userId));
            addLikeComment.setCommentId(Integer.parseInt(commentId));
            boolean flag = likeCommentService.insert(addLikeComment);
            comment.setUp(Integer.parseInt(up)+1);
            boolean flag2 = commentService.update(comment);
            if (flag&&flag2) {
                jsonObject.put(Consts.CODE, 1);
                jsonObject.put(Consts.MSG, "点赞成功");
                return jsonObject;
            }
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "点赞成功");
            return jsonObject;
        } else if(likeComment.getState() == 0){
            boolean flag = likeCommentService.update(Integer.parseInt(userId),Integer.parseInt(commentId));
            comment.setUp(Integer.parseInt(up)+1);
            boolean flag2 = commentService.update(comment);
            if (flag&&flag2) {
                jsonObject.put(Consts.CODE, 1);
                jsonObject.put(Consts.MSG, "再点赞成功");
                return jsonObject;
            }
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "再点赞失败");
            return jsonObject;
        } else if(likeComment.getState() == 1){
            boolean flag = likeCommentService.delete(Integer.parseInt(userId),Integer.parseInt(commentId));
            comment.setUp(Integer.parseInt(up)-1);
            boolean flag2 = commentService.update(comment);
            if (flag&&flag2) {
                jsonObject.put(Consts.CODE, 1);
                jsonObject.put(Consts.MSG, "取消成功");
                return jsonObject;
            }
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "取消失败");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE, 0);
        jsonObject.put(Consts.MSG, "操作失败");
        return jsonObject;
    }


}
