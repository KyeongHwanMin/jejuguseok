package jejuguseok_map;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/*
 * 숙소 Bean: 유형/지역별 분류 
 * 1 유형: 모텔, 게스트하우스, 펜션, 호텔
 * 2 지역: 제주시, 서귀포시, 중문, 제주국제공항, 애월/한림/협재, 표선/상산, 함덕/김녕/세화
 */
@Controller
public class homeBean {

	@Autowired
	private SqlSessionTemplate dao =null;
	
//	숙소 검색 
	@RequestMapping("search.do")
	public String search() {

		return "/userpage/home/search.jsp";
	}	

//	숙소 이미지파일 저장 및 DB 업로드
	
	@RequestMapping("homeForm.do")
	public String uploadForm() {

		return "/adminpage/upload/homeForm.jsp"; 
	}
	@RequestMapping("homePro.do")
	public String homePro(String name, String address, String content, String category, 
			String location, String x, String y, String type, MultipartHttpServletRequest ms) {
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
		lo.setName(name);		
		lo.setAddress(address);
		lo.setContent(content);
		lo.setLocation(location);
		lo.setCategory(category);
		lo.setX(x);
		lo.setY(y);
		lo.setType(type);
		lo.setImg(img);
		lo.setCategory(category);
	
		dao.insert("item.insertHome",lo);
		System.out.println(f);
		return "/adminpage/upload/homePro.jsp";
	}	

	// -----------정현서 추가----------------------
	
		// 숙소 정보 수정 
		@RequestMapping("homeUpdate.do")
		public String homeUpdate(String home_no,  Model model) {
				
			homeDTO dto = new homeDTO();
			dto = dao.selectOne("home.homeInfo", home_no);
			model.addAttribute("dto", dto);
			
			
			return "/adminpage/upload/homeUpdate.jsp"; 
		}
		
		
		// 숙소 정보 수정 
		@RequestMapping("homeUpdatePro.do")
		public String homeUpdatePro(Model model, HttpServletRequest request) {
				
			String home_name = request.getParameter("home_name");
			String home_address = request.getParameter("home_address");
			String home_content = request.getParameter("home_content");
			String x = request.getParameter("x");
			String y =  request.getParameter("y");
			String home_type = request.getParameter("home_type");
			String home_local = request.getParameter("home_local");
			
			homeDTO dto = new homeDTO();
			System.out.println("dto====="+dto);
			dto.setHome_name(home_name);
			dto.setHome_address(home_address);
			dto.setHome_content(home_content);
			dto.setX(x);
			dto.setY(y);
			dto.setHome_type(home_type);
			dto.setHome_local(home_local);
			
			dao.update("home.homeUpdate", dto);
			
			
			return "/adminpage/upload/homeUpdatePro.jsp"; 
		}
		
		
		
		
		// 숙소 삭제 
		@RequestMapping("homeDelete.do")
		public String homeDelete( HttpServletRequest request, Model model) {
				
			String home_no = request.getParameter("home_no");
			model.addAttribute("home_no", home_no);
			
			return "/adminpage/upload/homeDelete.jsp"; 
		}
		
		
		@RequestMapping("homeDeletePro.do")
		public String homeDeletePro( HttpServletRequest request, Model model) {
				
			String home_no = request.getParameter("home_no");
			dao.delete("home.deletehome", home_no);
			
			return "/adminpage/upload/homeDeletePro.jsp"; 
		}
		
		
		
		
		
	}
	
