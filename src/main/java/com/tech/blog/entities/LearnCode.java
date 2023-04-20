/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author akn
 */
public class LearnCode {
    private int lId;
    String cTitle,siteName,siteLink,ytLink;

    public LearnCode(int lId, String cTitle, String siteName, String siteLink, String ytLink) {
        this.lId = lId;
        this.cTitle = cTitle;
        this.siteName = siteName;
        this.siteLink = siteLink;
        this.ytLink = ytLink;
    }

    public LearnCode(String cTitle, String siteName, String siteLink, String ytLink) {
        this.cTitle = cTitle;
        this.siteName = siteName;
        this.siteLink = siteLink;
        this.ytLink = ytLink;
    }

    public LearnCode() {
    }

    public int getlId() {
        return lId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }

    public String getcTitle() {
        return cTitle;
    }

    public void setcTitle(String cTitle) {
        this.cTitle = cTitle;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getSiteLink() {
        return siteLink;
    }

    public void setSiteLink(String siteLink) {
        this.siteLink = siteLink;
    }

    public String getYtLink() {
        return ytLink;
    }

    public void setYtLink(String ytLink) {
        this.ytLink = ytLink;
    }
    
    
}
