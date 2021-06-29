package kr.co.mlec.reply.dao;

import java.util.List;

import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.reply.vo.ReplyVO;

public interface ReplyDAO {
	
	public void insert(ReplyVO replyVO);
	
	public void delete(int boardno);
	
	public ReplyVO read(String placeID);
	
	public List<ReplyVO> selectAll(String placeID);

}