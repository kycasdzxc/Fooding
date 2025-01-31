package com.fd.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.book.model.service.BookService;
import com.fd.book.model.vo.Book;
import com.fd.member.model.vo.Member;

/**
 * Servlet implementation class BookCancelController
 */
@WebServlet("/cancel.bo")
public class BookCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCancelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		int payPoint = Integer.parseInt(request.getParameter("payPoint"));
		int savePoint = Integer.parseInt(request.getParameter("savePoint"));
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		Book b = new BookService().bookCancel(bookNo, payPoint, savePoint, userNo);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
