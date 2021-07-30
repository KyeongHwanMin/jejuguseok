package jejuguseok_map;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import jejuguseok_map.locationDTO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
관광지 Bean: 역사문화, 자연경치, 레저체험학습, 휴식힐링
list1: 관광지 메인(form) 페이지
list2: 관광지 pro 페이지 

 * 페이징 요약 
- 현재 페이지(current page = 클릭한 페이지) 
- String pageNum ~ : 첫 페이지 1(1~10 해당 페이지 받기) 
- if (pageNum == null) ~:  페이지 입력 x >  1페이지, 입력 시 null=if문 동작 안함 
- int startRow ~:  (1-1) * 10 + 1 = 1
- int endRow ~: 1 * 10 = 10
- int count = 0; 전체 관광지 수
- int number= 0; 화면에 보이는 게시물 번호. 
  입력된 번호가 아니며 삭제되면 시퀀스는 emty 번호를 체크하지 않는다 즉, 입력된 번호가 아닌 게시물 등록할 떄만 보이는 번호	
- HashMap Row = new HashMap(); : sql에 HashMap 사용해서 startRow / endRow 이름으로 값을 보낸다. 
 */
@Controller
public class attractionBean {

	
	@Autowired
	private SqlSessionTemplate dao =null;	
	
	
//	관광지 북마크: attform에서 찜하기 클릭 시 해당 페이지 이동 후 복귀(알럿기능) 
	@RequestMapping("attbook.do") 
	public String attbook(Model model, locationDTO dto, int no,  String name, String category,
			HttpSession session)  throws Exception{
		
		String id =(String)session.getAttribute("user_id");
		System.out.println("관광지 번호: "+no);
		System.out.println("관광지 유형: "+category);
		System.out.println("관광지 이름: "+name);
		
		locationDTO att = new locationDTO();
		attBkDTO attBkDTO = new attBkDTO();
		att = dao.selectOne("att.selectAtt", no);
		
		attBkDTO.setUSER_ID(id);
		attBkDTO.setPLACE_NO(no);
		
		attBkDTO.setPLACE_NAME(att.getName());
		attBkDTO.setPLACE_ADDRESS(att.getAddress());
		attBkDTO.setPLACE_CATEGORY(att.getCategory());
		attBkDTO.setPLACE_CONTENT(att.getContent());
		attBkDTO.setPLACE_LOCAL(att.getLocation());
	
		dao.insert("att.insertAttmk", attBkDTO);
		
		return "/userpage/attraction/attBookMark.jsp";
	}
	
//	북마킹한 관광지 리스트 mypage에서 노출 
	@RequestMapping("myAtt.do")
	public String myAccom(String user_id, Model model, HttpSession session) {
		
		String id =(String) session.getAttribute("user_id");
		System.out.println("아이디 확인: "+id);
		
		int count = 0;
		attBkDTO attBkDTO = new attBkDTO();
		model.addAttribute("count", count);
		count = dao.selectOne("att.attCount", id);
		List myAttList = dao.selectList("att.myAtt", id);
		model.addAttribute("myAttList",myAttList);
		
		return "/userpage/attraction/myAttraction.jsp";
	}
	
