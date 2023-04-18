package com.em.service;

import com.em.domain.Room;

import java.util.List;


public interface RoomService {
    /**
     * 获取教室总数
     * @return
     */
    public Integer roomCount();

    /**
     * 获取分页查询教室信息
     * @param toPageNo
     * @return
     * @throws Exception
     */
    List<Room> findByPaging(Integer toPageNo) throws Exception;

    /**
     * 添加教室信息
     * @param room
     * @throws Exception
     */
    public void add(Room room) throws Exception;

    /**
     * 根据id查询教室信息
     * @param id
     * @return
     * @throws Exception
     */
    public Room findById(Integer id) throws Exception;

    /**
     * 根据id更新教室信息
     * @param room  输入Room对象(包含id,name,message属性)
     * @throws Exception
     */
    public void updateById(Room room) throws Exception;

    /**
     * 根据id删除教室信息
     * @param id
     * @throws Exception
     */
    public void removeById(Integer id) throws Exception;

    /**
     * 根据名字模糊查询教室信息
     * @param name
     * @return
     * @throws Exception
     */
    public List<Room> findByName(String name) throws Exception;

    /**
     * 获取所有教室的名称
     * @return
     * @throws Exception
     */
    public List<Room> nameList() throws Exception;
}
