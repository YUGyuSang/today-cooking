package com.myspring.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.today.bookmark.BookmarkInnerDAO;
import com.myspring.today.bookmark.BookmarkInnerVO;
import com.myspring.today.bookmark.BookmarkOuterDAO;
import com.myspring.today.bookmark.BookmarkOuterVO;
import com.myspring.today.recipe.RecipeDAO;
import com.myspring.today.recipe.RecipeVO;

@Controller
public class BookmarkController {
	@Autowired
	BookmarkOuterDAO outerDAO;
	@Autowired
	BookmarkInnerDAO innerDAO;
	@Autowired
	RecipeDAO recipeDAO;

	// 내부 북마크 등록
	@RequestMapping(value = "/insertBookmarkInner.do")
	public String getRankingList(BookmarkInnerVO invo, HttpSession session, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String loginId = (String) session.getAttribute("loginId");
		int recipeId=invo.getRecipeId();
		if (loginId == null) {
			out.println("<script>alert('로그인이 필요한 기능입니다.');</script>");
			out.flush();
			return "login.jsp";
		} else {
			invo.setUserId(loginId);
			innerDAO.insertBookmarkInner(invo);
			recipeDAO.upBookmarkCount(recipeId);
			out.println("<script>alert('북마크 완료'); </script>");
			out.flush();
			return "getRecipe.do?recipeId="+recipeId;
		}
	}

	// 외부 북마크 등록
	@RequestMapping(value = "/insertBookmarkOuter.do")
	public String getRankingList(BookmarkOuterVO otvo, HttpSession session, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String loginId = (String) session.getAttribute("loginId");
		if (loginId == null) {
			out.println("<script>alert('로그인이 필요한 기능입니다.');</script>");
			out.flush();
			return "login.jsp";
		}else {
			otvo.setUserId(loginId);
			int check = outerDAO.checkBookmarkOuter(otvo); // 북마크 중복 체크
			if (check > 0) {
				out.println("<script>alert('이미 등록된 북마크입니다.'); history.go(-1);</script>");
				return null;
			} else {
				outerDAO.insertBookmarkOuter(otvo);
				out.println("<script>alert('북마크 완료'); history.go(-1);</script>");
				out.flush();
				return null;
			}
		}		
	}

	// 북마크 리스트
	@RequestMapping(value = "/getBookmarkList.do")
	public ModelAndView getBookmarkList(HttpSession session, ModelAndView mv) {
		String userId = (String) session.getAttribute("loginId");
		List<BookmarkInnerVO> innerList = innerDAO.getBookmarkInner(userId);
		List<RecipeVO> recipeList = new ArrayList<RecipeVO>();
		int i;
		for (i = 0; i < innerList.size(); i++) {
			int recipeId = innerList.get(i).getRecipeId();
			recipeList.add(recipeDAO.getRecipe(recipeId));
		}
		List<BookmarkOuterVO> outerList = outerDAO.getBookmarkOuter(userId);
		mv.addObject("recipeList", recipeList);
		mv.addObject("outerList", outerList);
		mv.setViewName("getBookmarkList.jsp");
		return mv;
	}

	// 내부 북마크 삭제
	@RequestMapping(value = "/deleteBookmarkInner.do")
	public String deleteBookmarkOuter(BookmarkInnerVO invo, HttpSession session,HttpServletResponse response) throws IOException {
		String userId = (String) session.getAttribute("loginId");
		invo.setUserId(userId);
		int recipeId=invo.getRecipeId();
		innerDAO.deleteBookmarkInner(invo);
		recipeDAO.downBookmarkCount(recipeId);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('북마크 삭제 완료');</script>");
		out.flush();
		return "getRecipe.do?recipeId="+recipeId;
	}

	// 외부 북마크 삭제
	@RequestMapping(value = "/deleteBookmarkOuter.do")
	public String deleteBookmarkOuter(BookmarkOuterVO otvo, HttpServletResponse response) throws IOException {
		outerDAO.deleteBookmarkOuter(otvo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('북마크 삭제 완료');</script>");
		out.flush();
		return "getBookmarkList.do";
	}
}
