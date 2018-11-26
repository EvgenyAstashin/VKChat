package com.vk.sdk.api.methods;

import android.util.Log;

import com.vk.sdk.api.VKParameters;
import com.vk.sdk.api.VKParser;
import com.vk.sdk.api.VKRequest;
import com.vk.sdk.api.model.VKApiUserFull;
import com.vk.sdk.api.model.VKList;

import org.json.JSONObject;

public class VKApiAccount extends VKApiBase {

    public VKRequest setOnline() {
        return prepareRequest("setOnline", null);
    }

    public VKRequest setOffline() {
        return prepareRequest("setOffline", null);
    }

    public VKRequest getProfileInfo() {
        return prepareRequest("getProfileInfo", null, new VKParser() {
            @Override
            public Object createModel(JSONObject object) {
                return new VKList<>(object, VKApiUserFull.class);
            }
        });
    }

    public VKRequest registerDevice(VKParameters params) {
        VKRequest request = prepareRequest("registerDevice", params);
        Log.e("vk_firebase", "onComplete: " + request);
        return request;
    }

    public VKRequest getPushSettings(VKParameters params) {
        return prepareRequest("getPushSettings", params);
    }


    @Override
    protected String getMethodsGroup() {
        return "account";
    }
}
