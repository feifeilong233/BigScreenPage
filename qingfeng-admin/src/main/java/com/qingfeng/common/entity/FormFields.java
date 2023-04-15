package com.qingfeng.common.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class FormFields implements Serializable {
    private String road_name;
    private String short_name;
    private List<RoadDetail> road_detail;
}
