package cn.amy.product.dao.mapper;

import cn.amy.product.entity.HotActivity;

public interface HotActivityMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hot_activity
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String hotActivityId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hot_activity
     *
     * @mbggenerated
     */
    int insert(HotActivity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hot_activity
     *
     * @mbggenerated
     */
    int insertSelective(HotActivity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hot_activity
     *
     * @mbggenerated
     */
    HotActivity selectByPrimaryKey(String hotActivityId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hot_activity
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(HotActivity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hot_activity
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(HotActivity record);
}