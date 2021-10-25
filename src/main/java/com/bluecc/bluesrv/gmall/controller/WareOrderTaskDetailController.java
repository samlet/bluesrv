package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.WareOrderTaskDetail;
import com.bluecc.bluesrv.gmall.service.IWareOrderTaskDetailService;

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
 *  WareOrderTaskDetailController
 *  <pre>
 *  $ curl localhost:8088/gmall/ware_order_task_detail/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/ware_order_task_detail")
public class WareOrderTaskDetailController {
    private static final Logger logger = LoggerFactory.getLogger(WareOrderTaskDetailController.class);

    @Autowired
    private IWareOrderTaskDetailService wareOrderTaskDetailService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<WareOrderTaskDetail> create(@RequestBody WareOrderTaskDetail o)
            throws URISyntaxException {
        boolean createdStudent = wareOrderTaskDetailService.save(o);
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
    public ResponseEntity<WareOrderTaskDetail> read(@PathVariable Integer id) {
        WareOrderTaskDetail found= wareOrderTaskDetailService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody WareOrderTaskDetail o) {
        boolean updated = wareOrderTaskDetailService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = wareOrderTaskDetailService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


