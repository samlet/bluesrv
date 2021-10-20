package com.bluecc.client;

import com.bluecc.bluesrv.bot.entity.Users;
import com.google.gson.Gson;
import kong.unirest.HttpResponse;
import kong.unirest.Unirest;

import java.util.concurrent.CompletableFuture;

public class SimpleRestClient {
    public static void main(String[] args) throws InterruptedException {
//        Gson gson=new Gson();

        Users user=new Users();
        user.setName("samlet");
        user.setFullname("Samlet Wu");

        HttpResponse<String> response = Unirest.post("http://localhost:8088/bot/users/")
                .header("Content-Type", "application/json")
//                .body(gson.toJson(user))
                .body(user)
                .asString();
        System.out.println(response.getBody());

        // create
        Users ro=Unirest.post("http://localhost:8088/bot/users/")
                .header("Content-Type", "application/json")
                .body(user)
                .asObject(Users.class)
                .getBody();
        System.out.println(ro);

        // read
        ro=Unirest.get("http://localhost:8088/bot/users/1")
                .header("Content-Type", "application/json")
                .asObject(Users.class)
                .getBody();
        System.out.println(ro);

        // read async
        /*
        CompletableFuture<HttpResponse<Users>> future =Unirest.get("http://localhost:8088/bot/users/1")
                .header("Content-Type", "application/json")
                .asObjectAsync(Users.class, resp -> {
                    int code = resp.getStatus();
                    System.out.println(code);
                    System.out.println("async get -> "+resp.getBody());
                });
        System.out.println("done: "+future.isDone());
        Thread.sleep(500);
        System.out.println("done: "+future.isDone());
        */

        // update
        HttpResponse<String> resp = Unirest.put("http://localhost:8088/bot/users/")
                .header("Content-Type", "application/json")
                .body(ro)
                .asString();
        System.out.println(resp.getBody());
    }
}

