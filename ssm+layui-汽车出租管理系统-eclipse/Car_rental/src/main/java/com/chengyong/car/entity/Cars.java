package com.chengyong.car.entity;

import com.chengyong.car.util.CarsVo;

public class Cars extends CarsVo{
    private String carnumber;

    private String cartype;

    private String color;

    private Short price;

    private Short rentprice;

    private Short deposit;

    private Short isrentiing;

    private String description;

    private String carimg;

    public String getCarnumber() {
        return carnumber;
    }

    public void setCarnumber(String carnumber) {
        this.carnumber = carnumber;
    }

    public String getCartype() {
        return cartype;
    }

    public void setCartype(String cartype) {
        this.cartype = cartype;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Short getPrice() {
        return price;
    }

    public void setPrice(Short price) {
        this.price = price;
    }

    public Short getRentprice() {
        return rentprice;
    }

    public void setRentprice(Short rentprice) {
        this.rentprice = rentprice;
    }

    public Short getDeposit() {
        return deposit;
    }

    public void setDeposit(Short deposit) {
        this.deposit = deposit;
    }

    public Short getIsrentiing() {
        return isrentiing;
    }

    public void setIsrentiing(Short isrentiing) {
        this.isrentiing = isrentiing;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCarimg() {
        return carimg;
    }

    public void setCarimg(String carimg) {
        this.carimg = carimg;
    }
}