package com.ler.lercommon.service;

import com.ler.lercommon.model.entity.InterfaceInfo;


/**
* @author ler
* @description 针对表【interface_info(接口信息)】的数据库操作Service
* @createDate 2024-05-11 16:06:32
*/
public interface InnerInterfaceInfoService {

    /**
     * 从数据库中查询模拟接口是否存在（请求路径、请求方法、请求参数）
     */
    InterfaceInfo getInterfaceInfo(String path, String method);
}
