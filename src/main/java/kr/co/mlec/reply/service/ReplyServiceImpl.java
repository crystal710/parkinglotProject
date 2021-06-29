package kr.co.mlec.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.reply.dao.ReplyDAO;
import kr.co.mlec.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public List<ReplyVO> selectReplyByBoardNo(String placeID) {
		List<ReplyVO> list = replyDAO.selectAll(placeID);
		return list;
	}
	
	@Override
	public void insertReply(ReplyVO replyVO) {
		
		replyDAO.insert(replyVO);
	}
	
	@Override
	public ReplyVO getUser(String placeID) throws Exception{
		ReplyVO reply = replyDAO.read(placeID);
		return reply;
	}
	
	@Override
	public void deleteReply(int boardno) {
		replyDAO.delete(boardno);
	}
	
	

}