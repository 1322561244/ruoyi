package com.ruoyi.Android.controller;

//import com.baidu.aip.face.AipFace;
//import com.ruoyi.Android.domain.AppPassenger;
//import com.ruoyi.Android.service.IAppFaceService;
import com.ruoyi.common.core.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;


@RestController
@RequestMapping("/app/appFace")
public class AppFaceController extends BaseController {

//    // 在Baidu AI开放平台申请的应用ID、API Key和Secret Key，在此省略
//    private static final String APP_ID = "your_app_id";
//    private static final String API_KEY = "your_api_key";
//    private static final String SECRET_KEY = "your_secret_key";
//
//
//    @Autowired
//    private IAppFaceService appFaceService;
//
//
//    @PostMapping("/check")
//    public String check(@RequestParam("passengerId") Long passengerId,
//                        @RequestParam("reservationId") Long reservationId) throws Exception {
//        // 根据乘客ID从数据库中获取三张照片信息
//        AppPassenger appPassenger = appFaceService.findByPassengerId(passengerId);
//
//        String photo1 = appPassenger.getPassengerPhoto1();
//        String photo2 = appPassenger.getPassengerPhoto2();
//        String photo3 = appPassenger.getPassengerPhoto3();
//
//        // 初始化AipFace
//        AipFace client = new AipFace(APP_ID, API_KEY, SECRET_KEY);
//        client.setConnectionTimeoutInMillis(2000);
//        client.setSocketTimeoutInMillis(60000);
//
//        // 定义请求参数
//        HashMap<String, Object> options = new HashMap<>();
//        options.put("face_field", "age,beauty");// 需要检测的属性
//        options.put("max_face_num", 1);// 最多检测人脸数目
//        options.put("face_type", "LIVE");// 活体检测
//
//        // 对每张照片进行识别
//        org.json.JSONObject result1 = client.detect(photo1, "BASE64", options);
//        org.json.JSONObject result2 = client.detect(photo2, "BASE64", options);
//        org.json.JSONObject result3 = client.detect(photo3, "BASE64", options);
//
//        //这里需要改一下如果成功了需要更新乘客的预约状态改为上车
//        appFaceService.updateReservationStatus(reservationId);
//
//        // 识别结果：返回JSON格式字符串
//        return result1.toString() + result2.toString() + result3.toString();
//    }
}
