package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.BaseAttrInfo;
import com.bluecc.bluesrv.gmall.service.IBaseAttrInfoService;

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
 *  BaseAttrInfoController
 *  <pre>
 *  $ curl localhost:8088/gmall/base_attr_info/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/base_attr_info")
public class BaseAttrInfoController {
    private static final Logger logger = LoggerFactory.getLogger(BaseAttrInfoController.class);

    @Autowired
    private IBaseAttrInfoService baseAttrInfoService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<BaseAttrInfo> create(@RequestBody BaseAttrInfo o)
            throws URISyntaxException {
        boolean createdStudent = baseAttrInfoService.save(o);
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
    public ResponseEntity<BaseAttrInfo> read(@PathVariable Integer id) {
        BaseAttrInfo found= baseAttrInfoService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody BaseAttrInfo o) {
        boolean updated = baseAttrInfoService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = baseAttrInfoService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


