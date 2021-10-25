package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.BaseFrontendParam;
import com.bluecc.bluesrv.gmall.service.IBaseFrontendParamService;

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
 *  BaseFrontendParamController
 *  <pre>
 *  $ curl localhost:8088/gmall/base_frontend_param/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/base_frontend_param")
public class BaseFrontendParamController {
    private static final Logger logger = LoggerFactory.getLogger(BaseFrontendParamController.class);

    @Autowired
    private IBaseFrontendParamService baseFrontendParamService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<BaseFrontendParam> create(@RequestBody BaseFrontendParam o)
            throws URISyntaxException {
        boolean createdStudent = baseFrontendParamService.save(o);
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
    public ResponseEntity<BaseFrontendParam> read(@PathVariable Integer id) {
        BaseFrontendParam found= baseFrontendParamService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody BaseFrontendParam o) {
        boolean updated = baseFrontendParamService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = baseFrontendParamService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


