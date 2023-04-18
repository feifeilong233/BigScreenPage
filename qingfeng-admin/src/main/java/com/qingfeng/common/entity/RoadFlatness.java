package com.qingfeng.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName("road_structure")
public class RoadFlatness {
    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.INPUT)
    private String id;

    /**
     * 周期名称
     */
    @TableField("name")
    private String name;

    /**
     * 周期平整度
     */
    @TableField("value")
    private BigDecimal value;

    /**
     * 所属路面id
     */
    @TableField("pid")
    private String pid;

    /**
     * 所属路面名称
     */
    @TableField("pid_name")
    private String pid_name;
}
