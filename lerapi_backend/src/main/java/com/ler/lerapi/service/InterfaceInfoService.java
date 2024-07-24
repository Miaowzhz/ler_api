package com.ler.lerapi.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.ler.lercommon.model.entity.InterfaceInfo;

/**
* @author 仵明雨
* @description 针对表【interface_info(接口信息)】的数据库操作Service
* @createDate 2024-05-11 16:06:32
*/
public interface InterfaceInfoService extends IService<InterfaceInfo> {
    /**
     * 校验
     *
     * @param interfaceInfo
     * @param add 是否为创建校验
     */
    void validInterfaceInfo(InterfaceInfo interfaceInfo, boolean add);
}
