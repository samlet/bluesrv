package com.bluecc.bluesrv.bot;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bluecc.bluesrv.bot.entity.Users;
import com.bluecc.bluesrv.bot.mapper.UsersMapper;
import com.bluecc.bluesrv.bot.service.IUsersService;
import com.bluecc.bluesrv.foo.bean.User;
import com.bluecc.bluesrv.foo.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
public class BotTest {

    @Autowired
    private UsersMapper usersMapper;
    @Autowired
    private IUsersService usersService;

    @Test
    public void testSelect() {
        System.out.println(("----- selectAll method test ------"));
        List<Users> userList = usersMapper.selectList(null);
        assertTrue(userList.size()>1);
        userList.forEach(System.out::println);
    }

    @Test
    public void testSelectPage() {
        QueryWrapper<Users> wrapper = new QueryWrapper<>();
        wrapper.eq("name", "samlet");

        int pageSize = 5;
        Page<Users> page = new Page<Users>(1, pageSize);
        IPage<Users> userList = usersMapper.selectPage(page, wrapper);

        System.out.println("total pages: "+userList.getPages());
        System.out.println("has-next: "+page.hasNext());

        for (int i = 1; i <= page.getPages(); ++i) {
            page = new Page<Users>(i, pageSize);
            userList = usersMapper.selectPage(page, wrapper);

            for (Users record : userList.getRecords()) {
                System.out.println("\t"+record);
            }

            System.out.format("- page %d end -\n", i);
        }
    }

    @Test
    void testSelectId(){
        Users user=usersMapper.selectById(1);
        System.out.println(user);
    }

    @Test
    void testUsersService(){
        Users user=usersService.getById(1);
        System.out.println(user);

        Users newUser=new Users();
        newUser.setName("foo");
        newUser.setFullname("foo bar");
        usersService.save(newUser);
    }

    @Test
    void testUserUpdate(){
        usersService.update().eq("name", "foo").remove();
    }

    /*
    @Test
    void testPage(){
//        QueryWrapper<Users> wrapper = new QueryWrapper<>();
////        wrapper.eq("t.company_id", 1);
//        wrapper.eq("name", "samlet");
        int pageSize = 5;
        Page<Users> page = new Page<Users>(1, pageSize);
        System.out.println(page.getTotal());
//        List<Users> userList = usersService.selectUserPage(page, wrapper);
//        IPage<Users> userList = usersService.selectUserPage(page, pageSize);
        for (int i = 1; i <= page.getPages(); ++i) {
//            page = new Page<Users>(i, pageSize);
//            IPage<Users> userList = usersService.selectUserPage(page, wrapper);
            IPage<Users> userList = usersService.selectUserPage(page, i);
            System.out.printf("==========================>共%d条数据,当前显示第%d页，每页%d条，共%d页====================================>\n", page.getTotal(), page.getCurrent(), page.getSize(), page.getPages());
//            userList.forEach(System.out::println);
            userList.getRecords().forEach(System.out::println);
        }
    }
     */
}

