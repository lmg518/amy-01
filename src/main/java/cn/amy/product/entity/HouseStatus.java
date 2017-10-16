package cn.amy.product.entity;

import java.math.BigDecimal;
import java.util.Date;

public class HouseStatus {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column house_status.status_id
     *
     * @mbggenerated
     */
    private String statusId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column house_status.house_info_id
     *
     * @mbggenerated
     */
    private String houseInfoId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column house_status.title
     *
     * @mbggenerated
     */
    private String title;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column house_status.date_time
     *
     * @mbggenerated
     */
    private Date dateTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column house_status.price
     *
     * @mbggenerated
     */
    private BigDecimal price;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column house_status.row_num
     *
     * @mbggenerated
     */
    private Integer rowNum;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column house_status.status_id
     *
     * @return the value of house_status.status_id
     *
     * @mbggenerated
     */
    public String getStatusId() {
        return statusId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column house_status.status_id
     *
     * @param statusId the value for house_status.status_id
     *
     * @mbggenerated
     */
    public void setStatusId(String statusId) {
        this.statusId = statusId == null ? null : statusId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column house_status.house_info_id
     *
     * @return the value of house_status.house_info_id
     *
     * @mbggenerated
     */
    public String getHouseInfoId() {
        return houseInfoId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column house_status.house_info_id
     *
     * @param houseInfoId the value for house_status.house_info_id
     *
     * @mbggenerated
     */
    public void setHouseInfoId(String houseInfoId) {
        this.houseInfoId = houseInfoId == null ? null : houseInfoId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column house_status.title
     *
     * @return the value of house_status.title
     *
     * @mbggenerated
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column house_status.title
     *
     * @param title the value for house_status.title
     *
     * @mbggenerated
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column house_status.date_time
     *
     * @return the value of house_status.date_time
     *
     * @mbggenerated
     */
    public Date getDateTime() {
        return dateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column house_status.date_time
     *
     * @param dateTime the value for house_status.date_time
     *
     * @mbggenerated
     */
    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column house_status.price
     *
     * @return the value of house_status.price
     *
     * @mbggenerated
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column house_status.price
     *
     * @param price the value for house_status.price
     *
     * @mbggenerated
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column house_status.row_num
     *
     * @return the value of house_status.row_num
     *
     * @mbggenerated
     */
    public Integer getRowNum() {
        return rowNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column house_status.row_num
     *
     * @param rowNum the value for house_status.row_num
     *
     * @mbggenerated
     */
    public void setRowNum(Integer rowNum) {
        this.rowNum = rowNum;
    }
}