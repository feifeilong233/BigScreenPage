package com.qingfeng.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @ProjectName UserOrganize
 * @author Administrator
 * @version 1.0.0
 * @Description 用户组织信息
 * @createTime 2022/1/20 0020 0:09
 */
@Data
@TableName("system_user_organize")
public class UserOrganize implements Serializable {

    private static final long serialVersionUID = -3166012934498268403L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.INPUT)
    private String id;
    /**
     * 用户id
     */
    @TableField(value = "user_id")
    private String user_id;
    /**
     * 组织id
     */
    @TableField(value = "organize_id")
    private String organize_id;

    /**
     * 类型
     */
    @TableField(value = "type")
    private String type;
    /**
     * 职务
     */
    @TableField(value = "position")
    private String position;
    /**
     * 数据权限组织
     */
    @TableField(value = "authOrgIds")
    private String authOrgIds;
    /**
     * 数据权限参数
     */
    @TableField(value = "authParams")
    private String authParams;
    /**
     * 使用状态
     */
    @TableField(value = "use_status")
    private String use_status;

    /**
     * 排序
     */
    @TableField(value = "order_by")
    private String order_by;

    /**
     * 创建人
     */
    @TableField(value = "create_user")
    private String create_user;
    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    private String create_time;
    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    private String update_time;

    @TableField(exist = false)
    private String organize_name;
    @TableField(exist = false)
    private String org_cascade;

}