package kr.co.mlec.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVO login(MemberVO loginVO) {
		MemberVO member =sqlSession.selectOne("member.dao.MemberDAO.login", loginVO);
		return member;
	}

	@Override
	public void register(MemberVO registerVO) throws Exception{
		sqlSession.insert("member.dao.MemberDAO.insert",registerVO);
	}

	@Override
	public MemberVO read(String id) {
		MemberVO member = sqlSession.selectOne("member.dao.MemberDAO.selectUserById",id);
		return member;
	}

	@Override
	public void update(MemberVO member) throws Exception {
		sqlSession.update("member.dao.MemberDAO.updateUser",member);
		
	}

}
