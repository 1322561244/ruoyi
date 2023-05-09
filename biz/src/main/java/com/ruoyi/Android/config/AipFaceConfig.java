package com.ruoyi.Android.config;
import com.baidu.aip.face.AipFace;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AipFaceConfig {

    @Value("${baidu.app_id}")
    private String APP_ID;
    @Value("${baidu.api_key}")
    private String API_KEY;
    @Value("${baidu.secret_key}")
    private String SECRET_KEY;

    @Bean
    public AipFace aipFaceClient() {
        // 初始化一个AipFace
        AipFace client = new AipFace(APP_ID, API_KEY, SECRET_KEY);

        // 配置超时时间
        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);

        return client;
    }
}