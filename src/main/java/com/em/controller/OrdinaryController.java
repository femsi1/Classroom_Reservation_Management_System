package com.em.controller;

import com.em.domain.*;
import com.em.service.ReservationService;
import com.em.service.RoomService;
import com.em.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/ordinary")
public class OrdinaryController {

	@Resource(name = "roomServiceImpl")
	private RoomService roomService;

	@Resource(name = "reservationServiceImpl")
	private ReservationService reservationService;

	@Resource(name = "userServiceImpl")
	private UserService userService;

	/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<教室信息管理>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
	// 教室信息显示
	@RequestMapping("/showRoom")
	public String showRoom(Model model, Integer page) throws Exception {

		List<Room> list = null;
		//页码对象
		PagingVO pagingVO = new PagingVO();
		//设置总页数
		pagingVO.setTotalCount(roomService.roomCount());
		if (page == null || page == 0) {
			pagingVO.setToPageNo(1);
			list = roomService.findByPaging(1);
		} else {
			pagingVO.setToPageNo(page);
			list = roomService.findByPaging(page);
		}

		model.addAttribute("roomList", list);
		model.addAttribute("pagingVO", pagingVO);

		return "/ordinary/showRoom";
	}

	//搜索教室
	@RequestMapping(value = "/queryRoom", method = {RequestMethod.POST})
	private String queryRoom(String findByName, Model model) throws Exception {

		List<Room> list = roomService.findByName(findByName);

		model.addAttribute("roomList", list);
		return "/ordinary/showRoom";
	}

	//个人信息修改
	@RequestMapping(value = "/showUser", method = {RequestMethod.GET})
	private String showUser(Model model,HttpServletRequest request) throws Exception {
		String id = String.valueOf(request.getSession().getAttribute("user"));
		User user = userService.findUserById(id);
		model.addAttribute("object", user);
		return "/ordinary/showUser";
	}

	//个人信息修改
	@RequestMapping(value = "/changeUser", method = {RequestMethod.POST})
	private String changeUser(String password, String username, Model model,HttpServletRequest request) throws Exception {
		String id = String.valueOf(request.getSession().getAttribute("user"));
		User user = userService.findUserById(id);
		user.setUsername(username);
		user.setPassword(password);
		userService.updateUser(user);
		model.addAttribute("object", user);
		return "/ordinary/showUser";
	}

	//查询接下来的15天内所有已被预约的教室记录
	@RequestMapping("/showRecord")
	public String findAllReservation(Model model, Integer page) throws Exception {
		List<ReservationVo> list = null;

		//页码对象
		PagingVO pagingVO = new PagingVO();
		//设置总页数
		pagingVO.setTotalCount(reservationService.reserveCount());
		if (page == null || page == 0) {
			pagingVO.setToPageNo(1);
			list = reservationService.findAllByPaging(1);
		} else {
			pagingVO.setToPageNo(page);
			list = reservationService.findAllByPaging(page);
		}

		model.addAttribute("recordList", list);
		model.addAttribute("pagingVo", pagingVO);

		return "/ordinary/showRecord";
	}

	//搜索借用人
	@RequestMapping(value = "/queryByUser", method = {RequestMethod.POST})
	private String queryUser(String findByName, Model model) throws Exception {

		List<ReservationVo> list = reservationService.queryByUser(findByName);

		model.addAttribute("recordList", list);

		return "/ordinary/showRecord";
	}

	//预约教室页面跳转
	@RequestMapping(value = "/reserveRoom", method = RequestMethod.GET)
	public String reserveRoomUI(Model model,HttpServletRequest request) throws Exception {
		//从数据库查询出所有教室信息回显到页面
		List<Room> list = roomService.nameList();
		model.addAttribute("nameList", list);
		User user = (User) request.getSession().getAttribute("usersession");
		model.addAttribute("object", user);
		return "/ordinary/reserveRoom";
	}

	//查询接下来的15天内所有已被预约的教室记录是否冲突
// // 1. 获取待预约的教室信息以及预约时间段
// String roomId = request.getParameter("roomId");
// String startTime = request.getParameter("startTime");
// String endTime = request.getParameter("endTime");
// long startTimestamp = Timestamp.valueOf(startTime).getTime();
// long endTimestamp = Timestamp.valueOf(endTime).getTime();

// // 2. 查询数据库中已有的预约记录
// List<Reservation> reservations = reservationService.getAllReservations();
// for (Reservation r : reservations) {
//     // 3. 判断待预约时间段是否与当前已有预约记录的时间段存在重叠
//     if (roomId.equals(r.getRoomId()) && startTimestamp < r.getEndTimestamp() && endTimestamp > r.getStartTimestamp()) {
//         // 发现冲突，需要进行处理
//         return "error";
//     }
// }

// // 4. 如果没有发现冲突，将待预约记录插入到数据库中
// Reservation reservation = new Reservation();
// reservation.setRoomId(roomId);
// reservation.setStartTime(startTime);
// reservation.setEndTime(endTime);
// reservationService.addReservation(reservation);
// return "success";

	@RequestMapping("/reserveRoom")
	public String findAllReservationTime(Model model, Integer page) throws Exception {
		List<ReservationVo> list = null;

		//页码对象
		PagingVO pagingVO = new PagingVO();
		//设置总页数
		pagingVO.setTotalCount(reservationService.reserveCount());
		if (page == null || page == 0) {
			pagingVO.setToPageNo(1);
			list = reservationService.findAllByPaging(1);
		} else {
			pagingVO.setToPageNo(page);
			list = reservationService.findAllByPaging(page);
		}

		model.addAttribute("recordList", list);
		model.addAttribute("pagingVo", pagingVO);

		return "/ordinary/reserveRoom";
	}

	//预约教室功能实现
	@RequestMapping(value = "/reserveRoom", method = RequestMethod.POST)
	public String reserveRoom(ReservationCustom reservationCustom) throws Exception {

		reservationService.addReservation(reservationCustom);

		return "redirect:/ordinary/showRecord";
	}

	//取消预约申请页面跳转
	@RequestMapping(value = "/cancelApplication",method = RequestMethod.GET)
	public String cancelApplicationUI(String user,Model model) throws Exception{
		List<ReservationCustom> list=reservationService.findByUser(user);
		model.addAttribute("reserveList",list);

		return "/ordinary/cancelApplication";
	}

	//取消预约申请业务实现
	@RequestMapping("/cancelApply")
	public String cancelApplication(Integer id) throws Exception{
		reservationService.cancelApplication(id);

		return "redirect:/ordinary/showRecord";
	}

//请求预约记录，使得其他申请时间段不能包含已经预约过的时间段，比如说a同学预约了教室a 3月14日的 9:00:00到10:00:00 同学b的预约时间就不包含a同学的预约过的时间段
//哪里有问题



	// @RequestMapping("/reserveRoom")
	// public String queryByTime(String roomName, String date, String time, Model model) throws Exception {
	// 	List<ReservationVo> list = reservationService.queryByTime(roomName, date, time);
	// 	model.addAttribute("recordList", list);
	// 	return "/ordinary/reserveRoom";
	// }



}
