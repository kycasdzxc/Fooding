package com.fd.restaurant.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.common.model.vo.Attachment;
import com.fd.restaurant.model.service.RestaurantService;
import com.fd.review.model.vo.Review;
import com.google.gson.Gson;

/**
 * Servlet implementation class RestReviewDatailController
 */
@WebServlet("/reviewDetail.re")
public class AjaxRestReviewDatailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxRestReviewDatailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		Review r = new RestaurantService().selectReviewDetail(reviewNo);
		ArrayList<Attachment> atList = new RestaurantService().selectReviewAttachment(reviewNo);
		
		//리뷰정보와 사진을 담을 set 객체
		ArrayList set = new ArrayList();
		set.add(r);
		for(Attachment at : atList) {
			set.add(at);
		}
		
		
		System.out.println(atList);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(set, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
