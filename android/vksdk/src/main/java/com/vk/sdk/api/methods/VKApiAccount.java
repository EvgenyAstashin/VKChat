package com.vk.sdk.api.methods;

import com.vk.sdk.api.VKParameters;
import com.vk.sdk.api.VKParser;
import com.vk.sdk.api.VKRequest;
import com.vk.sdk.api.model.VKApiUserFull;
import com.vk.sdk.api.model.VKList;

import org.json.JSONObject;

public class VKApiAccount extends VKApiBase {

    public VKRequest getProfileInfo() {
        return prepareRequest("getProfileInfo", null, new VKParser() {
            @Override
            public Object createModel(JSONObject object) {
                return new VKList<>(object, VKApiUserFull.class);
            }
        });
    }


    @Override
    protected String getMethodsGroup() {
        return "account";
    }
}
