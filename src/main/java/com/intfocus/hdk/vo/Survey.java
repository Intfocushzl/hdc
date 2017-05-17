package com.intfocus.hdk.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.intfocus.hdk.util.ComUtil;

public class Survey {
    private Integer id;

    private String proId;

    private String proName;
    
    private String surId;
    
    private String order;

    private String shopId;
    
    private String shopName;
    
    private String shopMerStation;

    private String surNetwork;

    private String surPower;

    private String surVip;

    private String surVipData;

    private String attachmentUrl;
    
    private String createdAt;

    private String updatedAt;

    private String surRemarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId == null ? null : proId.trim();
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId == null ? null : shopId.trim();
    }

    public String getSurNetwork() {
        return surNetwork;
    }

    public void setSurNetwork(String surNetwork) {
        this.surNetwork = surNetwork == null ? null : surNetwork.trim();
    }

    public String getSurPower() {
        return surPower;
    }

    public void setSurPower(String surPower) {
        this.surPower = surPower == null ? null : surPower.trim();
    }

    public String getSurVip() {
        return surVip;
    }

    public void setSurVip(String surVip) {
        this.surVip = surVip == null ? null : surVip.trim();
    }

    public String getSurVipData() {
        return surVipData;
    }

    public void setSurVipData(String surVipData) {
        this.surVipData = surVipData == null ? null : surVipData.trim();
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return (null == this.updatedAt ?null : ComUtil.dateFormat(this.updatedAt.toString()));
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getSurRemarks() {
        return surRemarks;
    }

    public void setSurRemarks(String surRemarks) {
        this.surRemarks = surRemarks == null ? null : surRemarks.trim();
    }

	public String getSurId() {
		return surId;
	}

	public void setSurId(String surId) {
		this.surId = surId;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getShopMerStation() {
		return shopMerStation;
	}

	public void setShopMerStation(String shopMerStation) {
		this.shopMerStation = shopMerStation;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getAttachmentUrl() {
		return attachmentUrl;
	}

	public void setAttachmentUrl(String attachmentUrl) {
		this.attachmentUrl = attachmentUrl;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}


}