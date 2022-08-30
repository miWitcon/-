package com.javaclimb.music.controller;

import com.alibaba.fastjson.JSONObject;
import com.javaclimb.music.domain.Rank;
import com.javaclimb.music.service.RankService;
import com.javaclimb.music.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;

@RestController
@RequestMapping("/rank")
public class RankController {
    @Autowired
    private RankService rankService;

    /**
     * 新增评分
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object add(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String songId = request.getParameter("songId");
        String userId = request.getParameter("userId");
        String score = request.getParameter("score");
        Rank rank = new Rank();
        rank.setSongId(Integer.parseInt(songId));
        rank.setUserId(Integer.parseInt(userId));
        rank.setScore(Integer.parseInt(score));

        Integer sc = rankService.selfRatedScore(Integer.parseInt(userId),Integer.parseInt(songId));
        boolean flag;
        if (sc == -1) {
            flag = rankService.insert(rank);
        } else {
            flag = rankService.updateScore(rank);
        }
        if(flag){
            jsonObject.put(Consts.CODE,1);
            jsonObject.put(Consts.MSG,"评价成功");
            return jsonObject;
        }
        jsonObject.put(Consts.CODE,0);
        jsonObject.put(Consts.MSG,"评价失败");
        return jsonObject;
    }

    /**
     * 查询自己评的分
     * @return
     */
    @RequestMapping(value = "/selfRatedScore",method = RequestMethod.GET)
    public int selfRatedScore(HttpServletRequest request){
        String songId = request.getParameter("songId");
        String userId = request.getParameter("userId");
        return rankService.selfRatedScore(Integer.parseInt(userId),Integer.parseInt(songId));
    }

    /**
     *计算平均分
     */
    @RequestMapping(value = "/aveRank",method = RequestMethod.GET)
    public Object rankOfSongListId(HttpServletRequest request){
        String songId = request.getParameter("songId");
        Float averScore = rankService.rankOfSongListId(Integer.parseInt(songId));
        System.out.println("ave=>"+averScore);
        DecimalFormat df = new DecimalFormat("#.0");
        return df.format(averScore);
    }
}