	//북마킹 해제(mypage에서)  
	@RequestMapping("myAttDelete.do")
	public String myAccomDeletePro( String no, String name, HttpSession session,HttpServletRequest request)  throws Exception{
		
		dao.delete("att.deleteMyAtt", no);
		System.out.println("북마킹 해제: "+ no +name);
		
		return "/userpage/mypage/myAttDelete.jsp"; 
	}
	
//	관광지 검색 (지역, 카테고리로 검색) + 페이징 
	@RequestMapping("attForm.do")
	public String SearchForm(Model model, HttpServletRequest request) {
		
		int pageSize = 10;	
		
		String pageNum = request.getParameter("pageNum");	
		if (pageNum == null) { 
		    pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);		
		int startRow = (currentPage - 1) * pageSize + 1;	
		int endRow = currentPage * pageSize;				
		int count = 0;	
		int number= 0;

		List attList = null;
		count = dao.selectOne("att.attcount");
		
		System.out.println("페이징 체크: "+count);
		
		HashMap Row = new HashMap();  
		Row.put("startRow", startRow);
		Row.put("endRow", endRow);

		if (count > 0) {
			attList = dao.selectList("att.attList", Row);
		}
		
		System.out.println("관광지 리스트: "+ attList);
		number=count-(currentPage-1)*pageSize;			
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("attList", attList); 
		model.addAttribute("pageNum", pageNum);

		List list1 = dao.selectList("item.searchAttraction"); 
		model.addAttribute("list1",list1);	

		return "/userpage/attraction/attractionSearchForm.jsp"; 
	}
	
//  관광지 DB 불러오기 
	@RequestMapping("attPro.do")								  		
	public String attractionSearch_local(Model model, 
			HttpServletRequest request) throws IOException {
	
		int sea1 = Integer.parseInt(request.getParameter("search1"));
		String search1="제주시";
		
		if(sea1 == 2){
			search1="서귀포시";
			List list2 = dao.selectList("att.seoquiposi"); 
			 model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
		
		}else if(sea1==3){
			search1="중문";
			List list2 = dao.selectList("att.jungmun"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea1==4){
			search1="제주국제공항";
			List list2 = dao.selectList("att.jejuairport"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}else if(sea1==5){
			search1="애월/한림/협재";
			List list2 = dao.selectList("att.aweol"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}else if(sea1==6){
			search1="표선/상산";
			List list2 = dao.selectList("att.pyoseon"); 
			model.addAttribute("list2",list2);
			
			return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea1==7){ 
			search1="함덕/김녕/세화";
			List list2 = dao.selectList("att.hamduk"); 
			model.addAttribute("list2",list2);
			
			return "/userpage/attraction/attractionSearchPro.jsp";
		}
		List list2 = dao.selectList("att.jejusi"); 
		model.addAttribute("list2",list2);
		 
		return "/userpage/attraction/attractionSearchPro.jsp";
	}
	
//	관광지 이미지파일 저장 및 Db 업로드 
	
	@RequestMapping("attractionForm.do")
	public String uploadForm() {
		
		return "/adminpage/upload/attractionForm.jsp"; 
	}
	@RequestMapping("attractionPro.do")
	public String pro(String name, String address, String x, String y, String content, 
			String location, String category, String type, MultipartHttpServletRequest ms) {
		MultipartFile mf = ms.getFile("img"); // 파일 원본
		String fileName = mf.getOriginalFilename(); // 파일 원본 이름
		File f = new File("/WEB-INF/userpage/save"+fileName); // 복사 위치
		
		try {
			mf.transferTo(f); // 복사
		}catch(Exception e) {
			e.printStackTrace();
		}
		ms.setAttribute("filename",fileName);
		
		Object img1 = (Object)f;
		String img = String.valueOf(img1);
		
		locationDTO lo = new locationDTO();
		lo.setAddress(address);
		lo.setCategory(category);
		lo.setContent(content);
		lo.setImg(img);
		lo.setLocation(location);
		lo.setName(name);
		lo.setType(type);
		lo.setX(x);
		lo.setY(y);
		dao.insert("item.insertAtt",lo);
		System.out.println(f);
		return "/adminpage/upload/attractionPro.jsp";
	}

//	6. 찜한 관광지 노출 (mypage에서) 	
	@RequestMapping("myAttraction.do")
	public String myAttraction(String name, String address, String category) {
		
		return "/userpage/attraction/myAttraction.jsp";
	}
	
// 	관광지 수정 (관리자ID) 
	@RequestMapping("attUpdate.do")
	public String attUpdate(String name, String address, String category) {
		
		homeDTO dto = new homeDTO();
	//	dto = dao.selectOne("home.homeInfo", home_no);
	//	model.addAttribute("dto", dto);
		
		return "/adminpage/upload/attUpdate.jsp";
	}
}
	

