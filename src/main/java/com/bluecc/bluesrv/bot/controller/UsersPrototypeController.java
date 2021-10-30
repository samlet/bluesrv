package com.bluecc.bluesrv.bot.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bluecc.bluesrv.bot.entity.Users;
import com.bluecc.bluesrv.bot.mapper.UsersMapper;
import com.bluecc.bluesrv.bot.service.IUsersService;
import com.bluecc.bluesrv.common.AbstractController;
import com.bluecc.bluesrv.common.PageData;
import com.bluecc.bluesrv.common.PageQueryData;
import com.bluecc.bluesrv.common.PageResultData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

/**
 * <p>
 * UsersController
 * <pre>
 *  $ curl localhost:8088/bot/users/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-17
 */
@RestController
@RequestMapping("/bot/users_proto")
public class UsersPrototypeController extends AbstractController {
    private static final Logger logger = LoggerFactory.getLogger(UsersPrototypeController.class);

    @Autowired
    private IUsersService usersService;
    @Autowired
    private UsersMapper usersMapper;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping() {
        return "pong";
    }

    @GetMapping("/total_pages/{pageSize}")
    public ResponseEntity<PageData> totalPages(@PathVariable Integer pageSize) {
        QueryWrapper<Users> wrapper = new QueryWrapper<>();
        Page<Users> page = new Page<>(1, pageSize);
        IPage<Users> userList = usersMapper.selectPage(page, wrapper);

        return ResponseEntity.ok(PageData.builder()
                .pageSize(userList.getPages())
                .build());
    }

    @GetMapping("/page/{pageSize}/{pageNo}")
    public ResponseEntity<List<Users>> totalPages(@PathVariable Integer pageSize,
                                                  @PathVariable Integer pageNo) {
        QueryWrapper<Users> wrapper = new QueryWrapper<>();
        Page<Users> page = new Page<>(pageNo, pageSize);
        IPage<Users> userList = usersMapper.selectPage(page, wrapper);

        return ResponseEntity.ok(userList.getRecords());
    }

    @PostMapping("/query")
    public ResponseEntity<PageResultData<Users>> query(@RequestBody PageQueryData queryData) {
        QueryWrapper<Users> wrapper = convertQueryWrapper(queryData);

        Page<Users> page = new Page<>(queryData.getPageNo(), queryData.getPageSize());
        IPage<Users> userList = usersMapper.selectPage(page, wrapper);
        queryData.setTotalPages(page.getPages());
        return ResponseEntity.ok(PageResultData.<Users>builder()
                        .meta(queryData)
                        .records(userList.getRecords()).build());
    }

    @PostMapping("/")
    public ResponseEntity<Users> create(@RequestBody Users o)
            throws URISyntaxException {
        boolean createdStudent = usersService.save(o);
        if (!createdStudent) {
            return ResponseEntity.notFound().build();
        } else {
            URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
                    .path("/{id}")
                    .buildAndExpand(o.getId())
                    .toUri();

            return ResponseEntity.created(uri)
                    .body(o);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Users> read(@PathVariable Integer id) {
        Users found = usersService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody Users o) {
        boolean updated = usersService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = usersService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


/*
https://www.baeldung.com/spring-boot-json
 */
