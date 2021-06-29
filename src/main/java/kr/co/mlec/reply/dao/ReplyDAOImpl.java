package kr.co.mlec.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReplyVO> selectAll(String placeID) {
		List<ReplyVO> list = sqlSession.selectList("reply.dao.ReplyDAO.selectAll",placeID);
		return list;
	}
	
	@Override
	public void insert(ReplyVO replyVO) {
		sqlSession.insert("reply.dao.ReplyDAO.insert", replyVO);
	}
	@Override
	public void delete(int boardno) {
		sqlSession.delete("reply.dao.ReplyDAO.delete", boardno);
	}
	
	@Override
	public ReplyVO read(String placeID) {
		ReplyVO reply = sqlSession.selectOne("reply.dao.ReplyDAO.selectUserByPlaceID",placeID);
		return reply;
	}

}