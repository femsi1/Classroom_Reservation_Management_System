package com.em.dao;

import com.em.domain.PagingVO;
import com.em.domain.Reservation;
import com.em.domain.ReservationCustom;
import com.em.domain.ReservationVo;

import java.util.List;


public interface ReservationMapper {
    public Integer reservationCount();

    public List<ReservationVo> findByPaging(PagingVO pagingVO);

    public List<Reservation> findByName(String name);

    public Integer reservationPassCount();

    public List<ReservationVo> findRecord(PagingVO pagingVO);

    public void reviewReservation(Integer id);

    public List<ReservationVo> findRejectRecord(PagingVO pagingVO);

    public void reservationNoPassCount(Integer id);

    public Integer reserveCount();

    public List<ReservationVo> findAllByPaging(PagingVO pagingVO);

    public void addReservation(ReservationCustom reservationCustom);

    public List<ReservationVo> queryByUser(String name);

    public List<ReservationCustom> findByUser(String name);

    public void cancelApplication(Integer id);

	public void rejectReservation(Integer id);

	public List<ReservationVo> findRejectRecord(Integer toPageNo);

	public Integer reservationNoPassCount();
}
