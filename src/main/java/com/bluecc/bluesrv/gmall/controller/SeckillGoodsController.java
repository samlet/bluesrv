package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.SeckillGoods;
import com.bluecc.bluesrv.gmall.service.ISeckillGoodsService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.net.URISyntaxException;

/**
 * <p>
 *  SeckillGoodsController
 *  <pre>
 *  $ curl localhost:8088/gmall/seckill_goods/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/seckill_goods")
public class SeckillGoodsController {
    private static final Logger logger = LoggerFactory.getLogger(SeckillGoodsController.class);

    @Autowired
    private ISeckillGoodsService seckillGoodsService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<SeckillGoods> create(@RequestBody SeckillGoods o)
            throws URISyntaxException {
        boolean createdStudent = seckillGoodsService.save(o);
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
    public ResponseEntity<SeckillGoods> read(@PathVariable Integer id) {
        SeckillGoods found= seckillGoodsService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody SeckillGoods o) {
        boolean updated = seckillGoodsService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = seckillGoodsService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


