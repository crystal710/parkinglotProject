package kr.co.mlec.reply.service;

import java.util.List;

import kr.co.mlec.reply.vo.ReplyVO;

public interface ReplyService {

	public void insertReply(ReplyVO replyVO);
	
	public void deleteReply(String placeID);
	
	public ReplyVO getUser(String placeID) throws Exception;
	
	public List<ReplyVO> selectReplyByBoardNo(String placeID);
}