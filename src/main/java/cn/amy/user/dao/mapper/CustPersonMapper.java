package cn.amy.user.dao.mapper;

import cn.amy.user.entity.CustPerson;

public interface CustPersonMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CUST_PERSON
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String landlordId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CUST_PERSON
     *
     * @mbggenerated
     */
    int insert(CustPerson record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CUST_PERSON
     *
     * @mbggenerated
     */
    int insertSelective(CustPerson record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CUST_PERSON
     *
     * @mbggenerated
     */
    CustPerson selectByPrimaryKey(String landlordId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CUST_PERSON
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(CustPerson record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CUST_PERSON
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(CustPerson record);
}