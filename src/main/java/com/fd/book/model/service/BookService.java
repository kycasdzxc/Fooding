package com.fd.book.model.service;

import static com.fd.common.JDBCTemplate.close;
import static com.fd.common.JDBCTemplate.commit;
import static com.fd.common.JDBCTemplate.getConnection;
import static com.fd.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fd.book.model.dao.BookDao;
import com.fd.book.model.vo.Book;
import com.fd.book.model.vo.BookMenu;
import com.fd.book.model.vo.Payment;
import com.fd.book.model.vo.Point;
import com.fd.common.model.vo.Attachment;
import com.fd.restaurant.model.vo.Menu;
import com.fd.restaurant.model.vo.Restaurant;
import com.fd.review.model.vo.Review;

public class BookService {

	/**
	 * @param 김태진
	 * 예약 전체 서비스 기능
	 */
	
	// 업체 조회수 증가
	public int selectCountUp(int resNo) {
		Connection conn = getConnection();
		int result = new BookDao().selectCountUp(conn, resNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 업체 정보 조회
	public Restaurant selectRes(int resNo) {
		Connection conn = getConnection();
		Restaurant re = new BookDao().selectRes(conn, resNo);
		close(conn);
		return re;
	}

	// 업체 메뉴 정보 조회
	public ArrayList<Menu> selectMenu(int resNo) {
		Connection conn = getConnection();
		ArrayList<Menu> list = new BookDao().selectMenu(resNo, conn);
		close(conn);
		return list;
	}

	// 예약 번호 조회
	public int selectBookNo() {
		Connection conn = getConnection();
		int result = new BookDao().selectBookNo(conn);
		close(conn);
		return result;
	}

	// 로그인 유저 포인트 조회
	public int selectPoint(int userNo) {
		Connection conn = getConnection();
		int pointNow = new BookDao().selectPoint(conn, userNo);
		close(conn);
		return pointNow;
	}

	// 예약 등록
	public void insertBook(Book book, Payment payment, Point point, String[] menuName, String[] menuQuantity) {
		Connection conn = getConnection();
		int insertBook = new BookDao().insertBook(conn, book);
		int insertBookMenu = new BookDao().insertBookMenu(conn, menuName, menuQuantity);
		int insertPayment = new BookDao().insertPayment(conn, payment);
		int insertPayPoint = 1;
		if(payment.getPayPoint() > 0) {
			insertPayPoint = new BookDao().insertPayPoint(conn, point);
		}
		int insertSavePoint = new BookDao().insertSavePoint(conn, point);
		if(insertBook * insertBookMenu * insertPayment * insertSavePoint * insertPayPoint > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}

	// 리뷰 리스트 조회
	public ArrayList<Review> selectReview(int resNo) {
		Connection conn = getConnection();
		ArrayList<Review> list = new BookDao().selectReview(resNo, conn);
		close(conn);
		return list;
	}

	// 업체 전체 리뷰 정보 조회(별점, 리뷰 수)
	public Review selectReviewData(int resNo) {
		Connection conn = getConnection();
		Review review = new BookDao().selectReviewData(resNo, conn);
		close(conn);
		return review;
	}

	// 리뷰 이미지 조회
	public ArrayList<Attachment> selectAttachment(ArrayList<Review> reviewList, int resNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> attachment = new BookDao().selectAttachment(reviewList, resNo, conn);
		close(conn);
		return attachment;
	}

	// 예약 리스트 조회
	public ArrayList<Book> selectBookList(int userNo) {
		Connection conn = getConnection();
		ArrayList<Book> list = new BookDao().selectBookList(userNo, conn);
		close(conn);
		return list;
	}

	// 예약 상세 조회
	public Book selectBook(int bookNo) {
		Connection conn = getConnection();
		Book book = new BookDao().selectBook(conn, bookNo);
		close(conn);
		return book;
	}

	// 예약 취소
	public Book bookCancel(int bookNo, int payPoint, int savePoint, int userNo) {
		Connection conn = getConnection();
		int bookCancel = new BookDao().bookCancel(conn, bookNo);
		if(bookCancel > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		Book book = new BookDao().selectBookCancel(conn, bookNo);
		int paymentCancel = new BookDao().paymentCancel(conn, bookNo, book);
		int payPointCancel = 1;
		int pointNow = new BookDao().selectPoint(conn, userNo);
		if(payPoint > 0) {
			payPointCancel = new BookDao().payPointCancel(conn, bookNo, book, pointNow, payPoint);
			pointNow = new BookDao().selectPoint(conn, userNo);
		}
		int savePointCancel = new BookDao().savePointCancel(conn, bookNo, book, pointNow, savePoint);
		if(bookCancel * paymentCancel * payPointCancel * savePointCancel > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return book;
	}

	public ArrayList<BookMenu> selectBookMenuList(int bookNo) {
		Connection conn = getConnection();
		return new BookDao().selectBookMenuList(conn, bookNo);
	}

}
