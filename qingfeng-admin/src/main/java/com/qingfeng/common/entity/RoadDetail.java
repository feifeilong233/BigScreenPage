package com.qingfeng.common.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class RoadDetail implements Serializable {
    private String name;
    private String classify;
    private String remark;
    private String code;
    private String short_name;
    private String parent_id;
    private String order_by;
}
