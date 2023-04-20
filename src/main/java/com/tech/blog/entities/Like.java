/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author akn
 */
public class Like {
    private int lId,pId,uId;

    public Like(int lId, int pId, int uId) {
        this.lId = lId;
        this.pId = pId;
        this.uId = uId;
    }

    public Like(int pId, int uId) {
        this.pId = pId;
        this.uId = uId;
    }

    public Like() {
    }

    public int getlId() {
        return lId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }
    
    
}
