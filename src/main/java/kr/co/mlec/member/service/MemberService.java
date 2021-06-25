package kr.co.mlec.member.service;

import java.util.List;

import kr.co.mlec.member.vo.MemberVO;

public interface MemberService {
	
	/**
	 * login 서비스
	 */
	public MemberVO login(MemberVO loginVO);

	/**
	 * 회원 등록
	 */

	public void registerMember(MemberVO member) throws Exception;
	
	/**
	 * 상세 회원정보 조회
	 */
	public MemberVO getUser(String id) throws Exception;
	
	/**
	 * 회원 업데이트
	 */
	public void updateUser(MemberVO member) throws Exception;
//	/**
//	 * 전체회원 조회
//	 */
//	public List<MemberVO> selectAllMember();
//	
//	
//	/**
//	 * 회원 삭제
//	 */
//	public void deleteMember(int no);
//	
///	
//	/**
//	 * 아이디 중복검사
//	 */
//	public int idChk(MemberVO member);
//	

}
